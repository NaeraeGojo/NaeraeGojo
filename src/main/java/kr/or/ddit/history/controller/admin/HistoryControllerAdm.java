package kr.or.ddit.history.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.history.service.IHistoryService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class HistoryControllerAdm {
	@Resource
	private IHistoryService service;
	
	
	public ModelAndView historyList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updateHistroy(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertHistroy() throws Exception{
		
		return null;
	}
	
	
	public String deleteHistroy() throws Exception{
		
		return null;
	}
}

