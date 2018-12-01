package kr.or.ddit.recsroom.controller.user;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.project.service.IProjectService;
import kr.or.ddit.recsroom.service.IRecsRoomService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.SetContent;
import kr.or.ddit.vo.ProjectAllFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.RecsRoomVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/user/project/recs/")
public class RecsRoomController {
	
	@Autowired
	IRecsRoomService service;
	
	@Autowired
	IProjectService pservice;
	
	@RequestMapping("recsForm")
	public void RecsRoomForm(){}

	@RequestMapping("recsList")
	public Model RecsRoomList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		params = SetContent.getParams(request);
		
		String project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		SetContent.setPath(request);
		
		currentPage = SetContent.getPage(request);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(Integer.parseInt(currentPage), totalCount, request,10);
		
		params = SetContent.setParams(params, paging);
		
		List<RecsRoomVO> rl = service.getRecsRoomList(params);
		
		model.addAttribute("rl",rl);
		
		ProjectVO pv = pservice.projectInfo(params);
		
		model.addAttribute("pv",pv);
		
		
		return model;
	}
	
	@RequestMapping("recsView")
	public Model RecsRoomView(String recsroom_code,Model model
								,Map<String, String> params) throws Exception{
		params.put("recsroom_code", recsroom_code);
		RecsRoomVO rrv = service.getRecsRoom(params);
		
		int recsroom_hit = Integer.parseInt(rrv.getRecsroom_hit());
		
		recsroom_hit ++;
		
		rrv.setRecsroom_hit(String.valueOf(recsroom_hit));
		
		MultipartFile[] files = {};
		
		service.updateRecsRoom(rrv, files);
		
		model.addAttribute("rrv",rrv);
		
		
		return model;
	}
	
	@RequestMapping("recsInsert")
	public String insertRecsRoom(RecsRoomVO rrv	
							,@RequestParam("files") MultipartFile[] files) throws Exception{
		
		service.insertRecsRoom(rrv , files);
		
		return "redirect:/user/project/recs/recsList.do";
	}
	
	@RequestMapping("recsDelete")
	public String deleteRecsRoom(String recsroom_code
								, Map<String, String> params) throws Exception{
		params.put("recsroom_code", recsroom_code);
		
		service.deleteRecsRoom(params);
		
		return "redirect:/user/project/recs/recsList.do";
	}
	
	@RequestMapping("recsUpdate")
	public String updateRecsRoom(RecsRoomVO rrv 
								, @RequestParam("files") MultipartFile[] files
								, HttpServletRequest request) throws Exception{
		
		service.updateRecsRoom(rrv,files);
		
		return "redirect:/user/project/recs/recsList.do";
	}
}

