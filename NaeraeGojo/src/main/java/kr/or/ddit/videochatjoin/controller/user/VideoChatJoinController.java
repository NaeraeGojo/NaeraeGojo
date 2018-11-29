package kr.or.ddit.videochatjoin.controller.user;

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
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/videoChatJoin/")
public class VideoChatJoinController {
	@Autowired
	private IVideoChatJoinService service;

	
	
	public Model VideoChatRoomList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	@RequestMapping("videoChatJoin")
	public ModelAndView insertVideoChatRoom(VideoChatJoinVO vcv, ModelAndView andView, String video_chat_join_code
										, HttpSession session, Map<String, String> params) throws Exception{
		
		
		return andView;
	}
	
	
}

