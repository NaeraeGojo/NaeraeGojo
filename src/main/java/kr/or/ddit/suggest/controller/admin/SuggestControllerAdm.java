package kr.or.ddit.suggest.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.suggest.service.ISuggestService;
import kr.or.ddit.vo.SuggestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SuggestControllerAdm {
	@Autowired
	private ISuggestService service;

	
	public void SuggestForm(){}
	
	
	public Model SuggestList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model SuggestView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertSuggest(SuggestVO sv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteSuggest(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateSuggest(SuggestVO sv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}

