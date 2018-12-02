package kr.or.ddit.freeboard.controller.user;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;









import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.FreeBoardVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/project/freeboard")
public class FreeboardController {
	@Resource
	private IFreeboardService service;
	
	@RequestMapping("freeboardList")
	public ModelAndView freeboardList(String project_code, HttpServletRequest request, HttpSession session,
			Map<String, String> params, ModelAndView andView) throws SQLException{
		project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		List<FreeBoardVO> freeboardList = service.freeboardList(params);
		
		andView.addObject("freeboardList", freeboardList);
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

