package kr.or.ddit.pblancboard.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.pblancboard.service.IPblancboardService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class PblancboardControllerAdm {
	@Resource
	private IPblancboardService service;
	
	
	public ModelAndView pblancboardList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updatePblancboard(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertPblancboard() throws Exception{
		
		return null;
	}
	
	
	public String deletePblancboard() throws Exception{
		
		return null;
	}
}

