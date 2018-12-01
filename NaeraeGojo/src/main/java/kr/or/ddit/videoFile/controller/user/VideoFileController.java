package kr.or.ddit.videoFile.controller.user;

import java.io.File;
import java.util.Map;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.videoFile.service.IVideoFileService;
import kr.or.ddit.vo.VideoFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/user/videoFile/")
public class VideoFileController {
	
	@Autowired
	private IVideoFileService service;
	
	@RequestMapping("videochatFileDown")
	public ModelAndView videochatFileDown(ModelAndView andView, String video_file_code, Map<String, String> params) throws Exception{
		
		params.put("video_file_code", video_file_code);
		VideoFileVO videofileInfo = service.getVideoFile(params);
		
		File videoFile = new File(GlobalConstant.MEETING_SAVE_PATH, videofileInfo.getVideo_file_save_name());
		
		andView.addObject("downloadFile",videoFile);
		andView.addObject("downloadFileName", videofileInfo.getVideo_file_save_name());
		andView.setViewName("downloadView");
		return andView;
	}

	
	
}

