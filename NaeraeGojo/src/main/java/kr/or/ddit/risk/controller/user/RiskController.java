package kr.or.ddit.risk.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.risk.service.IRiskService;
import kr.or.ddit.vo.RiskVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class RiskController {
	@Autowired
	private IRiskService service;

	
	public void RiskForm(){}
	
	
	public Model RiskList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model RiskView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertRisk(RiskVO rv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteRisk(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateRisk(RiskVO rv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}


