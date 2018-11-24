package kr.or.ddit.utils;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class SetContent {
	
	public static void setPath(HttpServletRequest request) {
		String path = request.getServletPath();
		HttpSession session = request.getSession();
		session.setAttribute("path", path);
	}

	public static String getPath(HttpServletRequest request){
		HttpSession session = request.getSession();
		return (String) session.getAttribute("path");
	}
	
	public static String getPage(HttpServletRequest request) {
		String currentPage = (String) request.getParameter("currentPage");
		
		if(currentPage ==  null || currentPage == ""){
			currentPage = "1";
		}
		return currentPage;
	}

	public static Map<String, String> getParams(HttpServletRequest request) {
		Map<String, String> params = new HashMap<String, String>();
		
		String searchKeycode = (String) request.getParameter("search_keycode");
		String searchKeyword = (String) request.getParameter("search_keyword");

		if(searchKeyword != null && searchKeyword != ""){
			params.put("search_keycode", searchKeycode);
			params.put("search_keyword", searchKeyword);
		}
		return params;
	}

	public static Map<String, String> setParams(Map<String, String> params,
			RolePagingUtil paging) {
		String startNo = String.valueOf(paging.getStartCount());
		String endNo = String.valueOf(paging.getEndCount());
		
		params.put("startNo", startNo);
		params.put("endNo", endNo);
		return params;
	}

	
}
