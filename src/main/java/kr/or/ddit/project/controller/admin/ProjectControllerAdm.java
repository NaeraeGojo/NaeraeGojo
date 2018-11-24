package kr.or.ddit.project.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProjectControllerAdm {
	
	@Autowired
	private IProjectService service;
	
	
	public void ProjectForm(){}
	
	
	public Model ProjectList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model ProjectView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertProject(ProjectVO pv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteProject(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateProject(ProjectVO pv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
	
	
	
}

