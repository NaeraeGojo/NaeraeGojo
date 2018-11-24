package kr.or.ddit.position.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.position.service.IPositionService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class PositionControllerAdm {
	@Resource
	private IPositionService service;
	
	
	public ModelAndView positionList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updatePosition(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertPosition() throws Exception{
		
		return null;
	}
	
	
	public String deletePosition() throws Exception{
		
		return null;
	}
}

