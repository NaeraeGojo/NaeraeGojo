package kr.or.ddit.report.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.report.service.IReportService;
import kr.or.ddit.vo.ReportVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	//PL 받은보고서함 뷰/삭제/피드백
	@RequestMapping("report_recViewPL")
	public String report_recViewPL(){
		return "user/report/report_recViewPL"; 
	}
	//개발자  보낸보고서함 리스트
	@RequestMapping("report_listDev")
	public void report_listDev(){
	}
	//개발자  보낸보고서함 등록/임시저장
	@RequestMapping("report_sendInsertDev")
	public String report_sendInsertDev(){
		return "user/report/report_sendInsertDev"; 
	}
	//개발자  보낸보고서함 뷰/삭제
	@RequestMapping("report_sendDeleteDev")
	public String report_sendDeleteDev(){
		return "user/report/report_sendDeleteDev"; 
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

