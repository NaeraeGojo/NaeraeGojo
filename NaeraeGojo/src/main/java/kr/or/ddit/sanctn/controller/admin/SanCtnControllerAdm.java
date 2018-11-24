package kr.or.ddit.sanctn.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.sanctn.service.ISanCtnService;
import kr.or.ddit.vo.SanCtnVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SanCtnControllerAdm {
	@Autowired
	private ISanCtnService service;

	
	public void SanCtnForm(){}
	
	
	public Model SanCtnList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model SanCtnView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertSanCtn(SanCtnVO scv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteSanCtn(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateSanCtn(SanCtnVO scv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}

