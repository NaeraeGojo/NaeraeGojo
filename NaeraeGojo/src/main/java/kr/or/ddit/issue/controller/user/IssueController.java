package kr.or.ddit.issue.controller.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.issue.service.IIssueService;
import kr.or.ddit.issueresult.service.IIssueResultService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.IssueResultVO;
import kr.or.ddit.vo.IssueVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.ProjectWorkVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/project/issue")
public class IssueController {
	
	@Resource
	private IIssueService service;
	
	@Resource
	private IIssueResultService service2;
	
	@RequestMapping("riskList")
	public ModelAndView riskList(HttpServletRequest request, HttpSession session,
			String search_keyword, String search_keycode, String currentPage, 
			Map<String, String> params, ModelAndView andView ) throws Exception{
		
		if(currentPage==null){
			currentPage = "1";
		}
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(Integer.parseInt(currentPage),totalCount,request);
		
		params.put("startCount",  String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));

		List<IssueResultVO> riskList = service2.riskList(params);
		 		
		andView.addObject("pagingUtil", pagingUtil.getPagingHtmls());
		andView.addObject("riskList", riskList);
		andView.setViewName("user/project/issue/riskList");
		return andView;
	}
	
	@RequestMapping("riskView")
	public ModelAndView ModelAndView2(HttpSession session, String issue_result_code, 
		ModelAndView andView, Map<String, String> params) throws Exception{
	
		params.put("issue_result_code", issue_result_code);
		service2.updateRiskHit(params);
		
		IssueResultVO issueResultInfo = service2.issueResultInfo(params);
		IssueVO issueInfo = service.issueInfo(params);
		
		andView.setViewName("user/project/issue/riskView");
		andView.addObject("issueResultInfo",issueResultInfo);
		andView.addObject("issueInfo", issueInfo);
		return andView;
	}
	
	@RequestMapping("issueForm")
	public ModelAndView issueForm(String project_code, HttpServletRequest request, 
			Map<String, String> params, HttpSession session, ModelAndView andView) throws Exception{

		project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);

		List<ProjectWorkVO> pwList = service.pwList(params);
		List<JoinVO> joinEmpList = service.joinEmpList(params);
		andView.addObject("pwList", pwList);
		andView.addObject("joinEmpList", joinEmpList);
		andView.setViewName("user/project/issue/issueForm");
		return andView;
	}
	
	@RequestMapping("issueList")
	public ModelAndView issueList(String project_code, HttpServletRequest request, HttpSession session, 
			String search_keyword, String search_keycode, String currentPage, 
			Map<String, String> params, ModelAndView andView) throws Exception{
	
		project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);

		if(currentPage==null){
			currentPage = "1";
		}
		
