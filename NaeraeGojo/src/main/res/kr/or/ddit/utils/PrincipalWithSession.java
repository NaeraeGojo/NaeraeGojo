package kr.or.ddit.utils;

import java.security.Principal;

import javax.servlet.http.HttpSession;

public class PrincipalWithSession implements Principal {

	private final HttpSession session;
	
	public PrincipalWithSession(HttpSession session){
		this.session = session;
	};
	
	@Override
	public String getName() {
		// 세션의 아이디
		return this.session.getId();
	}

	public HttpSession getSession() {
		return session;
	}
}
