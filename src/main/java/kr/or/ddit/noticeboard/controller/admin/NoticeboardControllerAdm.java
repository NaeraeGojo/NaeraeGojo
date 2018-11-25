package kr.or.ddit.noticeboard.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.noticeboard.service.INoticeboardService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class NoticeboardControllerAdm {
	@Resource
	private INoticeboardService service;
	
	
	public ModelAndView NoticeboardList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updateNoticeboard(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertNoticeboard() throws Exception{
		
		return null;
	}
	
	
	public String deleteNoticeboard() throws Exception{
		
		return null;
	}
}

