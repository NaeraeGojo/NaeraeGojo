package kr.or.ddit.report.controller.user;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.report.service.IReportService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.ReportVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/report/")
public class ReportController {
	@Autowired
	private IReportService service;

	
	public void ReportForm(){}
	
	
	public Model ReportList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model ReportView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertReport(ReportVO rv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteReport(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateReport(ReportVO rv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
	
	//PL 보낸/받은 보고서함 리스트
	@RequestMapping("report_listPL")
	public void report_listPL(){};
	
	//PL 보낸보고서함 등록/임시저장
	@RequestMapping("report_sendInsertPL")
	public String report_sendInsertPL(){
		System.out.println("asdfasdf");
		return "user/report/report_sendInsertPL"; 
	}
	//PL 보낸보고서함 삭제/뷰
	@RequestMapping("report_sendDeletePL")
	public String report_sendDeletePL(){
		return "user/report/report_sendDeletePL"; 
		
	}
	//PL 받은보고서함 뷰/삭제/피드백 고민만오지게햇네
	@RequestMapping("report_recViewPL")
	public String report_recViewPL(){
		return "user/report/report_recViewPL"; 
	}
	//개발자  보낸보고서함 리스트
	@RequestMapping("report_listDev")
	public ModelAndView report_listDev(HttpServletRequest request,
									ModelAndView andView,
									HttpSession session,
									String search_keyword,
									String search_keycode,
									String currentPage
									,String emp_code) throws Exception{
		if(currentPage==null){
			currentPage = "1";
		}
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();		
		System.out.println("아디아디아디아디"+emp_code);
		params.put("emp_code", emp_code);
		
		if(params != null){
			String message = (String) params.get("message");
			System.out.println("RedirectAttribute post 전송 파람 : " + message);
		}
		
		
		int totalCount = service.totalCount(params);
		RolePagingUtil paginUtil = new RolePagingUtil(Integer.parseInt(currentPage),totalCount,request);
		params.put("startCount",  String.valueOf(paginUtil.getStartCount()));
		params.put("endCount", String.valueOf(paginUtil.getEndCount()));
		
		List<ReportVO> reportList = service.reportList(params);
		
		andView.addObject("reportList",reportList);
		andView.addObject("pagingHtmls",paginUtil.getPagingHtmls());
		andView.setViewName("user/report/report_listDev");
		return andView;
	}
	
	
	
	
	
	//PL 받은보고서함 리스트
	@RequestMapping("report_listPLRec")
	public String report_listPLRec(){
		return "user/report/report_listPLRec"; 
	}
	
	
	//개발자  보낸보고서함 등록/임시저장
	@RequestMapping("report_sendFormDev")
	public ModelAndView report_sendInsertDev(
			ModelAndView andView,
			String emp_code,
			HttpSession session,
			Map<String, String> params) throws SQLException{
		
		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		List<ProjectVO> proName = service.projectNm(params);
		andView.addObject("proName",proName);
		andView.setViewName("user/report/report_sendFormDev");
		return andView; 
	}
	
	//개발자 INSERT
	@RequestMapping("report_FinalInsert")
	public String report_FinalInsert(
			ReportVO rvo,
			HttpSession session,
			Map<String, String> params) throws SQLException{
		
		String[] fullEmpCode = rvo.getEmp_code().split(",");
		rvo.setEmp_code_pm(fullEmpCode[0]);
		rvo.setEmp_code_pl(fullEmpCode[1]);
		
		String emp_code = null;
		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		rvo.setEmp_code(emp_code);
		service.insertReport(rvo);
		
		return "redirect:/user/report/report_listDev.do";
	}
	//프로젝트코드를 받아서 관련업무를 뽑아옴
	@RequestMapping("report_pw_people")
	public ModelAndView report_pw_people(
			ModelAndView andView,
			String project_code,
			Map<String, String> params) throws SQLException{
		
		params.put("project_code", project_code);
		List<ProjectWorkVO> pwName = service.pwName(params);
//		List<ReportVO> proPeople = service.projectPeople(params);
		andView.addObject("pwName",pwName);
//		andView.addObject("proPeople",proPeople);
		andView.setViewName("jsonConvertView");
		
		return andView; 
	}
	
	//프로젝트코드를 받아서 관련사람들을 뽑아옴 ( PM,PL emp_code 필요 )
	@RequestMapping("report_pw_people12")
	public ModelAndView report_pw_people12(
			ModelAndView andView,
			String project_code,
			Map<String, String> params) throws SQLException{
		
		params.put("project_code", project_code);
		List<ReportVO> proPeople = service.projectPeople(params);
		andView.addObject("proPeople",proPeople);
		andView.setViewName("jsonConvertView");
		
		return andView; 
	}
	
	
	
	
	//개발자  보낸보고서함 뷰/삭제
	@RequestMapping("report_sendDeleteDev/{report_code}")
	public ModelAndView report_sendDeleteDev(
			HttpServletRequest request,
			ModelAndView andView,
			ReportVO vo,
			@PathVariable String report_code, Map<String, String> params ,Map<String, String> params1
			)throws Exception{
		params.put("report_code", report_code);
		vo = service.reportView(params);
		String project_code = vo.getProject_code();
		params1.put("project_code", project_code);
		List<ReportVO> stList = service.reportStatus(params1);
//		vo = service.noticeAllInfo(params);
//		service.updateHit(params);
		andView.addObject("vo",vo);
		andView.addObject("stList",stList);
		andView.setViewName("user/report/report_sendDeleteDev");
		
		return andView;
	}
	
	
	//PM  받은보고서함 리스트
	@RequestMapping("report_listPM")
	public void report_listPM(){
	}
	//PM  받은보고서함 뷰/삭제/피드백
	@RequestMapping("report_recViewPM")
	public String report_recViewPM(){
		return "user/report/report_recViewPM"; 
	}
}

