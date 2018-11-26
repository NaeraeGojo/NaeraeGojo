package kr.or.ddit.projectwork.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.projectwork.service.IProjectWorkService;
import kr.or.ddit.vo.ProjectWorkVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/user/project/pw/")
public class ProjectWorkController {
	@Autowired
	private IProjectWorkService service;
	
	@RequestMapping("pwForm")
	public void ProjectWorkForm(){}
	
	@RequestMapping("pwList")
	public Model ProjectWorkList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model ProjectWorkView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	@RequestMapping("pwInsert")
	public String insertProjectWork(ProjectWorkVO pwv
									) throws Exception{
		
		return "redirect:/user/project/pw/pwList.do";
	}
	
	
	public String deleteProjectWork(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateProjectWork(ProjectWorkVO pwv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}

