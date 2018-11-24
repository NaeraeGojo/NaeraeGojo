package kr.or.ddit.bell.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;




import kr.or.ddit.computation.service.IComputationService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("")
public class BellControllerAdm {
	
	@Resource
	private IComputationService service;
	
	public ModelAndView computationList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	public ModelAndView updateComputation(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	public String insertComputation() throws Exception{
		
		return null;
	}
	
	public String deleteComputation() throws Exception{
		
		return null;
	}
}

