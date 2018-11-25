package kr.or.ddit.inqryboard.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.inqryboard.service.IInqryboardService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/inqryboard/")
public class InqryboardController {
	@Resource
	private IInqryboardService service;
	
	@RequestMapping("inqryList")
	public void inqryList(){}
	@RequestMapping("inqryView")
	public void inqryView(){}
	@RequestMapping("inqryForm")
	public void inqryForm(){}
	@RequestMapping("inqryUpdate")
	public void inqryUpdate(){}
	
	
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

