package kr.or.ddit.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.utils.SetContent;
//import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.EmpVO;


public class loginCheckFilter implements Filter{
	
	private List<String> whiteList;
	
	public loginCheckFilter() {
		whiteList = new ArrayList<String>();
//		whiteList.add("/");
		whiteList.add("/");
		whiteList.add("/user");
	}
	
	

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String uri = req.getRequestURI();
		
		if(!uri.contains("loginForm")&&!uri.contains("loginCheck")){
			HttpSession session = req.getSession();
			EmpVO ev = (EmpVO) session.getAttribute("LOGIN_EMPINFO");
			if( ev == null){
				String message = "로그인이 필요한 서비스입니다.";
				try {
					message = URLEncoder.encode(message, "utf-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				HttpServletResponse res = (HttpServletResponse) response;
				
				res.sendRedirect(req.getContextPath() + "/user/join/loginForm.do" +"?message=" +message );
				return;
			}
		}
		chain.doFilter(request, response);
	}
		@Override
		public void init(FilterConfig arg0) throws ServletException {
			// TODO Auto-generated method stub
			
		}



		@Override
		public void destroy() {
			// TODO Auto-generated method stub
			
		}
	}