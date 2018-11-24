package kr.or.ddit.sanctnclass.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.sanctnclass.service.ISanCtnClassService;
import kr.or.ddit.vo.SanCtnClassVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SanCtnClassControllerAdm {
	@Autowired
	private ISanCtnClassService service;

	
	public void SanCtnClassForm(){}
	
	
	public Model SanCtnClassList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model SanCtnClassView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertSanCtnClass(SanCtnClassVO scv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteSanCtnClass(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateSanCtnClass(SanCtnClassVO scv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}

