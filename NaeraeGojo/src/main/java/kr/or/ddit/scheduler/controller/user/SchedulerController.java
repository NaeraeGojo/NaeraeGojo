package kr.or.ddit.scheduler.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.scheduler.service.ISchedulerService;
import kr.or.ddit.vo.SchedulerVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/scheduler/")
public class SchedulerController {
	@Autowired
	ISchedulerService service;

	@RequestMapping("schedulerForm")
	public void SchedulerForm(){}

	@RequestMapping("schedulerView")
	public void SchedulerView(){}
	
	
	@RequestMapping("schedulerList")
	public ModelAndView issueList(HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView andView = new ModelAndView();
		
		andView.setViewName("user/scheduler/schedulerList");
		return andView;
	}
	
	
	public Model SchedulerView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertScheduler(SchedulerVO sv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteScheduler(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateScheduler(SchedulerVO sv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}
