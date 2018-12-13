package kr.or.ddit.join.controller.user;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.emp.service.IEmpService;
import kr.or.ddit.join.service.IJoinService;
import kr.or.ddit.rqpps.service.IRqppsService;
import kr.or.ddit.userfile.service.IUserFileService;
import kr.or.ddit.utils.CryptoGenerator;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.SetContent;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.MpJoinVO;
import kr.or.ddit.vo.MpVO;
import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.ReportVO;
import kr.or.ddit.vo.RqppsVO;
import kr.or.ddit.vo.UserFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/join/")
public class JoinController {
	@Resource
	private IJoinService service;
	@Resource
	private IEmpService empServ;
	
	@Autowired
	private IRqppsService rfpService;
	
	@Resource
	private IUserFileService userServ;
	@Resource
	private CryptoGenerator cryptoGen;

	// 로그아웃 Controller
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("LOGIN_EMPINFO");

		return "redirect:/user/join/mainForm.do";
	}

	// 로그인 폼 Controller
	@RequestMapping("loginForm")
	public Model loginForm(HttpSession session, Model model) {
		Map<String, String> publicKeyMap = cryptoGen
				.getGeneratePairKey(session);
		model.addAttribute("publicKeyMap", publicKeyMap);

		return model;
	}

	// 로그인 확인 Controller
	@RequestMapping(value = "loginCheck", method = RequestMethod.POST)
	public String loginCheck(String emp_code, String emp_pass,
			Map<String, String> params, EmpVO paramVO, HttpSession session,
			HttpServletRequest request, HttpServletResponse response,
			Model model, ModelMap modelMap, ModelAndView andView)
			throws Exception {

		String decryptEMPCODE = cryptoGen.decryptRSA(session, emp_code);
		String decryptEMPPASS = cryptoGen.decryptRSA(session, emp_pass);

		params.put("emp_code", decryptEMPCODE);
		params.put("emp_pass", decryptEMPPASS);

		EmpVO empInfo = empServ.empInfo(params);

		if (empInfo == null) {
			String message = "정보가 일치하는 직원이 존재하지 않습니다.";
			try {
				message = URLEncoder.encode(message, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			return "redirect:/user/join/loginForm.do?message=" + message;
		} else {
			session.setAttribute("LOGIN_EMPINFO", empInfo);
			Map<String, String> param1 = new HashMap<String, String>();
			param1.put("emp_code", empInfo.getEmp_code());
			UserFileVO ufv = userServ.userFileInfo(param1);
			session.setAttribute("PHOTO", ufv);
			
			return "forward:/user/join/mainForm.do";
		}
	}

	// 직원등록 인증 Controller
	@RequestMapping(value = "idMail", method = RequestMethod.POST)
	public String loginCheck(String emp_code, Map<String, String> params,
			EmpVO paramVO) throws Exception {
		params.put("emp_code", emp_code);

		empServ.empInfoW(params);

		return "user/join/loginForm";
	}

	// 메인화면 Controller [개발자 로그인]
	@RequestMapping("mainForm")
	public String mainForm(HttpSession session, Map<String, String> params,
			Model model) throws Exception {
		EmpVO empInfo = empServ.empInfo(params);
		if (session.getAttribute("LOGIN_EMPINFO") == null) {
			return "redirect:/user/join/loginForm.do";
		} else {
			Map<String, String> publicKeyMap = cryptoGen.getGeneratePairKey(session);
			session.setAttribute("publicKeyMap", publicKeyMap);
			return "user/join/mainForm";
		}
	}

	public ModelAndView joinList(HttpServletRequest request, HttpSession session)
			throws Exception {

		return null;
	}

	public ModelAndView updateJoin(ModelAndView andView) throws Exception {

		return null;
	}

	public String insertJoin() throws Exception {

		return null;
	}

	public String deleteJoin() throws Exception {

		return null;
	}

	@RequestMapping("join_list")
	public ModelAndView join_list(HttpServletRequest request,
			ModelAndView andView, HttpSession session, String search_keyword,
			String search_keycode, String currentPage, String emp_code, Map<String,String> params)
			throws Exception {
		
		
		
		if (currentPage == null) {
			currentPage = "1";
		}
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		emp_code = ((EmpVO)session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		
		int totalCount = service.totalCount(params);
		RolePagingUtil paging = new RolePagingUtil(Integer.parseInt(currentPage),totalCount,request);
		params.put("startCount",  String.valueOf(paging.getStartCount()));
		params.put("endCount", String.valueOf(paging.getEndCount()));

		List<JoinVO> joinLast = service.joinFinalList(params);
		andView.addObject("page", paging.getPagingHtmls());
		andView.addObject("joinLast", joinLast);
		andView.setViewName("user/join/join_list");
		return andView;
	}

	@RequestMapping("join_insert")
	public ModelAndView join_insert(ModelAndView andView) throws Exception {
//		List<RqppsVO> rqName = service.rqppsNm();
		// List<EmpVO> empList = service.empList();
//		andView.addObject("rqName", rqName);
		// andView.addObject("empList",empList);
		andView.setViewName("user/join/join_insert");
		return andView;
	}

	@RequestMapping("join_insertFinal")
	public ModelAndView join_insertFinal(ModelAndView andView,HttpSession session,String emp_code, Map<String, String> params) throws Exception {
		emp_code = ((EmpVO)session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		List<RqppsVO> rqName = service.rqppsNm(params);
		andView.addObject("rqName", rqName);
		andView.setViewName("user/join/join_insertFinal");
		return andView;
	}

	@RequestMapping("join_view")
	public Model joinView(String rqpps_code, Model model,
			Map<String, String> params) throws Exception {

		params.put("rqpps_code", rqpps_code);
		List<JoinVO> joList = service.clickList(params);
		
//		String project_code = "";
//		if(joList.get(0).getProject_code()==null){
//			project_code = "";
//		}else{
//			project_code = joList.get(0).getProject_code();
//		}
		String project_code = joList.get(0).getProject_code();
		List<JoinVO> addList = service.addList(params);
		model.addAttribute("joList", joList);
		model.addAttribute("rqpps_code",rqpps_code);
		model.addAttribute("project_code",project_code);
		model.addAttribute("addList", addList);

		return model;
	}

	@RequestMapping("join_ajax")
	public ModelAndView join_ajax(String rqpps_code, String emp_code,
			HttpSession session, Map<String, String> params,
			ModelAndView andView) throws Exception {

		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("rqpps_code", rqpps_code);

		MpJoinVO mpJoinInfo = service.mpList(params);
		String eqEmp = mpJoinInfo.getEmp_code();
		System.out.println(emp_code);
		System.out.println(eqEmp);
		if (emp_code.equals(eqEmp)) {
			andView.addObject("mpJoinInfo", mpJoinInfo);
			// application-views.xml 내 선언된 빈의 id
			andView.setViewName("jsonConvertView");
		} else {
			System.out.println("등록할수없습니다. 제안요청서 작성자가 작성해주시길바랍니다.");
			String ddd = "no";
			andView.addObject("ddd", ddd);
			andView.setViewName("jsonConvertView");
		}
		return andView;

		// InternalResourceViewResolvers
		// /WEB-INF/views/jsonConvertView.jsp
	}

	@RequestMapping("join_specialList")
	public ModelAndView join_specialList(String emp_level,
			Map<String, String> params, ModelAndView andView) throws Exception {

		params.put("emp_level", emp_level);

		List<EmpVO> empLeveltest = service.empList1(params);

		andView.addObject("empLeveltest", empLeveltest);
		// application-views.xml 내 선언된 빈의 id
		andView.setViewName("jsonConvertView");

		// InternalResourceViewResolvers
		// /WEB-INF/views/jsonConvertView.jsp
		return andView;
	}

	@RequestMapping("join_levelInsert")
	public ModelAndView join_levelInsert(String list, String select,
			String listHigh, String selectHigh, Map<String, String> params,
			ModelAndView andView) throws Exception {

		System.out.println(list);// EMP코드
		System.out.println(select);// 제안요청서코드
		String[] sp = list.split("/");
		for (int i = 0; i < sp.length; i++) {
			params.put("emp_code", sp[i]);
			params.put("rqpps_code", select);
			service.insertJoinInfo(params);
			params.clear();
		}
		// join에서 join_status 를 y => n
		params.clear();
		params.put("rqpps_code", select);
		service.updateStatus(params);
		
		
		// 제안요청서 상태 바꿔주는 곳
		params.clear();
		params.put("rqpps_code", select);
		params.put("rqpps_now_condition", "2");
		rfpService.updateRfpCondition(params);
		
		andView.setViewName("jsonConvertView");

		return andView;
	}
	
	@RequestMapping("join_add_insert")
	public ModelAndView join_add_insert(
			Map<String, String> params,
			ModelAndView andView,
			String rqpps_code,
			String project_code,
			JoinVO jvo,
			HttpServletRequest request) throws Exception {
		String dong[] = request.getParameterValues("myArray[]");
		System.out.println(dong[0]);
		for (int i = 0; i < dong.length; i++) {
			jvo.setEmp_code(dong[i]);
			jvo.setRqpps_code(rqpps_code);
			jvo.setProject_code(project_code);
			service.insertAdd(jvo);
			jvo.setEmp_code(null);
		}
		
		System.out.println("asdfasdfsdfsdfsd fesdfsdddf"+rqpps_code);
		andView.addObject("rqpps_code",rqpps_code);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	
	@RequestMapping("join_updateRole")
	public String join_updateRole(JoinVO vo, String select,
			String listHigh, String selectHigh, Map<String, String> params,
			ModelAndView andView) throws Exception {

		String[] joincodeList = vo.getJoin_code().split(",");
		String[] positionNameList = vo.getPosition_name().split(",");
		
		for (int i = 0; i < joincodeList.length; i++) {
			JoinVO joinInfo = new JoinVO();
			joinInfo.setJoin_code(joincodeList[i]);
			joinInfo.setPosition_name(positionNameList[i]);
			service.updateRole(joinInfo);
		}
		
//		andView.addObject("vo",vo);
//		andView.setViewName("user/join/join_list");
		
		return "redirect:/user/join/join_list.do";
	}
	
	
	@RequestMapping("listAdd")
	public ModelAndView listAdd(String list, String select,
			String listHigh, String selectHigh, Map<String, String> params,
			ModelAndView andView) throws Exception {
		
		System.out.println(list);// EMP코드
		System.out.println(select);// 제안요청서코드
		String[] sp = list.split("/");
		for (int i = 0; i < sp.length; i++) {
			params.put("emp_code", sp[i]);
			params.put("rqpps_code", select);
			service.insertJoinInfo(params);
			params.clear();
		}
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	//개발자보낸보고서함 삭제
	@RequestMapping("deleteAddList")
	public ModelAndView deleteAddList(ModelAndView andView, String join_code
			,Map<String, String> params
			,String rqpps_code) throws SQLException{
		params.put("join_code", join_code);
		service.deleteAdd(params);
		andView.setViewName("jsonConvertView");
		return andView;
	}
		
	
	
}
