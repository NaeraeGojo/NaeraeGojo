package kr.or.ddit.projectwork.controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.projectwork.service.IProjectWorkService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.SetContent;
import kr.or.ddit.videochatroom.service.IVideoChatService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.SuggestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/project/pw/")
public class ProjectWorkController {
	@Autowired
	private IProjectWorkService service;
	
	@Autowired
	private IVideoChatService vservice;
	
	@RequestMapping("pwForm")
	public Model ProjectWorkForm(Map<String, String> params 
								, HttpSession session
								, Model model) throws Exception{
		String project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		List<EmpVO> el = vservice.getEmpList(params);
		model.addAttribute("el",el);
		
		return model;
	}
	
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
	
	@RequestMapping("pwView")
	public Model ProjectWorkView(String pw_code
								, Map<String, String> pwv
								, Map<String, String> params
								, Model model) throws Exception{
		params.put("pw_code", pw_code);
		
		pwv = service.getProjectWork(params);
		
		String start_date = String.valueOf(pwv.get("PW_EST"));
		start_date = start_date.substring(0,10);
		pwv.put("PW_EST", start_date);
		
		String end_date = String.valueOf(pwv.get("PW_EET"));
		end_date = end_date.substring(0,10);
		pwv.put("PW_EET", end_date);
		
		String reg_date = String.valueOf(pwv.get("PW_REG_DATE"));
		reg_date = reg_date.substring(0,10);
		pwv.put("PW_REG_DATE", reg_date);
		
		model.addAttribute("pwv",pwv);
		
		String project_code = pwv.get("PROJECT_CODE");
		
		params.put("project_code", project_code);
		
		List<EmpVO> el = vservice.getEmpList(params);
		model.addAttribute("el",el);
		
		return model;
	}
	
	@RequestMapping("pwInsert")
	public String insertProjectWork(ProjectWorkVO pwv) throws Exception{
		
		service.insertProjectWork(pwv);
		
		return "redirect:/user/project/pw/pwList.do";
	}
	
	@RequestMapping("pwDelete")
	public String deleteProjectWork(String pw_code
									, Map<String, String> params) throws Exception{
		params.put("pw_code", pw_code);
		service.deleteProjectWork(params);
		return "redirect:/user/project/pw/pwList.do";
	}
	
	@RequestMapping("pwUpdate")
	public String updateProjectWork(ProjectWorkVO pwv) throws Exception{
		service.updateProjectWork(pwv);
		
		return "redirect:/user/project/pw/pwList.do";
	}
	
	@RequestMapping("pwChart")
	public Model pwChart(Model model
							,Map<String, String> params 
							, HttpSession session
						) throws Exception{
		
		String project_code = (String) session.getAttribute("project_code"); 
		params.put("project_code", project_code);
		
		List<Map<String, String>> pc = service.getPwChart(params);
		
		
		
		model.addAttribute("pc" , pc);
		
		return model;
	}
	
	@RequestMapping("getPwChart")
	public ModelAndView getPwChart(ModelAndView mav 
									, HttpSession session
									, Map<String, String> params) throws Exception{
		String project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		List<Map<String, String>> pc = service.getPwChart(params);
		
		for(Map<String, String> pcv : pc){
			String start_date = String.valueOf(pcv.get("PW_EST"));
			start_date = start_date.substring(0,10);
			pcv.put("PW_EST", start_date);
			
			String end_date = String.valueOf(pcv.get("PW_EET"));
			end_date = end_date.substring(0,10);
			pcv.put("PW_EET", end_date);
		}
		
		
		mav.addObject("pc",pc);
		
		
		mav.setViewName("jsonConvertView");
		
		return mav;
	}

}