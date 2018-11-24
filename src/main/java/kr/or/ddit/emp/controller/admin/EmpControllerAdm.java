package kr.or.ddit.emp.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.emp.service.IEmpService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("")
public class EmpControllerAdm {
	@Resource
	private IEmpService service;
	
	public ModelAndView empList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	public ModelAndView updateEmp(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	public String insertEmp() throws Exception{
		
		return null;
	}
	
	public String deleteEmp() throws Exception{
		
		return null;
	}
}

