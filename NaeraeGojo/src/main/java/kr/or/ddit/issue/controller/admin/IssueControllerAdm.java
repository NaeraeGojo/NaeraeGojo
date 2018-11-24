package kr.or.ddit.issue.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.issue.service.IIssueService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class IssueControllerAdm {
	
	@Resource
	private IIssueService service;
	
	
	public ModelAndView issueList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updateIssue(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertIssue() throws Exception{
		
		return null;
	}
	
	
	public String deleteIssue() throws Exception{
		
		return null;
	}
}

