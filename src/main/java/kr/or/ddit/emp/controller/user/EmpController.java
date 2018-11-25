package kr.or.ddit.emp.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.emp.service.IEmpService;
import kr.or.ddit.part.service.IPartService;
import kr.or.ddit.position.service.IPositionService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.PartVO;
import kr.or.ddit.vo.PositionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

@Controller
@RequestMapping("/user/emp/")
public class EmpController {
	@Resource
	private IEmpService service;
	
	@Resource
	private IPositionService pService;

	@Resource
	private IPartService partService;
	
	
	@RequestMapping("empList2")
	public void empList2(){}

	@RequestMapping("empUpdate")
	public ModelAndView empUpdate(String emp_code,
			ModelAndView andView,
			Map<String, String> params)throws Exception{
		
		params.put("emp_code", emp_code);

		EmpVO empInfo = service.empInfo(params);
		
		List<PartVO> partList = partService.partList();		
		
		andView.addObject("partList", partList);
		andView.addObject("empInfo", empInfo);	
		andView.setViewName("user/emp/empUpdate");
		
		return andView;
	}
	

	@RequestMapping("empForm")
	public ModelAndView empForm(ModelAndView andView) throws Exception{
		
		List<PartVO> partList = partService.partList();		
			
		andView.addObject("partList", partList);
		andView.setViewName("user/emp/empForm");
		return andView;
	}
	
	@RequestMapping("empView")
	public ModelAndView empView(String emp_code,
			ModelAndView andView,
			Map<String, String> params)throws Exception{
		
		params.put("emp_code", emp_code);

		EmpVO empInfo = service.empInfo(params);
		
		andView.addObject("empInfo", empInfo);	
		andView.setViewName("user/emp/empView");
		
		return andView;
	}

	
	
	@RequestMapping("empList")
	public ModelAndView empList(HttpServletRequest request,
								HttpSession session) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>(); 
		List<EmpVO> empList = service.empList(params);
		
		ModelAndView andView = new ModelAndView();
		
//		andView.addObject("pagingUtil", pagingUtil.getPagingHtmls());
		andView.addObject("empList", empList);
		andView.setViewName("user/emp/empList");
		
		return andView;
	}
			
			
			
			
	
	
//	public ModelAndView empList(HttpServletRequest request, HttpSession session) throws Exception{
//	
//		return null;
//	}
	
	public ModelAndView updateEmp(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	@RequestMapping("insertEmp")
	public ModelAndView insertEmp(EmpVO empInfo
				,HttpSession session
				,String emailId
				,String emp_code
				,Map<String, String> params
				,ModelAndView andView) throws Exception{
		service.insertEmpInfo(empInfo);

		session.setAttribute("INSERT_EMP", empInfo);
		
		emp_code = empInfo.getEmp_code();
		andView.addObject("emailId", emailId);
		andView.addObject("emp_code", emp_code);
		andView.setViewName("redirect:/user/emp/empList.do");
//		redirectAttribute.addFlashAttribute("message", "회원가입이 완료되었습니다.");
		return andView;
	}
	
	public String deleteEmp() throws Exception{
		
		return null;
	}
}


