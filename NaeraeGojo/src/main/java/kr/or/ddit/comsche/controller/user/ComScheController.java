package kr.or.ddit.comsche.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.comsche.service.IComScheService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("")
public class ComScheController {
	
	@Resource
	private IComScheService service;
	
	public ModelAndView comScheList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	public ModelAndView updateComSche(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	public String insertComSche() throws Exception{
		
		return null;
	}
	
	public String deleteComSche() throws Exception{
		
		return null;
	}
}

