package kr.or.ddit.recsroomans.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.recsroomans.service.IRecsRoomAnsService;
import kr.or.ddit.vo.RecsRoomAnsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class RecsRoomAnsControllerAdm {
	@Autowired
	private IRecsRoomAnsService service;

	
	public void RecsRoomAnsForm(){}
	
	
	public Model RecsRoomAnsList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model RecsRoomAnsView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertRecsRoomAns(RecsRoomAnsVO rrav
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteRecsRoomAns(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateRecsRoomAns(RecsRoomAnsVO rrav ,HttpServletRequest request) throws Exception{
		
		return "";
	}
	
}


