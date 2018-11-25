package kr.or.ddit.userfile.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.userfile.service.IUserFileService;
import kr.or.ddit.vo.UserFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserFileControllerAdm {
	@Autowired
	private IUserFileService service;

	
	public void UserFileForm(){}
	
	
	public Model UserFileList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model UserFileView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertUserFile(UserFileVO ufv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteUserFile(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateUserFile(UserFileVO ufv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}

