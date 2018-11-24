package kr.or.ddit.admin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.admin.service.IAdminService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("test")
public class AdminController {

	@Resource
	private IAdminService service;
	
	public ModelAndView adminList(HttpServletRequest request, HttpSession session) throws Exception{
		
		return null;
	}
	
	
	
}

