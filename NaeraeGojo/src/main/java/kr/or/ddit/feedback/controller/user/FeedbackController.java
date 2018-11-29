package kr.or.ddit.feedback.controller.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.feedback.service.IFeedbackService;
import kr.or.ddit.utils.RolePagingUtil;
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
	public ModelAndView receivefeedback(ModelAndView andView, String feedback_code, HttpSession session, Map<String, String> params) throws Exception{
		
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		params.put("feedback_code", feedback_code);
		
		FeedbackVO receiveInfo = service.feedbackInfoRe(params);
		
		andView.addObject("receiveInfo", receiveInfo);
		andView.setViewName("jsonConvertView"); 
		return andView;
	}
	@RequestMapping("sendfeedback")
	public ModelAndView sendfeedback(ModelAndView andView, String feedback_code, HttpSession session, Map<String, String> params) throws Exception{
		
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		params.put("feedback_code", feedback_code);
		
		FeedbackVO receiveInfo = service.feedbackInfoSend(params);
		
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
	
	@RequestMapping("feedbackList1")
	public ModelAndView feedbackList(ModelAndView andview, HttpServletRequest request, HttpSession session
								, Map<String, String> params, String search_keycode
								, String search_keyword
								, String currentPage
								, String project_code) throws Exception{
		
		// 프로젝트 코드
		project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		// 로그인 아이디
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		
		String receivefeedCnt = service.getFeedbackCnt(params);  //받은 피드백 count
		
		currentPage = request.getParameter("currentPage");
		if(currentPage==null){
			currentPage="1";
		}
		
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(Integer.parseInt(currentPage), totalCount, request);
		
		params.put("startCount", String.valueOf(paging.getStartCount()));
		params.put("endCount", String.valueOf(paging.getEndCount()));
		
		List<FeedbackVO> receivefbList = service.receivefbList(params);
		
		andview.addObject("paging", paging.getPagingHtmls());
		andview.addObject("receivefeedCnt", receivefeedCnt); // 받은 피드백 count		
		andview.addObject("receivefbList", receivefbList); // 받은 피드백 리스트
		
		andview.setViewName("user/project/feedback/reFeedbackList");
		return andview;
	}
	
	@RequestMapping("feedbackInfo")
	public ModelAndView feedbackInfo( ModelAndView andView, Map<String, String> params, HttpServletRequest request
			   						, String feedback_code
			   						, HttpSession session
			   						, String project_code) throws Exception{
		
		
		// 로그인 아이디
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		
		project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		params.put("feedback_code", feedback_code);
		
		FeedbackVO receiveInfo1 = service.feedbackInfo2(params);
		
		andView.addObject("receiveInfo1", receiveInfo1);
		andView.setViewName("jsonConvertView"); 
		return andView;
		
	}
	
	@RequestMapping("feedbackConfirm")
	public ModelAndView feedbackConfirm( ModelAndView andView, Map<String, String> params, HttpServletRequest request
										, String feedback_code
										, HttpSession session
										, String project_code) throws Exception{
		
		project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		params.put("feedback_code", feedback_code);
		
		service.confirmStatus(params);  //읽음 표시로 변경
		
		FeedbackVO receiveInfo = service.feedbackInfo2(params);
		
		andView.addObject("receiveInfo", receiveInfo);
		andView.setViewName("jsonConvertView"); 
		return andView;
		
	}
	
	@RequestMapping("deleteReceive")
	public ModelAndView deleteReceive( ModelAndView andView, Map<String, String> params, HttpServletRequest request
										, String feedback_code
										, HttpSession session
										, String project_code) throws Exception{
									
		params.put("feedback_code", feedback_code);
		
		service.deleteReceive(params);
		
		FeedbackVO receiveInfo = service.feedbackInfo2(params);
		
		andView.addObject("receiveInfo", receiveInfo);
		andView.setViewName("jsonConvertView"); 
		return andView;
		
	}
	
	
	@RequestMapping("feedbackList2")
	public ModelAndView feedbackList2(ModelAndView andview, HttpServletRequest request, HttpSession session
								, Map<String, String> params, String search_keycode
								, String search_keyword
								, String currentPage
								, String project_code) throws Exception{
		
		// 프로젝트 코드
		project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		// 로그인 아이디
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		
		currentPage = request.getParameter("currentPage");
		if(currentPage==null){
			currentPage="1";
		}
		
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		int totalCount2 = service.totalCount2(params);
		
		RolePagingUtil paging2 = new RolePagingUtil(Integer.parseInt(currentPage), totalCount2, request);
		
		params.put("startCount", String.valueOf(paging2.getStartCount()));
		params.put("endCount", String.valueOf(paging2.getEndCount()));
		
		List<FeedbackVO> sendfbList = service.sendfbList(params);
		
		andview.addObject("paging2", paging2.getPagingHtmls());
		andview.addObject("sendfbList", sendfbList); // 보낸 피드백 리스트
		andview.setViewName("user/project/feedback/sendFeedbackList");
		return andview;
	}
	
	
	@RequestMapping("deleteSend")
	public ModelAndView deleteSend( ModelAndView andView, Map<String, String> params, HttpServletRequest request
			, String feedback_code
			, HttpSession session
			, String project_code) throws Exception{
		
		params.put("feedback_code", feedback_code);
		
		service.deleteSend(params);
		
		FeedbackVO sendInfo = service.sendfeedbackInfo(params);
		
		andView.addObject("sendInfo", sendInfo);
		andView.setViewName("jsonConvertView"); 
		return andView;
		
	}
	
	@RequestMapping("feedbackInfo2")
	public ModelAndView feedbackInfo2( ModelAndView andView, Map<String, String> params, HttpServletRequest request
			   						, String feedback_code
			   						, HttpSession session
			   						, String project_code) throws Exception{
		
		project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		// 로그인 아이디
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		
		params.put("feedback_code", feedback_code);
		
		FeedbackVO sendInfo2 = service.sendfeedbackInfo(params);
		
		andView.addObject("sendInfo2", sendInfo2);
		andView.setViewName("jsonConvertView"); 
		return andView;
		
	}
	
	@RequestMapping("insertFeedback")
	public ModelAndView insertFeedback(ModelAndView andView, Map<String, String> params, HttpServletRequest request
			   						, HttpSession session
			   						, FeedbackVO fkv) throws SQLException{
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		
		
		String[] aStr = request.getParameterValues("myArray[]");
		
		String receive_emp = aStr[0];
		String pw_code = aStr[1];
		String feedback_content = aStr[2];
		
//		params.put("receive_emp", receive_emp);
//		params.put("pw_code", pw_code);
//		params.put("feedback_content", feedback_content);
		
		fkv.setFeedback_content(feedback_content);
		fkv.setPw_code(pw_code);
		fkv.setReceive_emp(receive_emp);
		fkv.setSend_emp(emp_code);
		
		service.insertFeedbackInfo(fkv);
		String message = "피드백을 보냈습니다.";
		andView.addObject("message", message );
		andView.setViewName("jsonConvertView");
		return andView;
	}
}

