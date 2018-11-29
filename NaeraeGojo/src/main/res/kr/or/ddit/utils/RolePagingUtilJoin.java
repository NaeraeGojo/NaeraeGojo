package kr.or.ddit.utils;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;


import org.slf4j.Logger;
import org.springframework.stereotype.Component;

/**
 * @author Administrator
 *
 */
public class RolePagingUtilJoin {
	private int currentPage;        //현재 페이지 번호
	private int totalCount;         //전체 게시글의 갯수
	private int totalPage;          //전체 페이지의 갯수
	private int blockCount = 13;    //한 페이지당 출력될 게시글의 갯수
	private int blockPage = 5;		//페이지 별 출력될 페이지네이션 메뉴 갯수
	private int startPage;			//출력되는 페이지네이션 메뉴의 시작 페이지 번호
	private int endPage;			//출력되는 페이지네이션 메뉴의 마지막 페이지 번호
	private int startCount;			//해당 페이지에 출력되는 게시글의 시작번호
	private int endCount;			//해당 페이지에 출력되는 게시글의 마지막번호
	private String project_code;
	private StringBuffer pagingHtmls; //작성된 페이지네이션 컨텐츠 저장소
	private HttpServletRequest request;
	
	public RolePagingUtilJoin(int currentPage, int totalCount,
			HttpServletRequest request) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.request = request;
		
		pagingHtmls = new StringBuffer();
		
		makePagingHtmls();
	}
	
	public RolePagingUtilJoin(int currentPage, int totalCount,
			HttpServletRequest request, int blockCount) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.request = request;
		this.blockCount = blockCount;
		
		pagingHtmls = new StringBuffer();
		
		makePagingHtmls();
	}
	
	public RolePagingUtilJoin(int currentPage, int totalCount,
			HttpServletRequest request, String project_code) {
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.request = request;
		this.project_code = project_code;
		
		pagingHtmls = new StringBuffer();
		
		makePagingHtmls();
	}

	private void makePagingHtmls() {
		//총 페이지의 갯수
		this.totalPage = (int)Math.ceil(this.totalCount / (double)this.blockCount);
		
		if(this.totalPage == 0){
			this.totalPage = 1;
		}
		
		//페이지당 출력될 게시글의 시작 글번호, 마지막 글번호
		this.startCount = this.totalCount - (this.currentPage - 1) * this.blockCount;
		this.endCount = this.startCount - this.blockCount + 1;
		
		if(this.endCount < 0){
			this.endCount = 1;
		}
		
		//이전 |1|2|3|4|5| 다음
		//페이지네이션 메뉴의 시작 페이지번호, 마지막 페이지번호
		this.startPage = ((this.currentPage - 1) / this.blockPage * this.blockPage) + 1;
		this.endPage = this.startPage + this.blockPage - 1;
		
		if(this.endPage > this.totalPage){
			this.endPage = this.totalPage;
		}
				
		// /12/main.jsp		
		// /12/main.jsp?contentPage=/12/freeboard/freeboardList.jsp?currentPage=2		
		// /12/main.jsp?contentPage=/12/freeboard/freeboardList.jsp?currentPage=2&search_keycode=TOTAL&seach_keyword=a001
		
		//currentPage, search_keycode, search_keyword
		String params = "";
		Enumeration<String> paramKeys = request.getParameterNames();
//		while(paramKeys.hasMoreElements()){
//			String key = paramKeys.nextElement();
//			if("currentPage".intern() != key.intern()){
//				String value = request.getParameter(key);
//				//search_keycode = TOTAL & seach_keyword = a001 &  
//				params += key + "=" + value + "&";
//			}
//		}
		
		//이전 |1|2|3|4|5| 다음
		this.pagingHtmls.append("<div class='box-tools pull-right'>");
		this.pagingHtmls.append("<ul class='pagination pagination-sm inline'>");
		
		String requestURI = request.getRequestURI();
		
		//이전
		if((this.currentPage - 1) == 0){
			this.pagingHtmls.append("<li class='disabled'><a href='#'>&laquo;</a></li>");
		}else{
			this.pagingHtmls.append("<li><a href='" + requestURI + "?currentPage=" + (this.currentPage - 1) + "&project_code=" + (this.project_code) +"'>&laquo;</a></li>");
		}
		
		//|1|2|3|4|5|
		for (int i = this.startPage; i <= this.endPage; i++) {
			if(this.currentPage == i){
				this.pagingHtmls.append("<li class='active'><a href='#'>" + i + "</a></li>");
			}else{
				this.pagingHtmls.append("<li><a href='" + requestURI + "?currentPage=" + i + "&project_code=" + (this.project_code) +"'>" + i + "</a></li>");
			}
		}
		
		//다음
		if(this.currentPage < this.totalPage){
			this.pagingHtmls.append("<li><a href='" + requestURI + "?currentPage=" + (this.currentPage + 1) + "&project_code=" + (this.project_code) +"'>&raquo;</a></li>");
		}else{
			this.pagingHtmls.append("<li class='disabled'><a href='#'>&raquo;</a></li>");
		}
		
		this.pagingHtmls.append("</ul></div>");
	}

	public int getStartCount() {
		return startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public String getPagingHtmls() {
		return pagingHtmls.toString();
	}

	public String getProject_code() {
		return project_code;
	}
}
