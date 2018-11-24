package kr.or.ddit.allfileclass.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.allfileclass.service.IAllFileClassService;
import kr.or.ddit.certfc.service.ICertfcService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("AllFileClass")
public class AllFileClassControllerAdm {
	// ㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇ
	
	@Resource
	private IAllFileClassService service;
	
	public ModelAndView allFileClassList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	public ModelAndView updateAllFileClass(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	public String insertAllFileClass() throws Exception{
		
		return null;
	}
	
	public String deleteAllFileClass() throws Exception{
		
		return null;
	}
}