//		search_keycode = (String) session.getAttribute("search_keycode");
//		search_keyword = (String) session.getAttribute("search_keyword");
		
		session.setAttribute("search_keycode", search_keycode);
		session.setAttribute("search_keyword", search_keyword);
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(Integer.parseInt(currentPage),totalCount,request);
		
		params.put("startCount",  String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
		
		List<IssueVO> issueList = service.issueList(params);
		List<IssueVO> issueStatusList = service.issueStatusList(params);
		List<IssueResultVO> issueResultList = service2.issueResultList(params);
		
		andView.addObject("pagingUtil",pagingUtil.getPagingHtmls());
		andView.addObject("issueStatusList", issueStatusList);
		andView.addObject("issueList", issueList);
		andView.addObject("issueResultList", issueResultList);
		andView.setViewName("user/project/issue/issueList");
		return andView;
	}
	
	@RequestMapping("issueResultList")
	public ModelAndView issueList2(String project_code, HttpServletRequest request, HttpSession session, 
			String search_keyword, String search_keycode, String currentPage, 
			Map<String, String> params, ModelAndView andView) throws Exception{
	
		project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		if(currentPage==null){
			currentPage = "1";
		}
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = service.totalCountIssueResult(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(Integer.parseInt(currentPage),totalCount,request);
		
		params.put("startCount",  String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
		
		List<IssueResultVO> issueResultList = service2.issueResultList(params);
		
		andView.addObject("pagingUtil",pagingUtil.getPagingHtmls());
		andView.addObject("issueResultList", issueResultList);
		andView.setViewName("user/project/issue/issueResultList");
		return andView;
	}
	
	
	@RequestMapping("issueView")
	public ModelAndView ModelAndView(HttpSession session,String project_code, String issue_code, 
			ModelAndView andView, Map<String, String> params) throws Exception{
		
		project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
	
		params.put("issue_code", issue_code);
		service.updateHit(params);
		
		IssueVO issueInfo = service.issueInfo(params);
		IssueResultVO issueResultInfo = service2.issueResultViewInfo(params);
		List<ProjectWorkVO> pwList = service.pwList(params);
		List<JoinVO> joinEmpList = service.joinEmpList(params);
		
		
		
		andView.setViewName("user/project/issue/issueView");
		andView.addObject("issueInfo", issueInfo);
		andView.addObject("issueResultInfo",issueResultInfo);
		andView.addObject("pwList",pwList);
		andView.addObject("joinEmpList", joinEmpList);
		return andView;
	}
	
	@RequestMapping("insertIssue")
	public String insertIssue(IssueVO issueInfo, IssueResultVO issueResultInfo, HttpSession session, HttpServletRequest request, Map<String, String> params) throws Exception{
		
		if(session.getAttribute("LOGIN_EMPINFO")!=null){
			issueInfo.setEmp_code(((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code());
		}
		
		service.insertIssueInfo(issueInfo);
		return "redirect:/user/project/issue/issueList.do";
	}
	
	@RequestMapping("updateIssue")
	public ModelAndView updateIssue(@RequestBody String queryString, IssueVO issueInfo,
			IssueResultVO issueResultInfo, HttpSession session, 
			HttpServletRequest request, ModelAndView andView) throws Exception{
		
		if(session.getAttribute("LOGIN_EMPINFO")!= null){
			issueInfo.setEmp_code(((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code());
		}
		
		service2.updateIssueResultInfo(issueResultInfo);
		service.updateIssueInfo(issueInfo);
		andView.setViewName("redirect:/user/project/issue/issueList.do");
		return andView;
	}
	
	@RequestMapping("deleteIssue/{issue_code}")
	public String deleteIssue(@PathVariable("issue_code") String issue_code, Map<String, String> params) throws Exception{
		params.put("issue_code",issue_code);
		
		service.deleteIssueInfo(params);
		
		return "redirect:/user/project/issue/issueList.do";
	}

	
	@RequestMapping("issueResultForm/{issue_code}")
	public ModelAndView issueResultForm(@PathVariable("issue_code") String issue_code, 
			String project_code, HttpServletRequest request, HttpSession session,
			Map<String, String> params,ModelAndView andView) throws Exception{
		
		project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		params.put("issue_code", issue_code);
		
		IssueVO issueInfo = service.issueInfo(params);
		List<JoinVO> joinEmpList = service.joinEmpList(params);
		
		andView.setViewName("user/project/issue/issueResultForm");
		andView.addObject("issueInfo", issueInfo);
		andView.addObject("joinEmpList", joinEmpList);
		return andView;
	}
	
	
	@RequestMapping("issueResultView")
	public ModelAndView ModelAndView3(String project_code, HttpSession session, String issue_code, 
			ModelAndView andView, Map<String, String> params) throws Exception{
		
		project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		params.put("issue_code", issue_code);
		service2.updateHit(params);

		IssueResultVO issueResultInfo = service2.issueResultViewInfo(params);
		IssueVO issueInfo = service.issueInfo(params);
		List<JoinVO> joinEmpList = service.joinEmpList(params);
		
		String keycode = (String) session.getAttribute("search_keycode");
		String keyword = (String) session.getAttribute("search_keyword");
		
		session.setAttribute("keycode", keycode);
		session.setAttribute("keyword", keyword);
		
		andView.setViewName("user/project/issue/issueResultView");
		andView.addObject("issueResultInfo",issueResultInfo);
		andView.addObject("issueInfo",issueInfo);
		andView.addObject("joinEmpList", joinEmpList);

		return andView;
	}
	
	@RequestMapping("insertIssueResult")
	public String insertIssueResult(IssueVO issueInfo, IssueResultVO issueResultInfo, HttpSession session, HttpServletRequest request, Map<String, String> params) throws Exception{
		
		if(session.getAttribute("LOGIN_EMPINFO")!=null){
			issueResultInfo.setEmp_code_ir(((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code());
		}
		
		service2.insertIssueInfo(issueResultInfo, issueInfo);
		return "redirect:/user/project/issue/issueList.do";
	}
	
	@RequestMapping("updateIssueResult")
	public ModelAndView updateIssueResult(@RequestBody String queryString,
			IssueResultVO issueResultInfo, HttpSession session, 
			HttpServletRequest request, ModelAndView andView) throws Exception{
		
		if(session.getAttribute("LOGIN_EMPINFO")!= null){
			issueResultInfo.setEmp_code_ir(((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code());
		}
		
		service2.updateIssueResultInfo(issueResultInfo);
		andView.setViewName("redirect:/user/project/issue/issueList.do");
		return andView;
	}
	
	@RequestMapping("deleteIssueResult/{issue_code}")
	public String deleteIssueResult(@PathVariable("issue_code") String issue_code, IssueVO issueInfo, Map<String, String> params) throws Exception{
		params.put("issue_code",issue_code);
		
		service2.deleteIssueResultInfo(params, issueInfo);
		
		return "redirect:/user/project/issue/issueList.do";
	}

	
}

