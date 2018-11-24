package kr.or.ddit.computationoutdoc.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.computationoutdoc.service.IComputationOutDocService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("")
public class ComputationOutDocController {

	@Resource
	private IComputationOutDocService service;
	
	public ModelAndView computationOutDocList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	public ModelAndView updateComputationOutDoc(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	public String insertComputationOutDoc() throws Exception{
		
		return null;
	}
	
	public String deleteComputationOutDoc() throws Exception{
		
		return null;
	}
}

