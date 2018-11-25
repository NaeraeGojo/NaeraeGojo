package kr.or.ddit.report.controller.admin;

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
public class ReportControllerAdm {
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
}

