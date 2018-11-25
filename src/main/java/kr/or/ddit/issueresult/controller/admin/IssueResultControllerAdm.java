package kr.or.ddit.issueresult.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



import kr.or.ddit.issueresult.service.IIssueResultService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class IssueResultControllerAdm {
	
	@Resource
	private IIssueResultService service;
	
	
	public ModelAndView issueResultList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updateResultIssue(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertResultIssue() throws Exception{
		
		return null;
	}
	
	
	public String deleteResultIssue() throws Exception{
		
		return null;
	}
}

