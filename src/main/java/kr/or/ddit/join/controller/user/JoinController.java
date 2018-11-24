package kr.or.ddit.join.controller.user;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.emp.service.IEmpService;
import kr.or.ddit.join.service.IJoinService;
import kr.or.ddit.utils.CryptoGenerator;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MpJoinVO;
import kr.or.ddit.vo.MpVO;
import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.RqppsVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/join/")
public class JoinController {
	@Resource
	private IJoinService service;
	@Resource
	private IEmpService empServ;
	@Resource
	private CryptoGenerator cryptoGen;
	
	// 로그아웃 Controller
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.removeAttribute("LOGIN_EMPINFO");
	
		return "redirect:/user/join/mainForm.do";
	}
	
	//로그인 폼 Controller
	@RequestMapping("loginForm")
	public Model loginForm(HttpSession session, 
			Model model){
		Map<String, String> publicKeyMap = cryptoGen.getGeneratePairKey(session);
		model.addAttribute("publicKeyMap", publicKeyMap);
		
		return model;
	}
	
	// 로그인 확인 Controller
	@RequestMapping(value="loginCheck", method=RequestMethod.POST)
	public String loginCheck(String emp_code, String emp_pass,
			Map<String, String> params,
			EmpVO paramVO,
			HttpSession session,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model,
			ModelMap modelMap,
			ModelAndView andView
			) throws Exception{
			
		String decryptEMPCODE = cryptoGen.decryptRSA(session, emp_code);
		String decryptEMPPASS = cryptoGen.decryptRSA(session, emp_pass);
		
		params.put("emp_code", decryptEMPCODE);
		params.put("emp_pass", decryptEMPPASS);
		
		EmpVO empInfo = empServ.empInfo(params);
		
		if(empInfo == null){
			String message = "";
			try{
				message = URLEncoder.encode(message, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "redirect:/user/join/loginForm.do?message"+message;
		}else{
			session.setAttribute("LOGIN_EMPINFO", empInfo);
			if(empInfo.getEmp_role().equals("DEP")){ //개발자 권한 로그인
				return "forward:/user/join/mainForm.do";
			}else if(empInfo.getEmp_role().equals("MANAGER")){	//관리자 권한 로그인
				return "forward:/user/emp/empList.do";
			}else if(empInfo.getEmp_role().equals("PL")){	//PL 권한 로그인
				return "forward:/user/report/report_listPL.do";
			}else{
				return "forward:/user/emp/empForm.do";
			}
		}
	}
	
	// 직원등록 인증 Controller
	@RequestMapping(value="check", method=RequestMethod.POST)
	public String loginCheck(String emp_code,
			Map<String, String> params,
			EmpVO paramVO) throws Exception{
		params.put("emp_code", emp_code);
		
		empServ.empInfoW(params);

		return "user/join/loginForm";
	}
	
	// 메인화면 Controller [개발자 로그인]
	@RequestMapping("mainForm")
	public String mainForm(HttpSession session,
			Map<String, String> params,
			Model model) throws Exception{
		EmpVO empInfo = empServ.empInfo(params);
		if(session.getAttribute("LOGIN_EMPINFO")== null){
			return "redirect:/user/join/loginForm.do";
		}else{
			Map<String, String> publicKeyMap = cryptoGen.getGeneratePairKey(session);
			session.setAttribute("publicKeyMap", publicKeyMap);
			return "user/join/mainForm";
		}
	}
	
	
	public ModelAndView joinList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updateJoin(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertJoin() throws Exception{
		
		return null;
	}
	
	
	public String deleteJoin() throws Exception{
		
		return null;
	}
	
	@RequestMapping("join_list")
	public ModelAndView join_list(HttpServletRequest request,
			ModelAndView andView,
			HttpSession session,
			String search_keyword,
			String search_keycode,
			String currentPage
			,String emp_code) throws Exception{
		if(currentPage==null){
			currentPage = "1";
		}
//		Map<String, String> params = new HashMap<String, String>();
//		
//		params.put("search_keyword", search_keyword);
//		params.put("search_keycode", search_keycode);
//		
//		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();		
//		System.out.println("아디아디아디아디"+emp_code);
//		params.put("emp_code", emp_code);
//		
//		if(params != null){
//			String message = (String) params.get("message");
//			System.out.println("RedirectAttribute post 전송 파람 : " + message);
//		}
//		
//		
//		int totalCount = service.totalCount(params);
//		RolePagingUtil paginUtil = new RolePagingUtil(Integer.parseInt(currentPage),totalCount,request);
//		params.put("startCount",  String.valueOf(paginUtil.getStartCount()));
//		params.put("endCount", String.valueOf(paginUtil.getEndCount()));
//		List<NotEmpVO> noticeAllList = service.noticeAllList(params);
//		andView.addObject("noticeAllList",noticeAllList);
//		andView.addObject("pagingHtmls",paginUtil.getPagingHtmls());
//		andView.setViewName("user/noticeAll/notice_allList");
		return andView;
	}
	
	@RequestMapping("join_insert")
	public ModelAndView join_insert(ModelAndView andView) throws Exception{
		List<RqppsVO> rqName = service.rqppsNm();
//		List<EmpVO> empList = service.empList();
		andView.addObject("rqName",rqName);
//		andView.addObject("empList",empList);
		andView.setViewName("user/join/join_insert");
		return andView;
	}
	
	
	@RequestMapping("join_insertFinal")
	public ModelAndView join_insertFinal(ModelAndView andView) throws Exception{
		List<RqppsVO> rqName = service.rqppsNm();
		andView.addObject("rqName",rqName);
		andView.setViewName("user/join/join_insertFinal");
		return andView;
	}
	
	@RequestMapping("join_view")
	public String join_view(){
		return "user/join/join_view";
	}
	
	@RequestMapping("join_ajax")
	public ModelAndView join_ajax(String rqpps_code,
			Map<String, String> params,
			ModelAndView andView) throws Exception{
		
		params.put("rqpps_code", rqpps_code);
		
		MpJoinVO mpJoinInfo = service.mpList(params);
		andView.addObject("mpJoinInfo",mpJoinInfo);
		// application-views.xml 내 선언된 빈의 id
		andView.setViewName("jsonConvertView");
		
		// InternalResourceViewResolvers
		//  		/WEB-INF/views/jsonConvertView.jsp
		return andView;
	}
	
	@RequestMapping("join_specialList")
	public  ModelAndView join_specialList(String emp_level,
			Map<String, String> params,
			ModelAndView andView) throws Exception{
		
		params.put("emp_level", emp_level);
		
		List<EmpVO> empLeveltest = service.empList1(params);
		
		andView.addObject("empLeveltest",empLeveltest);
		// application-views.xml 내 선언된 빈의 id
		andView.setViewName("jsonConvertView");
		
		// InternalResourceViewResolvers
		//  		/WEB-INF/views/jsonConvertView.jsp
		return andView;
	}
	
	@RequestMapping("join_levelInsert")
	public  ModelAndView join_levelInsert(String list,
			String select,
			Map<String, String> params,
			ModelAndView andView) throws Exception{
		
		System.out.println(list);//EMP코드
		System.out.println(select);//제안요청서코드
		String[] sp = list.split("/");
		for (int i = 0; i < sp.length; i++) {
			
			
		}
//		params.put("emp_level", list);
//		
//		List<EmpVO> empLeveltest = service.empList1(params);
//		
//		andView.addObject("empLeveltest",empLeveltest);
//		// application-views.xml 내 선언된 빈의 id
		andView.setViewName("jsonConvertView");
		
		// InternalResourceViewResolvers
		//  		/WEB-INF/views/jsonConvertView.jsp
		return andView;
	}
}

