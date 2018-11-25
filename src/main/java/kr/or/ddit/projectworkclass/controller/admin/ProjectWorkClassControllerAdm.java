package kr.or.ddit.projectworkclass.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.projectwork.service.IProjectWorkService;
import kr.or.ddit.vo.ProjectWorkClassVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProjectWorkClassControllerAdm {
	@Autowired
	private IProjectWorkService service;
	
	public void ProjectWorkClassForm(){}
	
	
	public Model ProjectWorkClassList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model ProjectWorkClassView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertProjectWorkClass(ProjectWorkClassVO pwcv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteProjectWorkClass(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateProjectWorkClass(ProjectWorkClassVO pwcv ,HttpServletRequest request) throws Exception{
		
		return "";
	}

}

