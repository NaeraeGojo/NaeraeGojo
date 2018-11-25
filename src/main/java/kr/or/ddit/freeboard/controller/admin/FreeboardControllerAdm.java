package kr.or.ddit.freeboard.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import kr.or.ddit.freeboard.service.IFreeboardService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class FreeboardControllerAdm {
	@Resource
	private IFreeboardService service;
	
	
	public ModelAndView freebaordList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updateFreebaord(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertFreebaord() throws Exception{
		
		return null;
	}
	
	
	public String deleteFreebaord() throws Exception{
		
		return null;
	}
}

