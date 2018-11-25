package kr.or.ddit.inqryboard.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;




import kr.or.ddit.inqryboard.service.IInqryboardService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class InqryboardControllerAdm {
	
	@Resource
	private IInqryboardService service;
	
	
	public ModelAndView inqryboardList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updateInqryboard(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertInqryboard() throws Exception{
		
		return null;
	}
	
	
	public String deleteInqryboard() throws Exception{
		
		return null;
	}
}

