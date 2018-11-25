package kr.or.ddit.issuelv.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.issuelv.service.IIssueLvService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class IssueLvController {
	@Resource
	private IIssueLvService service;
	
	public ModelAndView issueLvList(HttpServletRequest request, HttpSession session) throws Exception{
		
		return null;
	}
}

