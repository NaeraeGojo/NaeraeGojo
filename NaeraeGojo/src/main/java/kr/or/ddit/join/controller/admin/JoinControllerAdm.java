package kr.or.ddit.join.controller.admin;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;




import kr.or.ddit.join.service.IJoinService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class JoinControllerAdm {
	@Resource
	private IJoinService service;
	
	
	public ModelAndView joinList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updateJoin(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertJoin() throws Exception{
		
		return null;
	}
	
	
	public String deleteJoin() throws Exception{
		
		return null;
	}
}

