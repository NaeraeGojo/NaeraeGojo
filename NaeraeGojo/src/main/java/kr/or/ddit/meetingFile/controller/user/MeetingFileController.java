package kr.or.ddit.meetingFile.controller.user;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;

import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.meetingFile.service.IMeetingFileService;
import kr.or.ddit.vo.MeetFileVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/meetingFile2/")
class MeetingFileController {
	
	@Resource
	private IMeetingFileService service;
	
	
	@RequestMapping("meetFileDownload")
	public ModelAndView fileDownload(ModelAndView andView, String meeting_file_code
									,Map<String, String> params) throws Exception{
		params.put("meeting_file_code", meeting_file_code);
		MeetFileVO fileInfo = service.getMeetingFile(params);
		
		File meetingFile = new File(GlobalConstant.MEETING_SAVE_PATH, fileInfo.getMeeting_file_save_name());
		
		andView.addObject("downloadFile", meetingFile);
		andView.addObject("downloadFileName", fileInfo.getMeeting_file_save_name());
		andView.setViewName("downloadView");
		
		return andView;
	}
	
}
