package kr.or.ddit.recsroom.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.recsroom.service.IRecsRoomService;
import kr.or.ddit.vo.RecsRoomVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class RecsRoomControllerAdm {
	@Autowired
	IRecsRoomService service;

	
	public void RecsRoomForm(){}
	
	
	public Model RecsRoomList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model RecsRoomView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertRecsRoom(RecsRoomVO rrv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteRecsRoom(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateRecsRoom(RecsRoomVO rrv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}

