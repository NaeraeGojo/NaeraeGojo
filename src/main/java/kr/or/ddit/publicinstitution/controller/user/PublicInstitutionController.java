package kr.or.ddit.publicinstitution.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.publicinstitution.service.IPublicInstitutionService;
import kr.or.ddit.vo.PublicInstitutionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class PublicInstitutionController {
	@Autowired
	private IPublicInstitutionService service;

	
	public void PublicInstitutionForm(){}
	
	
	public Model PublicInstitutionList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model PublicInstitutionView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertPublicInstitution(PublicInstitutionVO piv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deletePublicInstitution(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updatePublicInstitution(PublicInstitutionVO piv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}

