package kr.or.ddit.freeboardans.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.freeboardans.service.IFreeboardAnsService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class FreeboardAnsController {
	@Resource
	private IFreeboardAnsService service;
	
	
	public ModelAndView freebaordAnsList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updateFreebaordAns(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertFreebaordAns() throws Exception{
		
		return null;
	}
	
	
	public String deleteFreebaordAns() throws Exception{
		
		return null;
	}
}

