package kr.or.ddit.project.controller.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/project/")
public class ProjectController {
	
	@Autowired
	private IProjectService service;
	
	@RequestMapping("projectForm")
	public void ProjectForm(){}
	
	@RequestMapping("mainForm")
	public void mainForm(){}
	
	@RequestMapping("project_manage")
	public ModelAndView project_manage(HttpServletRequest request, HttpSession session, 
			Map<String, String> params, ModelAndView andView, String project_code) throws Exception{
		
		project_code = (String) session.getAttribute("project_code");
		session.setAttribute("project_code", project_code);
	
		List<ProjectVO> projectList = service.projectList(params);
		
		andView.addObject("projectList", projectList);
		return andView;
	}
	
	@RequestMapping("pro/project_manage_see")
	public ModelAndView project_manage_see(String project_code, HttpSession session, 
			HttpServletRequest request, ModelAndView andView, Map<String, String> params) throws Exception{
		
		session.setAttribute("project_code", project_code);
		
		params.put("project_code", project_code);

		ProjectVO projectInfo = service.projectInfo(params);
		
		andView.setViewName("user/project/pro/project_manage_see");
		andView.addObject("projectInfo", projectInfo);
		return andView;
	}
	
	@RequestMapping("project_1_2_1")
	public void project_1_2_1(){}
	
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

