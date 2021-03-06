package kr.or.ddit.emp.controller.user;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.emp.service.IEmpService;
import kr.or.ddit.history.service.IHistoryService;
import kr.or.ddit.part.service.IPartService;
import kr.or.ddit.userfile.service.IUserFileService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.HistoryVO;
import kr.or.ddit.vo.PartVO;
import kr.or.ddit.vo.UserFileVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


@Controller
@RequestMapping("/user/emp/")
public class EmpController {
	@Resource
	private IEmpService service;
	
	@Resource
	private IPartService partService;
	
	@Resource
	private IHistoryService historyServ;
	
	@Resource
	private IUserFileService userServ;
	
	@RequestMapping("empList2")
	public void empList2(){}
	
	@RequestMapping("mailCheck")
	public ModelAndView mailCheck(String emp_email, Map<String, String> params, 
			EmpVO ev, ModelAndView andView) throws Exception{
		params.put("emp_email", emp_email);
		ev = service.empMail(params);
		if(ev == null){
			andView.setViewName("jsonConvertView");
			return andView;
		}else{
			andView.setViewName("redirect:/user/emp/empForm.do");
			return andView;
		}
	}
	
	
	@RequestMapping("idCheck")
	public ModelAndView idCheck(String emp_name, String emp_email, String emp_code,
			Map<String, String> params, EmpVO empNum, ModelAndView andView) throws Exception{
		
		params.put("emp_name", emp_name);
		params.put("emp_email", emp_email);
		
		empNum = service.empNum(params); 
		if(empNum == null){
			andView.setViewName("redirect:/user/join/loginForm.do");
			return andView;
		}
		else {
			emp_code = empNum.getEmp_code();		
			andView.addObject("empNum", empNum);
			andView.addObject("emp_code", emp_code);
			andView.setViewName("jsonConvertView");
			
			return andView;
		}
	}
	
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
		UserFileVO ufv = userServ.userFileInfo(params);

		List<PartVO> partList = partService.partList();		
		List<HistoryVO> historyList = historyServ.historyList(params);
		
		andView.addObject("historyList", historyList);
		andView.addObject("ufv", ufv);
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
		UserFileVO ufv = userServ.userFileInfo(params);
		List<HistoryVO> historyList = historyServ.historyList(params);
		
		andView.addObject("historyList", historyList);
		andView.addObject("empInfo", empInfo);	
		andView.addObject("ufv", ufv);	
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
		
		// 8자리 영문+숫자 랜덤코드 만들기
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < 8; i++) {
			if (random.nextBoolean()) {
				buffer.append((char)(int)(random.nextInt(26)+97));
			}else {
				buffer.append((random.nextInt(10)));
			}
		}
		
		andView.addObject("password", buffer.toString());
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
		String emp_pass = empInfo.getEmp_pass();
		
		andView.addObject("emailId", emailId);
		andView.addObject("emp_code", emp_code);
		andView.addObject("emp_pass", emp_pass);
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
	public ModelAndView updateEmp(EmpVO empInfo, ModelAndView andView, @RequestParam("files") MultipartFile[] files, HttpSession session)throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		params.put("emp_code", empInfo.getEmp_code());
		UserFileVO ufv = userServ.userFileInfo(params);
		if(ufv!=null){
			service.updateEmpInfo(empInfo, files);
//			ufv = userServ.userFileInfo(params);
//			session.setAttribute("PHOTO", ufv);
		}
		else{
			service.updateEmpInfo2(empInfo, files);
//			ufv = userServ.userFileInfo(params);
//			session.setAttribute("PHOTO", ufv);
		}
		ufv = userServ.userFileInfo(params);
		empInfo = service.empInfo(params);
		
      if(session.getAttribute("LOGIN_EMPINFO").equals(empInfo)){
        session.setAttribute("PHOTO", ufv);
        session.setAttribute("LOGIN_EMPINFO", empInfo);
    }
		
		String message = URLEncoder.encode("수정이 완료되었습니다.", "UTF-8");
		RedirectView rv = new RedirectView("empView.do?message="+message+ "&emp_code="+empInfo.getEmp_code());
		rv.setExposeModelAttributes(false);
		andView.setView(rv);
		return andView;
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
	
	
	
	@RequestMapping("empChatList")
	public ModelAndView empChatList(ModelAndView mav
									, HttpSession session
									, Map<String, String> params) throws Exception{
		String emp_code = ((EmpVO)session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		
		List<EmpVO> el = service.empList(params);
		mav.addObject("el",el);
		
		// 순환중 리스트의 조작을 위해 옮겨담기
		List<EmpVO> el2 = new CopyOnWriteArrayList<EmpVO>(el);
		
		// 가져오는 목록에서 나는 빼기
		for(EmpVO ev : el2){
			if(ev.getEmp_code().equals(emp_code)){
				el2.remove(ev);
			}
		}
		
		mav.addObject("el",el2);
		mav.setViewName("jsonConvertView");
		
		return mav;
	}
	
	
}


