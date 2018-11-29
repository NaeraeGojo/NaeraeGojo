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
		
		params.put("video_chat_join_code", video_chat_join_code);
		
		// 챗 조인 나머지 인설트 (==업데이트)
		service.insertVideoChatJoin(params);
		
		// 화상회의 방 pk 값 가져오기
		String video_chat_room_code = service.getVideoRoomCode(video_chat_join_code);
		
		// 화상회의 url 가져오기
		String urlInfo = service.getUrlInfo(video_chat_room_code);
		
		andView.addObject("urlInfo", urlInfo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	
}

