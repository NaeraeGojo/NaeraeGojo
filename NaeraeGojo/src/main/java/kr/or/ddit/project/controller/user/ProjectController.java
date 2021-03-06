package kr.or.ddit.project.controller.user;

import java.sql.SQLException;
import java.util.ArrayList;
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
import kr.or.ddit.vo.PositionVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.SuggestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sun.xml.internal.ws.api.model.MEP;

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
		
		params.clear();
		project_code = (String) session.getAttribute("project_code");
		params.put("project_code",project_code);
		List<EmpVO> empList = joinService.insertList(params);
		List<PositionVO> positionList = joinService.getPositionList();
		
		andView.addObject("empList",empList);  // join 테이블 직원 제외한 emp_List
		andView.addObject("positionList",positionList); // 포지션 리스트(DA, UA 등등)
		andView.addObject("pagingUtil",pagingUtil.getPagingHtmls());
		andView.addObject("projectInfo", projectInfo);
		andView.addObject("joinList", joinList);
		andView.addObject("totalComplete", totalComplete);
		andView.addObject("totalIng", totalIng);
		andView.addObject("totalNew", totalNew);
		andView.addObject("project_code", project_code);
		andView.setViewName("user/project/pro/project_manage_see");
//		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("projectForm")
	public ModelAndView ProjectForm(HttpServletRequest request, String emp_code,
			Map<String, String> params, HttpSession session, ModelAndView andView) throws Exception{
		
		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();		
		params.put("emp_code", emp_code);
		
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
		params.clear();
		
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
			String join_code, HttpSession session) throws SQLException{
		
		params.put("join_code", join_code);
		
		joinService.deleteAdd(params);
		params.clear();
		
		String project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		List<JoinVO> joinList = service.joinList(params);
		andView.addObject("joinList",joinList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("empArray")
	public ModelAndView empArray(Map<String, String> params, ModelAndView andView,
			HttpServletRequest request, EmpVO ev) throws SQLException{
		
		String[] level = request.getParameterValues("level[]");
		String[] code = request.getParameterValues("code[]");
		String[] name = request.getParameterValues("name[]");
		String[] department = request.getParameterValues("department[]");
		
//		List<EmpVO> empArray = new ArrayList<>();
		
//		for (int i = 0; i < code.length; i++) {
//			ev.setEmp_code(code[i]);
//			ev.setEmp_name(name[i]);
//			ev.setEmp_department(department[i]);
//			ev.setEmp_level(level[i]);
//			empArray.add(ev);
//		}
		
		List<PositionVO> positionList = joinService.getPositionList();
		
		andView.addObject("level", level);
		andView.addObject("code", code);
		andView.addObject("name", name);
		andView.addObject("department", department);
		andView.addObject("positionList", positionList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("empJoinInsert")
	public ModelAndView empJoinInsert(Map<String, String> params, ModelAndView andView,
			HttpServletRequest request, JoinVO jv, HttpSession session) throws SQLException{
		
		String[] emp_code = request.getParameterValues("emp_array[]");
		String[] emp_position = request.getParameterValues("emp_position[]");
		
		
		String project_code = (String) session.getAttribute("project_code");
		for (int i = 0; i < emp_code.length; i++) {
			
			jv.setEmp_code(emp_code[i]);
			jv.setPosition_name(emp_position[i]);
			jv.setProject_code(project_code);
			joinService.insertAdd(jv);
		}
		andView.addObject("project_code", project_code);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("totalCntMain")
	public ModelAndView totalCntMain(ModelAndView andView, Map<String, String> params, HttpSession session) throws Exception{
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		
		String totalCountMain = service.totalCountMain(params);
		
		andView.addObject("totalCountMain", totalCountMain); 

		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("projectListMain")
	public ModelAndView ProjectListMain(ModelAndView andView, Map<String, String> params, HttpSession session) throws Exception{
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		
		List<ProjectVO> projectList = service.projectList(params);

		andView.addObject("projectList", projectList); 
		andView.setViewName("jsonConvertView");
		return andView;
	}
}

