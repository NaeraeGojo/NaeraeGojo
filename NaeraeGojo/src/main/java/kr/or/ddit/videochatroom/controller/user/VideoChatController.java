package kr.or.ddit.videochatroom.controller.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.videoFile.service.IVideoFileService;
import kr.or.ddit.videochatroom.service.IVideoChatService;
import kr.or.ddit.vo.ChatPwVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.ProjectWorkClassVO;
import kr.or.ddit.vo.VideoChatRoomVO;
import kr.or.ddit.vo.ChatListTempVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sun.corba.se.spi.activation.Server;

@Controller
@RequestMapping("/user/video/")
public class VideoChatController {
	
	@Autowired
	private IVideoChatService service;

	@Autowired
	private IVideoFileService Fileservice;
	
	// http://localhost/user/video/
	@RequestMapping(value="/chatList")
	public ModelAndView videoChatList(Model model, Map<String, String> params 
											, HttpServletRequest request
											, HttpSession session
											, String search_keycode
											, String search_keyword
											, String currentPage
											, ModelAndView andView
											, String emp_code) throws Exception{
	
		
		currentPage = request.getParameter("currentPage");
		if(currentPage==null){
			currentPage="1";
		}
		
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();		
		System.out.println("아디아디아디아디"+emp_code);
		params.put("emp_code", emp_code);
		int totalCount = service.totalCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(Integer.parseInt(currentPage), totalCount, request);
		
		params.put("startCount", String.valueOf(paging.getStartCount()));
		params.put("endCount", String.valueOf(paging.getEndCount()));
		
		
		List<ChatListTempVO> chatroomList = service.getVideoChatList(params);
		
		
		andView.addObject("chatroomList", chatroomList);
		andView.addObject("paging", paging.getPagingHtmls());
		andView.setViewName("user/videochat/videochatList");
		return andView;
	}
	
	@RequestMapping("chatView/{video_chat_room_code}")
	public ModelAndView videoChatView(HttpServletRequest request, HttpSession session, ModelAndView andView, 
							@PathVariable String video_chat_room_code, Map<String, String> params) throws Exception{
	
		params.put("video_chat_room_code", video_chat_room_code);
		
		List<ChatListTempVO> chatInfo = service.getVideoChat(params);
		
		andView.addObject("chatInfo", chatInfo);
		andView.setViewName("user/videochat/videochatView");
		return andView;
	}
	
	@RequestMapping(value="/chatForm")
	public ModelAndView videoChaForm(HttpServletRequest request, HttpSession session, ModelAndView andView) throws Exception{
	
		andView.setViewName("user/videochat/videochatForm");
		return andView;
	}
	
