package kr.or.ddit.projectworkclass.controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.projectworkclass.service.IProjectWorkClassService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ProjectWorkClassVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/project/pwc/")
public class ProjectWorkClassController {
	@Autowired
	private IProjectWorkClassService service;
	

	
	public void ProjectWorkClassForm(){}
	
	@RequestMapping("pwcList")
	public ModelAndView ProjectWorkClassList(ModelAndView mav, Map<String, String> params 
								, HttpSession session
								, String currentPage) throws Exception{
		String project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		List<ProjectWorkClassVO> pwcl = service.getPwcList(params);
		
		mav.addObject("pwcl",pwcl);
		mav.setViewName("jsonConvertView");
		
		return mav;
	}
	
	
	public Model ProjectWorkClassView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	@RequestMapping("pwcInsert")
	public ModelAndView insertProjectWorkClass(ProjectWorkClassVO pv, HttpSession session
										,ModelAndView mav) throws Exception{
		String project_code = (String) session.getAttribute("project_code");
		pv.setProject_code(project_code);
		
		EmpVO ev = (EmpVO) session.getAttribute("LOGIN_EMPINFO");
		pv.setEmp_code(ev.getEmp_code());
		
		String pwc_code = service.insertPwc(pv);
		pv.setPwc_code(pwc_code);
		
		mav.addObject("pwcv",pv);
		mav.setViewName("jsonConvertView");
		
		return mav;
	}
	
	@RequestMapping("pwcDelete")
	public ModelAndView deleteProjectWorkClass(ModelAndView mav,
			String pwc_code , Map<String, String> params) throws Exception{
		params.put("pwc_code", pwc_code);
		service.deletePwc(params);
		
		mav.setViewName("jsonConvertView");
		
		return mav;
	}
	
	@RequestMapping("pwcUdpate")
	public ModelAndView updateProjectWorkClass(ModelAndView mav
							,ProjectWorkClassVO pwcv
							,Map<String, String> params) throws Exception{
		params.put("pwc_code", pwcv.getPwc_code());
		ProjectWorkClassVO pwcv2 = service.getPwc(params);
		
		pwcv2.setPwc_name(pwcv.getPwc_name());
		
		service.updatePwc(pwcv2);
		
		mav.setViewName("jsonConvertView");
		return mav;
	}

}

