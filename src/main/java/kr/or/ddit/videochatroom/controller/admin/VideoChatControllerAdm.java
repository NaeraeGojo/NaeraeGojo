package kr.or.ddit.videochatroom.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.videochatroom.service.IVideoChatService;
import kr.or.ddit.vo.VideoChatRoomVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class VideoChatControllerAdm {
	@Autowired
	private IVideoChatService service;

	
	
	public String insertVideoChat(VideoChatRoomVO vcv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteVideoChat(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateVideoChat(VideoChatRoomVO vcv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}


