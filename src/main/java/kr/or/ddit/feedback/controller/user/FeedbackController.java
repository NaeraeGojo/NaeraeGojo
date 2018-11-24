package kr.or.ddit.feedback.controller.user;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.feedback.service.IFeedbackService;
import kr.or.ddit.vo.FeedbackVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/feedback/")
public class FeedbackController {
	@Resource
	private IFeedbackService service;
	
	
	@RequestMapping("receivefeedback")
	public ModelAndView receivefeedback(ModelAndView andView, String feedback_code, Map<String, String> params) throws Exception{
		
		params.put("feedback_code", feedback_code);
		
		FeedbackVO receiveInfo = service.feedbackInfo(params);
		
		andView.addObject("receiveInfo", receiveInfo);
		andView.setViewName("jsonConvertView"); 
		return andView;
	}
	
	@RequestMapping("feedbackCheck")
	public ModelAndView feedbackCheck(ModelAndView andView, String feedback_code, Map<String, String> params) throws Exception{
		
		params.put("feedback_code", feedback_code);
		
		service.fbAlarmCk(params);
		
		andView.setViewName("jsonConvertView"); 
		return andView;
	}
	
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

