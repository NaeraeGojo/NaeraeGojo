package kr.or.ddit.project.controller.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.RolePagingUtil1Page4;
import kr.or.ddit.utils.RolePagingUtilJoin;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.MpVO;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
			String search_keyword, String search_keycode, String currentPage, 
			Map<String, String> params, ModelAndView andView, String project_code) throws Exception{
		
		project_code = (String) session.getAttribute("project_code");
		session.setAttribute("project_code", project_code);
	
		if(currentPage==null){
			currentPage = "1";
		}
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = service.totalCountPL(params);
		
		RolePagingUtil1Page4 pagingUtil = new RolePagingUtil1Page4(Integer.parseInt(currentPage),totalCount,request);
		
		params.put("startCount",  String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
		List<ProjectVO> projectList = service.projectList(params);
		andView.addObject("pagingUtil",pagingUtil.getPagingHtmls());
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
	
	@RequestMapping("pro/deleteProject/{project_code}")
	public String deleteProject(@PathVariable("project_code") String project_code,
			Map<String, String> params) throws Exception{
		
		params.put("project_code", project_code);
		
		service.deleteProjectInfo(params);
		
		return "redirect:/user/project/project_manage.do";
	}
	
	@RequestMapping("pro/updateProject")
	public ModelAndView updateProject(String project_code, ModelAndView andView,
			ProjectVO projectInfo, HttpSession session, Map<String, String> params,
			HttpServletRequest request) throws Exception{
	
		params.put("project_code", project_code);
		
		service.updateProjectInfo(projectInfo);
		andView.addObject("projectInfo",projectInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("pro/projectInfo")
	public ModelAndView getMp(Map<String, String> params, ModelAndView andView,
		    String project_code, ProjectVO projectInfo, HttpSession session) throws SQLException{
		
		
		params.put("project_code", project_code);
		
		projectInfo = service.projectInfo(params);
		
		andView.addObject("projectInfo", projectInfo);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
}

