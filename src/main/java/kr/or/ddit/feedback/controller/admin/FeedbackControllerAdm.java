package kr.or.ddit.feedback.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;




import kr.or.ddit.feedback.service.IFeedbackService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class FeedbackControllerAdm {
	@Resource
	private IFeedbackService service;
	
	
	public ModelAndView feedbackList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updateFeedback(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertFeedback() throws Exception{
		
		return null;
	}
	
	
	public String deleteFeedback() throws Exception{
		
		return null;
	}
}

