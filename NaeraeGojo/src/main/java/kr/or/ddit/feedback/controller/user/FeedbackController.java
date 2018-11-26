package kr.or.ddit.feedback.controller.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.feedback.service.IFeedbackService;
import kr.or.ddit.vo.EmpVO;
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
	
	@RequestMapping("feedbackList")
	public ModelAndView feedbackList(ModelAndView andview, HttpServletRequest request, HttpSession session
						, Map<String, String> params) throws Exception{
	
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		
		String receivefeedCnt = service.getFeedbackCnt(params);  //받은 피드백 count
		List<FeedbackVO> receivefbList = service.receivefbList(params);
		
		andview.addObject("receivefeedCnt", receivefeedCnt); // 받은 피드백 count		
		andview.addObject("receivefbList", receivefbList); // 받은 피드백 리스트
		andview.setViewName("user/project/feedback/feedbackList");
		return andview;
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

