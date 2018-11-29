package kr.or.ddit.emp.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.emp.service.IEmpService;
import kr.or.ddit.history.service.IHistoryService;
import kr.or.ddit.part.service.IPartService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.HistoryVO;
import kr.or.ddit.vo.PartVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/user/emp/")
public class EmpController {
	@Resource
	private IEmpService service;
	
	@Resource
	private IPartService partService;
	
	@Resource
	private IHistoryService historyServ;
	
	
	@RequestMapping("empList2")
	public void empList2(){}

	/**
	 * 직원정보 수정창 
	 * @author 이소라	
	 * @param emp_code
	 * @param andView
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("empUpdate")
	public ModelAndView empUpdate(String emp_code,
			ModelAndView andView,
			Map<String, String> params)throws Exception{
		params.put("emp_code", emp_code);
		EmpVO empInfo = service.empInfo(params);
		
		List<PartVO> partList = partService.partList();		
		List<HistoryVO> historyList = historyServ.historyList(params);
		
		andView.addObject("historyList", historyList);
		andView.addObject("partList", partList);
		andView.addObject("empInfo", empInfo);	
		andView.setViewName("user/emp/empUpdate");
		
		return andView;
	}
	
	/**
	 * 직원상세조회 창 View
	 * View를 통해 정보 수정창으로 넘어가거나 해당 정보를 삭제할 수 있다.
	 * @author 이소라
	 * @param emp_code
	 * @param andView
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("empView")
	public ModelAndView empView(String emp_code,
			ModelAndView andView,
			Map<String, String> params)throws Exception{
		
		params.put("emp_code", emp_code);

		EmpVO empInfo = service.empInfo(params);
		List<HistoryVO> historyList = historyServ.historyList(params);
		
		andView.addObject("historyList", historyList);
		andView.addObject("empInfo", empInfo);	
		andView.setViewName("user/emp/empView");
		
		return andView;
	}

	/**
	 * 직원전체 조회List
	 * @author 이소라
	 * @param request
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("empList")
	public ModelAndView empList(HttpServletRequest request,
								HttpSession session) throws Exception{
		Map<String, String> params = new HashMap<String, String>(); 
		List<EmpVO> empList = service.empList(params);
		
		ModelAndView andView = new ModelAndView();
		
		andView.addObject("empList", empList);
		andView.setViewName("user/emp/empList");
		
		return andView;
	}
			
	/**
	 * 직원등록 Form
	 * @author 이소라
	 * @param andView
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("empForm")
	public ModelAndView empForm(ModelAndView andView) throws Exception{
		List<PartVO> partList = partService.partList();		
		
		andView.addObject("partList", partList);
		andView.setViewName("user/emp/empForm");
		return andView;
	}

	
	/**
	 * 직원등록 Insert
	 * 직원의 정보를 등록 후 List창에서 이메일 인증단계가 진행된다.
	 * @author 이소라
	 * @param empInfo
	 * @param session
	 * @param emailId
	 * @param emp_code
	 * @param params
	 * @param andView
	 * @return
	 * @throws Exception
	 */
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
		return andView;
	}
	
	/**
	 * 직원정보 수정
	 * @author 이소라
	 * @param empInfo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("updateEmp")
	public String updateEmp(EmpVO empInfo)throws Exception{
		service.updateEmpInfo(empInfo);
		return "redirect:/user/emp/empList.do";
	}
	
	/**
	 * 직원정보 탈퇴
	 * @author 이소라
	 * @param emp_code
	 * @param params
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("deleteEmp")
	public String deleteEmp(String emp_code,
			Map<String, String> params) throws Exception{
		params.put("emp_code", emp_code);
		service.deleteEmpInfo(params);
		return "redirect:/user/emp/empList.do";
	}
}


