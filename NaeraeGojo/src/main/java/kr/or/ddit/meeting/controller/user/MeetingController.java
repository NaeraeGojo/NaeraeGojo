package kr.or.ddit.meeting.controller.user;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.meeting.service.IMeetingService;
import kr.or.ddit.meetingFile.service.IMeetingFileService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MeetFileVO;
import kr.or.ddit.vo.MeetPwVO;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkVO;
import kr.or.ddit.vo.TempMeetingVO;
import kr.or.ddit.vo.VideoChatRoomVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/meetingFile/")
public class MeetingController {
   
   @Resource
   private IMeetingService service;
   
   @Resource 
   private IMeetingFileService fileService;
   
   // http://localhost/NaeraeGojo/meeting/meetingList.do
   @RequestMapping(value="/meetingFileList")
   public ModelAndView meetingList(HttpServletRequest request, HttpSession session
		   									, String search_keycode
											, String search_keyword
											, String currentPage
											, ModelAndView andView
											 , Map<String, String> params ) throws Exception{
	   
   
	   
		currentPage = request.getParameter("currentPage");
		if(currentPage==null){
			currentPage="1";
		}
		
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(Integer.parseInt(currentPage), totalCount, request);
		
		params.put("startCount", String.valueOf(paging.getStartCount()));
		params.put("endCount", String.valueOf(paging.getEndCount()));
		
		List<TempMeetingVO> meetingList = service.meetingList(params);
		
		andView.addObject("paging", paging.getPagingHtmls());
		andView.addObject("meetingList", meetingList);
      
		andView.setViewName("user/meeting/meetingFileList");
      
		return andView;
   }
   
   @RequestMapping("meetingFileView/{meeting_code}")
   public ModelAndView meetingView(HttpServletRequest request, HttpSession session, ModelAndView andView,
		   							Map<String, String> params, @PathVariable String meeting_code) throws Exception{
	   
	   params.put("meeting_code", meeting_code);
	   List<TempMeetingVO> meetingInfo = service.meetingInfo(params);
	   service.updateHit(params);
	   
	   
	   andView.addObject("meetingInfo", meetingInfo);
	   andView.setViewName("user/meeting/meetingFileView");
      
	   return andView;
   }
    
   @RequestMapping(value="/meetingFileForm")
   public ModelAndView meetingForm(HttpServletRequest request, HttpSession session, ModelAndView andView) throws Exception{
	 
	   List<ProjectVO> projectInfo =service.getProjectNM();
	   
	   andView.addObject("projectInfo", projectInfo);
	   andView.setViewName("user/meeting/meetingFileForm");
     
	   return andView;
   }
   
   @RequestMapping("modalPW")
   public ModelAndView modalPW(String project_code, ModelAndView andView, Map<String, String> params) throws SQLException {
	   
	   System.out.println("코드" + project_code);
	   params.put("project_code", project_code);
	   
	   List<TempMeetingVO> modalPro = service.getProjectModal(params);
	   
	   andView.addObject("modalPro", modalPro);
	   andView.setViewName("jsonConvertView"); 
	   
	   return andView;
			   
   }
   
   @RequestMapping("modalAdd")
   public ModelAndView modalAdd( ModelAndView andView, Map<String, String> params, HttpServletRequest request) throws SQLException {
	   String[] aStr = request.getParameterValues("myArray[]");
	   
	   System.out.println("배열에 들어있는값 : "+Arrays.toString(aStr));
	   
	   List<String> list = new ArrayList<String>();
	   
	   for (int i = 0; i < aStr.length; i++) {
		   String pw_code = aStr[i];
		   params.put("pw_code", pw_code);
		   String param = service.getProjectname(params);
		   list.add(param);
	   }
	   
	   
	   andView.addObject("list", list);
	   andView.setViewName("jsonConvertView"); 
	   
	   return andView;
	   
   }
   
	@RequestMapping("insertMeeting")
	public String insertMeeting(MeetingVO mv, MeetPwVO mpv
									, MultipartFile files, Map<String, String> params
									, HttpSession session) throws Exception{
		
		String[] result = mpv.getPw_code().split(",");
		
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();	
		mv.setEmp_code(emp_code);
		
		String meeting_code = service.insertMeetingInfo(mv);
		
		for (int i = 0; i < result.length; i++) {
			params.put("meeting_code", meeting_code);
			
			params.put("pw_code", result[i]);
			service.insertmeetPw(params);
			params.clear();
		}
		
		if(files ==null){
			return "redirect:/user/meetingFile/meetingFileList.do";
		}
		
		if(!files.isEmpty()){
			fileService.insertMeetingFile(files, meeting_code );
		}
		
		return "redirect:/user/meetingFile/meetingFileList.do";
	}
	
   
	@RequestMapping("updateMeeting")
	public String updateMeeting(MeetingVO mv, MeetPwVO mpv, HttpServletRequest request
								,  MultipartFile files
								,  Map<String, String> params, HttpSession session) throws Exception{
		String[] result = mpv.getPw_code().split(",");
		
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();	
		mv.setEmp_code(emp_code);
		
		service.updateMeetingInfo(mv);
		
		String meeting_code = mv.getMeeting_code();
		
		params.put("meeting_code", meeting_code);
		
//		//리셋 작업
		service.deleteMeetPw(params);
		params.clear();
		
		for (int i = 0; i < result.length; i++) {
			params.put("meeting_code", meeting_code);
			params.put("pw_code", result[i]);
			service.insertmeetPw(params);
			params.clear();
		}
		
		if(files == null){
			return "redirect:/user/meetingFile/meetingFileList.do";
		}
		
		if (files!=null) {
			String filecode = fileService.getfileCode(meeting_code);
			if(filecode != null){
				fileService.updateMeetingFile(files, meeting_code);
			} else if(filecode == null){
				fileService.insertMeetingFile(files, meeting_code);
			}
		}
		
		
		
		return "redirect:/user/meetingFile/meetingFileList.do";
	}
	
	@RequestMapping("deleteMeeting/{meeting_code}")
	public String deleteMeeting(@PathVariable String meeting_code , Map<String, String> params) throws Exception{
		
		params.put("meeting_code", meeting_code);
		service.deleteMeetingInfo(params);
		
		return "redirect:/user/meetingFile/meetingFileList.do";
	}
   
   
}
