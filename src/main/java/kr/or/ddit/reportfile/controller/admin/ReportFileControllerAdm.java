package kr.or.ddit.reportfile.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.reportfile.service.IReportFileService;
import kr.or.ddit.vo.ReportFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ReportFileControllerAdm {
	@Autowired
	private IReportFileService service;

	
	public void ReportFileForm(){}
	
	
	public Model ReportFileList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model ReportFileView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertReportFile(ReportFileVO rfv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteReportFile(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateReportFile(ReportFileVO rfv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}

