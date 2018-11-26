package kr.or.ddit.projectwork.controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.projectwork.service.IProjectWorkService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.SetContent;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.SuggestVO;

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
		params = SetContent.getParams(request);
		
		String project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		SetContent.setPath(request);
		
		currentPage = SetContent.getPage(request);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(Integer.parseInt(currentPage), totalCount, request,10);
		
		params = SetContent.setParams(params, paging);
		
		List<Map<String, String>> pwl = service.getProjectWorkList(params);
		
		for(Map<String, String> pwv : pwl){
			String start_date = String.valueOf(pwv.get("PW_EST"));
			start_date = start_date.substring(0,10);
			pwv.put("PW_EST", start_date);
			
			String end_date = String.valueOf(pwv.get("PW_EET"));
			end_date = end_date.substring(0,10);
			pwv.put("PW_EET", end_date);
		}
		
		model.addAttribute("pwl",pwl);
		
		return model;
	}
	
	
	public Model ProjectWorkView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	@RequestMapping("pwInsert")
	public String insertProjectWork(ProjectWorkVO pwv) throws Exception{
		
		service.insertProjectWork(pwv);
		
		return "redirect:/user/project/pw/pwList.do";
	}
	
	
	public String deleteProjectWork(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateProjectWork(ProjectWorkVO pwv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}

