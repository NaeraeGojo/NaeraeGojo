package kr.or.ddit.history.controller.user;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.emp.service.IEmpService;
import kr.or.ddit.history.service.IHistoryService;
import kr.or.ddit.userfile.service.IUserFileService;
import kr.or.ddit.utils.AttachPictureMapper;
//import kr.or.ddit.utils.AttachPictureMapper;
import kr.or.ddit.vo.HistoryVO;
import kr.or.ddit.vo.UserFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/history/")
public class HistoryController {
	@Autowired
	private AttachPictureMapper pictureMapper;
	
	@Resource
	private IHistoryService service;
	
	@Resource
	private IEmpService empService;
	
	@Resource
	private IUserFileService userFileServ;
	
	
	@RequestMapping("idPicFileUpload")
	public void idPicFileUpload(){}
	
	@RequestMapping("idFileUpload")
	public ModelAndView idFileUpload(ModelAndView mav
									, String user_file_save_name
									, @RequestParam("file") MultipartFile file) throws Exception{
		
		UserFileVO ufv = pictureMapper.picture_mapping(file);
		userFileServ.insertUserFile(ufv);
		
		user_file_save_name = ufv.getUser_file_save_name();
		
//		mav.addObject("ufv", ufv);
//		mav.addObject("file", file);
		mav.addObject("user_file_save_name", user_file_save_name);
		mav.setViewName("jsonConvertView");
		
		return mav;
	}
	
	@RequestMapping("insertHistory")
	public ModelAndView insertHistory(HistoryVO historyInfo
			,String emp_code
//			,string history_notice_agency
//			,string history_demand_agency
//			,string history_project_start
//			,string history_project_end
//			,string history_project_name
//			,string history_business
//			,string history_delete
			,Map<String, String> params
			,ModelAndView andView) throws Exception{
		
		params.put("emp_code", emp_code);
//		params.put("history_notice_agency", history_notice_agency);
//		params.put("history_demand_agency", history_demand_agency);
//		params.put("history_project_start", history_project_start);
//		params.put("history_project_end", history_project_end);
//		params.put("history_project_name", history_project_name);
//		params.put("history_business", history_business);
//		params.put("history_delete", history_delete);
		
		service.insertHistoryInfo(historyInfo);

		andView.addObject("historyInfo", historyInfo);	
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("updateHistory")
	public ModelAndView updateHistory(HistoryVO historyInfo
			,ModelAndView andView) throws Exception{
		
		service.updateHistoryInfo(historyInfo);
		andView.addObject("historyInfo", historyInfo);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("historyList")
	public ModelAndView historyList(HttpServletRequest request,
			String emp_code,
			HttpSession session) throws SQLException{
		Map<String, String> params = new HashMap<String, String>(); 
		params.put("emp_code", emp_code);
		
		List<HistoryVO> historyList = service.historyList(params);
		
		ModelAndView andView = new ModelAndView();
		
		andView.addObject("historyList", historyList);
		andView.setViewName("history/historyList");
		
		return andView;
	}
	
	@RequestMapping("deleteHistory")
	public String deleteHistory(String history_code,
			String emp_code,
			Map<String, String> params,
			Map<String, String> params1,
			ModelAndView andView) throws Exception{
		params.put("history_code", history_code);
		params1.put("emp_code", emp_code);

		service.deleteHistoryInfo(params);

//		
//		EmpVO empInfo = empService.empInfo(params1);
//		List<HistoryVO> historyList = service.historyList(params1);
		
//		andView.addObject("historyList", historyList);
//		andView.addObject("empInfo", empInfo);
//		andView.setViewName("redirect:/user/emp/empList.do");
		
		return "redirect:/user/emp/empUpdate.do?emp_code="+emp_code;
	}
	
	@RequestMapping("historyView")
	public ModelAndView historyView(String history_code,
			ModelAndView andView, Map<String,String> params)throws Exception{
		
		params.put("history_code", history_code);
		
		HistoryVO historyInfo = service.historyInfo(params);
		
		andView.addObject("historyInfo", historyInfo);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	
	
	public ModelAndView updateHistroy(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	
	
}

