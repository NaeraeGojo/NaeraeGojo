package kr.or.ddit.videochatjoin.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.videochatjoin.service.IVideoChatJoinService;
import kr.or.ddit.vo.VideoChatJoinVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class VideoChatJoinControllerAdm {
	@Autowired
	private IVideoChatJoinService service;

	
	public void VideoChatRoomForm(){}
	
	
	public Model VideoChatRoomList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model VideoChatRoomView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertVideoChatRoom(VideoChatJoinVO vcv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteVideoChatRoom(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateVideoChatRoom(VideoChatJoinVO vcv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}


