package kr.or.ddit.pblancboard.controller.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.pblancboard.service.IPblancboardService;
import kr.or.ddit.utils.AllFileMapper;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.NoticeAllVO;
import kr.or.ddit.vo.PblancBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/pblancboard")
public class PblancboardController {
	
	@Resource
	private IPblancboardService service;
	
	@Autowired
	private AllFileMapper allFileMapper;
	
	@RequestMapping("pblancboardForm")
	public void pblancboardForm(){}
	
	@RequestMapping("pblancboardList")
	public ModelAndView pblancboardList(HttpServletRequest request, HttpSession session 
			,String search_keyword, String search_keycode, String currentPage, 
			Map<String, String> params, ModelAndView andView) throws Exception{
		
		if(currentPage==null){
			currentPage = "1";
		}
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(Integer.parseInt(currentPage),totalCount,request);
		
		params.put("startCount",  String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
		List<PblancBoardVO> pblancboardList = service.pblancboardList(params);
		
		andView.addObject("pagingUtil",pagingUtil.getPagingHtmls());
		andView.addObject("pblancboardList", pblancboardList);
		andView.setViewName("user/pblancboard/pblancboardList");
		return andView;
	}
	
	@RequestMapping("pblancboardView")
	public ModelAndView ModelAndView(HttpSession session, String pblanc_board_code, 
			ModelAndView andView, Map<String, String> params) throws Exception{
	
		params.put("pblanc_board_code", pblanc_board_code);
		
		PblancBoardVO pblancboardInfo = service.pblancboardInfo(params);
		
		String keycode = (String) session.getAttribute("search_keycode");
		String keyword = (String) session.getAttribute("search_keyword");
		
		session.setAttribute("keycode", keycode);
		session.setAttribute("keyword", keyword);
		
		andView.setViewName("user/pblancboard/pblancboardView");
		andView.addObject("pblancboardInfo", pblancboardInfo);
		return andView;
	}
	
	@RequestMapping("insertPblancboard")
	public String insertPblancboard(PblancBoardVO pblancboardInfo, HttpSession session,
			  String emp_code, @RequestParam("files") MultipartFile[] files) throws Exception{

		pblancboardInfo.setEmp_code(((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code());
		service.insertPblancboardInfo(pblancboardInfo, files);
		return "redirect:/user/pblancboard/pblancboardList.do";
	}
	
	
	@RequestMapping("updatePblancboard")
	public ModelAndView updatePblancboard(@RequestBody String queryString, 
			PblancBoardVO pblancboardInfo, ModelAndView andView) throws Exception{
		
		service.updatePblancboardInfo(pblancboardInfo);
		
		andView.setViewName("redirect:/user/pblancboard/pblancboardList.do");
		return andView;
	}
	
	@RequestMapping("deletePblancboard/{pblanc_board_code}")
	public String deletePblancboard(@PathVariable("pblanc_board_code") String pblanc_board_code, Map<String, String> params) throws Exception{
		params.put("pblanc_board_code", pblanc_board_code);
		
		service.deletePblancboardInfo(params);
		
		return "redirect:/user/pblancboard/pblancboardList.do";
	}
	
	public String insertPblancboard() throws Exception{
		
		return null;
	}
	
	
}

