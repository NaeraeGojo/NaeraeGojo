package kr.or.ddit.part.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.part.service.IPartService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class PartControllerAdm {
	@Resource
	private IPartService service;
	
	
	public ModelAndView partList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updatePart(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertPart() throws Exception{
		
		return null;
	}
	
	
	public String deletePart() throws Exception{
		
		return null;
	}
}

