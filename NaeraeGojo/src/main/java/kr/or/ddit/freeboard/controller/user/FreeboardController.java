package kr.or.ddit.freeboard.controller.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.SetContent;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.FreeBoardAnsVO;
import kr.or.ddit.vo.FreeBoardVO;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/project/freeboard/")
public class FreeboardController {
	
	@Resource
	IFreeboardService service;
	
	@Resource
	IProjectService pservice;
	
	
	@RequestMapping("freeboardForm")
	public void freeboardForm(){}
	
	@RequestMapping("freeboardList")
	public Model freeboardList(Model model, Map<String, String> params, HttpServletRequest request, 
			HttpSession session, String currentPage) throws SQLException{
		params = SetContent.getParams(request);
		
		String project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		SetContent.setPath(request);
		
		currentPage = SetContent.getPage(request);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(Integer.parseInt(currentPage), totalCount, request, 10);
		
		params = SetContent.setParams(params, paging);
		
		List<FreeBoardVO> freeboardList = service.freeboardList(params);
		
		model.addAttribute("freeboardList", freeboardList);
		
		ProjectVO pv = pservice.projectInfo(params);
		
		model.addAttribute("pv", pv);
		
		model.addAttribute("page", paging.getPagingHtmls());
		
		return model;
	}
	
	@RequestMapping("freeboardView")
	public ModelAndView freeboardView(String freeboard_code, ModelAndView model, 
			Map<String, String> params) throws Exception{
		params.put("freeboard_code", freeboard_code);
		FreeBoardVO fbv = service.freeboardInfo(params);
		
		int freeboard_hit = Integer.parseInt(fbv.getFreeboard_hit());
		freeboard_hit ++;
		
		fbv.setFreeboard_hit(String.valueOf(freeboard_hit));
		
//		params.put("rnum", rnum);
//		List<FreeBoardAnsVO> replyList = service.replyFreeList(params);
		
		MultipartFile[] files = {};
		service.updateFreeboardInfo(fbv, files);
				
		model.addObject("fbv", fbv);
//		model.addObject("replyList", replyList);
//		model.addObject("emp_code", emp_code);
//		model.addObject("rnum", rnum);
		
		model.setViewName("user/project/freeboard/freeboardView");
		
		return model;
	}
		
	@RequestMapping("freeboardUpdate")
	public String freeboardUpdate(FreeBoardVO freeboardInfo, @RequestParam("files") MultipartFile[] files
								, HttpServletRequest request) throws Exception{
		service.updateFreeboardInfo(freeboardInfo, files);
		return "redirect:/user/project/freeboard/freeboardList.do";
	}

	@RequestMapping("freeboardInsert")
	public String freeboardInsert(FreeBoardVO freeboardInfo, @RequestParam("files") MultipartFile[] files) throws Exception {
		service.insertFreeboardInfo(freeboardInfo, files);
		
		return "redirect:/user/project/freeboard/freeboardList.do";
	}
	
	@RequestMapping("freeboardDelete")
	public String freeboardDelete(String freeboard_code, Map<String, String> params) throws Exception{
		params.put("freeboard_code", freeboard_code);
		
		service.deleteFreeboardInfo(params);
		
		return "redirect:/user/project/freeboard/freeboardList.do";
	}
	
	@RequestMapping("freeboardReply")
	public void freeboardReply(){}
	
}

