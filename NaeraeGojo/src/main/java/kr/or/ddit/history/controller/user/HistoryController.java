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
	@Resource
	private IHistoryService service;
	
	@Resource
	private IEmpService empService;
	
	
	@RequestMapping("historyForm")
	public void historyForm(){}

	@RequestMapping("insertHistory")
	public String insertHistory(HistoryVO historyInfo
			,String emp_code) throws Exception{
		service.insertHistoryInfo(historyInfo);
		return "redirect:/history/historyList.do?emp_code="+emp_code;
	}
	
	@RequestMapping("updateHistory")
	public String updateHistory(HistoryVO historyInfo, String emp_code) throws Exception{
		service.updateHistoryInfo(historyInfo);
		return "redirect:/history/historyList.do?emp_code="+emp_code;
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
			Map<String, String> params1) throws Exception{
		params.put("history_code", history_code);
		params1.put("emp_code", emp_code);

		service.deleteHistoryInfo(params);

		return "redirect:/history/historyList.do";
	}
	
	@RequestMapping("historyView")
	public ModelAndView historyView(String history_code,
			ModelAndView andView, Map<String,String> params)throws Exception{
		params.put("history_code", history_code);
		
		HistoryVO historyInfo = service.historyInfo(params);
		
		andView.addObject("historyInfo", historyInfo);
		andView.setViewName("history/historyView");
		
		return andView;
	}
	
	
}

