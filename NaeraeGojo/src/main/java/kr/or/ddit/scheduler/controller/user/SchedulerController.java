package kr.or.ddit.scheduler.controller.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.scheduler.service.ISchedulerService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.SchedulerVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/scheduler/")
public class SchedulerController {
	@Autowired
	ISchedulerService service;

	@RequestMapping("schedulerList")
	public ModelAndView issueList(HttpServletRequest request, HttpSession session,
			String search_keyword, String search_keycode, String currentPage,
			Map<String, String> params, ModelAndView andView) throws Exception{

		if(currentPage==null){
			currentPage = "1";
		}
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(Integer.parseInt(currentPage),totalCount,request);
		
		params.put("startCount",  String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
		List<SchedulerVO> schedulerList = service.schedulerList(params);
		
		andView.addObject("pagingUtil",pagingUtil.getPagingHtmls());
		andView.addObject("schedulerList", schedulerList);
		andView.setViewName("user/scheduler/schedulerList");
		return andView;
	}
	
	@RequestMapping("schedulerInfo")
	public ModelAndView schedulerInfo(Map<String, String> params, ModelAndView andView,
		    String scheduler_code, SchedulerVO schedulerInfo, HttpSession session) throws SQLException{
		
		params.put("scheduler_code", scheduler_code);
		
		schedulerInfo = service.schedulerInfo(params);
		
		andView.addObject("schedulerInfo", schedulerInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("insertScheduler")
	public ModelAndView insertScheduler(String scheduler_code, ModelAndView andView,
			SchedulerVO schedulerInfo, HttpSession session, Map<String, String> params,
			HttpServletRequest request) throws Exception{
		
		schedulerInfo.setScheduler_writer(((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code());
		
		service.insertScheduler(schedulerInfo);

		andView.addObject("schedulerInfo",schedulerInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("updateScheduler")
	public ModelAndView updateScheduler(String scheduler_code, ModelAndView andView,
			SchedulerVO schedulerInfo, HttpSession session, Map<String, String> params,
			HttpServletRequest request) throws Exception{
	
		params.put("scheduler_code", scheduler_code);
		
		service.updateScheduler(schedulerInfo);
		andView.addObject("schedulerInfo",schedulerInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("deleteScheduler")
	public String deleteScheduler(String scheduler_code, Map<String, String> params) throws Exception{
		
		params.put("scheduler_code", scheduler_code);
		service.deleteScheduler(params);
		return "redirect:/user/scheduler/schedulerList.do";
	}
	
	@RequestMapping("changeScheduler")
	public ModelAndView changeScheduler(String scheduler_code, ModelAndView andView, Map<String, String> params) throws Exception{
		
		params.put("scheduler_code", scheduler_code);
		service.changeScheduler(params);
		andView.setViewName("jsonConvertView");
		return andView;
	}
}
