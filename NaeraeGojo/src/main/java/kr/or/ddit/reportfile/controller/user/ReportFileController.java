package kr.or.ddit.reportfile.controller.user;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.allfile.service.IAllFileService;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.reportfile.service.IReportFileService;
import kr.or.ddit.utils.AllFileMapper;
import kr.or.ddit.utils.ReportFileMapper;
import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.ReportFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportFileController {
	@Autowired
	private IReportFileService service;
	
	@Autowired
	private ReportFileMapper fileMapper;
	
	@RequestMapping("reportFileDownload")
	public ModelAndView reportFileDownload(ModelAndView andView,String report_file_code
			, Map<String, String> params) throws Exception{
		params.put("report_file_code", report_file_code);
		ReportFileVO rfv =service.getReportFile(params);
		
		File targetFile = new File(GlobalConstant.SAVE_REPORT, rfv.getReport_file_save_name()); 
		andView.addObject("downloadFile", targetFile);
		andView.addObject("downloadFileName",rfv.getReport_file_name());
		andView.setViewName("downloadView");
		return andView;
	}
	
	
	
	
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

