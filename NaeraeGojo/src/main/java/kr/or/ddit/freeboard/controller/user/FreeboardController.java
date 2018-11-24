package kr.or.ddit.freeboard.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



import kr.or.ddit.freeboard.service.IFreeboardService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/project/freeboard")
public class FreeboardController {
	@Resource
	private IFreeboardService service;
	
	@RequestMapping("freeboardList")
	public void freeboardList(){}
	@RequestMapping("freeboardForm")
	public void freeboardForm(){}
	@RequestMapping("freeboardView")
	public void freeboardView(){}
	@RequestMapping("freeboardUpdate")
	public void freeboardUpdate(){}
	@RequestMapping("freeboardReply")
	public void freeboardReply(){}

	
	
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

