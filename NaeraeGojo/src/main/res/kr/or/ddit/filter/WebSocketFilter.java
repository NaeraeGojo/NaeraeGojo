package kr.or.ddit.filter;

import java.io.IOException;
import java.security.Principal;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import kr.or.ddit.utils.PrincipalWithSession;

public class WebSocketFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		
		final PrincipalWithSession principal = new PrincipalWithSession(request.getSession());
		
		HttpServletRequestWrapper requestWrapper = new HttpServletRequestWrapper(request){

			@Override
			public Principal getUserPrincipal() {
				return principal;
			}
		};
		
		chain.doFilter(requestWrapper, servletResponse);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
