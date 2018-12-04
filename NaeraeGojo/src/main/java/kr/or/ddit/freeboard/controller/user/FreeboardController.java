package kr.or.ddit.freeboard.controller.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.SetContent;
import kr.or.ddit.vo.FreeBoardVO;
import kr.or.ddit.vo.ProjectVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/project/freeboard/")
public class FreeboardController {
	
	@Resource
	IFreeboardService service;
	
	@Resource
	IProjectService pservice;
	
	
	@RequestMapping("freeboardList")
	public ModelAndView freeboardList(HttpServletRequest request, HttpSession session, String currentPage,
			Map<String, String> params, ModelAndView andView) throws SQLException{
		params = SetContent.getParams(request);
		
		String project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		SetContent.setPath(request);
		
		currentPage = SetContent.getPage(request);
		int totalCount = service.totalCount(params);
		RolePagingUtil paging = new RolePagingUtil(Integer.parseInt(currentPage), totalCount, request, 10);
		params = SetContent.setParams(params, paging);
		
		List<FreeBoardVO> freeboardList = service.freeboardList(params);
		
		andView.addObject("freeboardList", freeboardList);
		
		ProjectVO pv = pservice.projectInfo(params);
		andView.addObject("pv", pv);
		
		andView.setViewName("user/project/freeboard/freeboardList");
		
		return andView;
	}
	
	@RequestMapping("freeboardForm")
	public void freeboardForm(){}
	
	@RequestMapping("freeboardView")
	public void freeboardView(){}
	@RequestMapping("freeboardUpdate")
	public void freeboardUpdate(){}
	@RequestMapping("freeboardReply")
	public void freeboardReply(){}

	
	
	public ModelAndView freebaordList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updateFreebaord(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertFreebaord() throws Exception{
		
		return null;
	}
	
	
	public String deleteFreebaord() throws Exception{
		
		return null;
	}
}

