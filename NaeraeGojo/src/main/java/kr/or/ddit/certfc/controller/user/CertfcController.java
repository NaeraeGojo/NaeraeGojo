package kr.or.ddit.certfc.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.certfc.service.ICertfcService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("")
public class CertfcController {
	
	@Resource
	private ICertfcService service;
	
	public ModelAndView certfcList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	public ModelAndView updateCertfc(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	public String insertCertfc() throws Exception{
		
		return null;
	}
	
	public String deleteCertfc() throws Exception{
		
		return null;
	}
}

