package kr.or.ddit.mp.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.mp.service.IMpService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class MpControllerAdm {
	@Resource
	private IMpService service;
	
	public ModelAndView moList(HttpServletRequest request, HttpSession session) throws Exception{
		
		return null;
	}
}

