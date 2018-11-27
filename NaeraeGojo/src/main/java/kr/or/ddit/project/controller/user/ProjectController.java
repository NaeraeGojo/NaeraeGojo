package kr.or.ddit.project.controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.RolePagingUtilJoin;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("project_1_2_1")
	public void project_1_2_1(){}
	
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
	public ModelAndView project_manage_see(String project_code, HttpSession session, String currentPage, 
			HttpServletRequest request, ModelAndView andView, Map<String, String> params) throws Exception{
		
//		project_code = (String) session.getAttribute("project_code");
		session.setAttribute("project_code", project_code);
		
		params.put("project_code", project_code);
		
		if(currentPage==null){
			currentPage = "1";
		}
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtilJoin pagingUtil = new RolePagingUtilJoin(Integer.parseInt(currentPage), totalCount, request, project_code);
		
		params.put("startCount",  String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		

		ProjectVO projectInfo = service.projectInfo(params);
		List<JoinVO> joinList = service.joinList(params);
		
		andView.addObject("pagingUtil",pagingUtil.getPagingHtmls());
		andView.addObject("projectInfo", projectInfo);
		andView.addObject("joinList", joinList);
		andView.setViewName("user/project/pro/project_manage_see");
		return andView;
	}
	
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

