package kr.or.ddit.suggestfile.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.suggestfile.service.ISuggestFileService;
import kr.or.ddit.vo.SuggestFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SuggestFileControllerAdm {
	@Autowired
	ISuggestFileService service;

	
	public void SuggestFileForm(){}
	
	
	public Model SuggestFileList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model SuggestFileView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertSuggestFile(SuggestFileVO sv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteSuggestFile(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateSuggestFile(SuggestFileVO sv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}

