package kr.or.ddit.proproduct.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.proproduct.service.IProProductService;
import kr.or.ddit.vo.ProProductVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProProductController {
	@Autowired
	private IProProductService service;
	
	
	public void ProProductForm(){}
	
	
	public Model ProProductList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model ProProductView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertProProduct(ProProductVO ppv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteProProduct(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateProProduct(ProProductVO ppv ,HttpServletRequest request) throws Exception{
		
		return "";
	}

}

