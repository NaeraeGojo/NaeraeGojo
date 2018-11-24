package kr.or.ddit.sanpro.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.sanpro.service.ISanProService;
import kr.or.ddit.vo.SanProVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SanProController {
	@Autowired
	private ISanProService service;

	
	public void SanProForm(){}
	
	
	public Model SanProList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model SanProView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertSanPro(SanProVO spv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteSanPro(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateSanPro(SanProVO spv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}


