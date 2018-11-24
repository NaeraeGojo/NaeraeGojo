package kr.or.ddit.rqpps.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.rqpps.service.IRqppsService;
import kr.or.ddit.vo.RqppsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class RqppsControllerAdm {
	@Autowired
	private IRqppsService service;

	
	public void RqppsForm(){}
	
	
	public Model RqppsList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model RqppsView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertRqpps(RqppsVO rqv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteRqpps(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateRqpps(RqppsVO rqv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}

