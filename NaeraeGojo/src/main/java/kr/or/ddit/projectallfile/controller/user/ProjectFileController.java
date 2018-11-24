package kr.or.ddit.projectallfile.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.projectallfile.service.IProjectFileService;
import kr.or.ddit.vo.ProjectAllFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProjectFileController {
	@Autowired
	private IProjectFileService service;
	
	
	public void ProjectFileForm(){}
	
	
	public Model ProjectFileList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model ProjectFileView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertProjectFile(ProjectAllFileVO pfv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteProjectFile(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateProjectFile(ProjectAllFileVO pfv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}
