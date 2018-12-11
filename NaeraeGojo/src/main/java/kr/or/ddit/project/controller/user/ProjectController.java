package kr.or.ddit.project.controller.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.join.service.IJoinService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.rqpps.service.IRqppsService;
import kr.or.ddit.suggest.service.ISuggestService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.RolePagingUtilJoin;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.SuggestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/project/")
public class ProjectController {
	
	@Autowired
	private IProjectService service;
	
	@Autowired
	private ISuggestService sugService;
	
	@Autowired
	private IRqppsService rfpService;
	
	@Autowired
	private IJoinService joinService;
	
	@RequestMapping("mainForm")
	public void mainForm(){}
	
	@RequestMapping("project_1_2_1")
	public void project_1_2_1(){}
	
	@RequestMapping("project_manage")
	public ModelAndView project_manage(HttpServletRequest request, HttpSession session, 
			String search_keyword, String search_keycode, String currentPage, 
			Map<String, String> params, ModelAndView andView, String project_code, String emp_code) throws Exception{
		
		project_code = (String) session.getAttribute("project_code");
		session.setAttribute("project_code", project_code);
		
		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();		
		params.put("emp_code", emp_code);

		if(currentPage==null || currentPage == ""){
			currentPage = "1";
		}
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = service.totalCountPL(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(Integer.parseInt(currentPage),totalCount,request, 4);
		
		params.put("startCount",  String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
		List<ProjectVO> projectList = service.projectList(params);
		andView.addObject("pagingUtil",pagingUtil.getPagingHtmls());
		andView.addObject("projectList", projectList);
		andView.setViewName("user/project/project_manage");
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
		int totalComplete = service.totalComplete(params);
		int totalIng = service.totalIng(params);
		int totalNew = service.totalNew(params);
		
		andView.addObject("pagingUtil",pagingUtil.getPagingHtmls());
		andView.addObject("projectInfo", projectInfo);
		andView.addObject("joinList", joinList);
		andView.addObject("totalComplete", totalComplete);
		andView.addObject("totalIng", totalIng);
		andView.addObject("totalNew", totalNew);
		andView.addObject("project_code", project_code);
		andView.setViewName("user/project/pro/project_manage_see");
		return andView;
	}
	
	@RequestMapping("projectForm")
	public ModelAndView ProjectForm(HttpServletRequest request, 
			Map<String, String> params, HttpSession session, ModelAndView andView) throws Exception{
		
		List<SuggestVO> suggestList = service.suggestList(params);
		andView.addObject("suggestList", suggestList);
		andView.setViewName("user/project/projectForm");
		return andView;
	}
	
	@RequestMapping("insertProject")
	public String insertIssue(ProjectVO projectInfo, String emp_code, HttpSession session, 
			HttpServletRequest request, Map<String, String> params) throws Exception{
		
		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();		
		params.put("emp_code", emp_code);
		
		service.insertProjectInfo(projectInfo);
		
		params.clear();
		params.put("suggest_code", projectInfo.getSuggest_code());
		
		SuggestVO sugVO = sugService.getSuggest(params);
		
		// 프로젝트가 등록되면서 제안요청서의 상태를 4로 업데이트
		params.clear();
		params.put("rqpps_code", sugVO.getRqpps_code());
		params.put("rqpps_now_condition", "4");
		rfpService.updateRfpCondition(params);
		
		return "redirect:/user/project/project_manage.do";
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
		andView.addObject("projectInfo", projectInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("pro/projectInfo")
	public ModelAndView projectInfo(Map<String, String> params, ModelAndView andView,
		    String project_code, ProjectVO projectInfo, HttpSession session) throws SQLException{
		
		params.put("project_code", project_code);
		
		projectInfo = service.projectInfo(params);
		
		andView.addObject("projectInfo", projectInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("suggestInfo")
	public ModelAndView suggestInfo(Map<String, String> params, ModelAndView andView,
		    String suggest_code, SuggestVO suggestInfo, HttpSession session) throws SQLException{
		
		params.put("suggest_code", suggest_code);
		
		suggestInfo = service.suggestInfo(params);
		
		andView.addObject("suggestInfo", suggestInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("deleteEmp")
	public ModelAndView deleteEmp(Map<String, String> params, ModelAndView andView,
			String emp_code, HttpSession session) throws SQLException{
		
		params.put("emp_code", emp_code);
		
//		service.deleteEmp(params);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
}

