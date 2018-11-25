package kr.or.ddit.scheduler.controller.admin;

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

@Controller
public class SchedulerControllerAdm {
	@Autowired
	ISchedulerService service;

	
	public void SchedulerForm(){}
	
	
	public Model SchedulerList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
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

