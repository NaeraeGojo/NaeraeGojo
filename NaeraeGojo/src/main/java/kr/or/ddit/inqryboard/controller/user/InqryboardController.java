package kr.or.ddit.inqryboard.controller.user;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.inqryboard.service.IInqryboardService;
import kr.or.ddit.utils.AllFileMapper;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.SetContent;
import kr.or.ddit.vo.InqryBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/inqryboard/")
public class InqryboardController {
	
	@Resource
	IInqryboardService service;
	
	
	@RequestMapping("inqryForm")
	public void inqryForm(){}

	@RequestMapping("inqryList")
	public Model inqryList(Model model, HttpServletRequest request, HttpSession session 
			,String search_keyword, String search_keycode, String currentPage) throws SQLException{
		if(currentPage==null || currentPage == ""){
			currentPage = "1";
		}
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(Integer.parseInt(currentPage), totalCount, request, 10);
		
		params = SetContent.setParams(params, paging);
		
		List<InqryBoardVO> inqryboardList = service.inqryBoardList(params);
		
		model.addAttribute("inqryboardList", inqryboardList);
		model.addAttribute("page", paging.getPagingHtmls());
		
		return model;
	}
	
	@RequestMapping("inqryView")
	public ModelAndView inqryView(String inqry_board_code, ModelAndView model, 
			Map<String, String> params) throws SQLException{
		params.put("inqry_board_code", inqry_board_code);
		InqryBoardVO ibv = service.inqryBoardInfo(params);
		
		int inqry_board_hit = Integer.parseInt(ibv.getInqry_board_hit());
		inqry_board_hit ++;
		
		ibv.setInqry_board_hit(String.valueOf(inqry_board_hit));
		
//		service.updateInqryInfo(ibv, files);
		model.addObject("ibv", ibv);
		model.setViewName("user/inqryboard/inqryView");
		
		return model;
	}
	
	@RequestMapping("inqryUpdate")
	public String inqryUpdate(InqryBoardVO inqryInfo, @RequestParam("files") MultipartFile[] files) throws Exception {
		service.updateInqryInfo(inqryInfo, files);
		return "redirect:/user/inqryboard/inqryList.do";
	}

	@RequestMapping("inqryInsert")
	public String inqryInsert(InqryBoardVO inqryInfo, @RequestParam("files") MultipartFile[] files) throws Exception {
		service.insertInqryInfo(inqryInfo, files);
		
		return "redirect:/user/inqryboard/inqryList.do";
	}	
	
	@RequestMapping("inqryDelete")
	public String inqryDelete(String inqry_board_code, Map<String, String> params) throws Exception {
		params.put("inqry_board_code", inqry_board_code);
		
		service.deleteInqryInfo(params);
		
		return "redirect:/user/inqryboard/inqryList.do";
	}
	
	
	
	
	
	
}