	@RequestMapping("videochatUpdate")
	public String updateVideoChat(VideoChatRoomVO vcv ,HttpServletRequest request, MultipartFile files ) throws Exception{
			
		service.updateVideoChat(vcv);
		
		String video_chat_room_code = vcv.getVideo_chat_room_code();
		
		if(!files.isEmpty()){
			Fileservice.insertChatFile(video_chat_room_code, files);
		}
		
		return "redirect:/user/video/chatList.do";
	}
	
	
	public String insertVideoChat(VideoChatRoomVO vcv
									,  MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	@RequestMapping("deleteVideoChat/{video_chat_room_code}")
	public String deleteVideoChat(@PathVariable String video_chat_room_code, Map<String, String> params) throws Exception{
		
		System.out.println("코두 " + video_chat_room_code);
		
		params.put("video_chat_room_code", video_chat_room_code);
		service.deleteVideoChat(params);
		
		return "redirect:/user/video/chatList.do";
	}
	
	@RequestMapping("modalProject")
	public ModelAndView modalProject(ModelAndView andView, HttpSession session, Map<String, String> params) throws SQLException{
		
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);		
		
		List<ProjectVO> projectList = service.getProjectList(params);
		
		andView.addObject("projectList", projectList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("modalempList")
	public ModelAndView modalempList(ModelAndView andView, HttpSession session, Map<String, String> params
									, String project_code) throws SQLException{
		
		
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);	
		
		session.setAttribute("TMP_PROJECT", project_code);
		
		params.put("project_code", project_code);
		
		List<EmpVO> empList = service.getEmpList(params);
		
		andView.addObject("empList", empList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("insertempList")
	public ModelAndView insertempList(ModelAndView andView, HttpServletRequest request, HttpSession session, Map<String, String> params
			, String project_code) throws SQLException{
		
		project_code = (String) session.getAttribute("TMP_PROJECT");
		
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		
		System.out.println("asdfsd    " + project_code);
		
		String[] empArray = request.getParameterValues("tmpArray[]");
		
		params.put("project_code", project_code);
		params.put("emp_code", emp_code);
		
		String video_chat_room_code =service.insertVideoChat(params);
		
		for (int i = 0; i < empArray.length; i++) {
			params.clear();
			String join_emp = empArray[i];
			params.put("emp_code", join_emp);
			params.put("video_chat_room_code", video_chat_room_code);
			service.insertJoin(params);
		}
		
		params.clear();
		
		params.put("emp_code", emp_code);
		params.put("video_chat_room_code", video_chat_room_code);
		service.insertJoin(params);
		
		andView.addObject("video_chat_room_code", video_chat_room_code);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("room/{video_chat_room_code}")
	public ModelAndView videochatRoom(ModelAndView andView, HttpServletRequest request, Map<String, String> params,
								@PathVariable String video_chat_room_code) throws Exception{
		
		ProjectVO projectInfo = service.getProjectNM(video_chat_room_code);
		
		params.put("video_chat_room_code", video_chat_room_code);
		List<ProjectWorkClassVO> pwcList = service.getPwcList(params);
		
		
		andView.addObject("pwcList", pwcList);
		andView.addObject("video_chat_room_code",video_chat_room_code);
		andView.addObject("projectInfo", projectInfo);
		andView.setViewName("user/videochat/videochatRoom");
		return andView;
	}
	
	@RequestMapping("urlInsert")
	public ModelAndView urlInsert(String video_chat_room_code, String video_chat_room_url,
								ModelAndView andView, HttpServletRequest request, Map<String, String> params
								) throws Exception {
		
		params.put("video_chat_room_code", video_chat_room_code);
		params.put("video_chat_room_url", video_chat_room_url);
		
		
		
		service.updateUrl(params);
		

		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("videoChatStep3/{video_chat_room_code}")
	public ModelAndView videoChatStep3(ModelAndView andView, HttpServletRequest request, Map<String, String> params
										, @PathVariable String video_chat_room_code) throws Exception {
		
		params.put("video_chat_room_code", video_chat_room_code);
		List<ChatListTempVO> videochatInfo = service.getChatStep3(params);
		
		andView.addObject("videochatInfo", videochatInfo);
		andView.setViewName("user/videochat/videochat3");
		return andView;
	}
	
	@RequestMapping("pwfunction")
	public ModelAndView pwfunction(ModelAndView andView, Map<String, String> params, String video_chat_room_code,
							String pwc_code) throws Exception{
		params.put("pwc_code", pwc_code);
		params.put("video_chat_room_code", video_chat_room_code);
		List<ProjectWorkClassVO> pwList = service.getPWList(params);
		
		andView.addObject("pwList", pwList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("pwAdd")
	public ModelAndView pwAdd(ModelAndView andView, Map<String, String> params, String pw_code, HttpSession session,
			String pwc_code, ChatPwVO cpv) throws Exception{
		
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		
		cpv.setEmp_code(emp_code);
		cpv.setPwc_code(pwc_code);
		cpv.setPw_code(pw_code);
		String chat_pw_code= service.insertChatPw(cpv);
		
		params.put("chat_pw_code", chat_pw_code);
		List<ChatPwVO> chatPwList = service.getchatPwLsit();
		
		andView.addObject("chatPwList",chatPwList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	 
	@RequestMapping("getNewpwList")
	public ModelAndView getNewpwList(ModelAndView andView, Map<String, String> params, String pw_code, HttpSession session,
			String pwc_code, ChatPwVO cpv) throws Exception{
		
		
		List<ChatPwVO> chatPwList = service.getchatPwLsit();
		
		andView.addObject("chatPwList",chatPwList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	
}

