package kr.or.ddit.pblancproduct.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.pblancproduct.service.IPblancProductService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class PblancProductControllerAdm {
	@Resource
	private IPblancProductService service;
	
	
	public ModelAndView pblancProductList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updatePblancProduct(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertPblancProduct() throws Exception{
		
		return null;
	}
	
	
	public String deletePblancProduct() throws Exception{
		
		return null;
	}
}

