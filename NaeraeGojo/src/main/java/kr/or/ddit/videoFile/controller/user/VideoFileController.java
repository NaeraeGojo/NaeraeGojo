package kr.or.ddit.videoFile.controller.user;

import kr.or.ddit.videochatroom.service.IVideoChatService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user/videoFile/")
public class VideoFileController {
	
	@Autowired
	private IVideoChatService service;

	
	
}

