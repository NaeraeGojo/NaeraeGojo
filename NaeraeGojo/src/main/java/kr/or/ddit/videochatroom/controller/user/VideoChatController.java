package kr.or.ddit.videochatroom.controller.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.videochatroom.service.IVideoChatService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.ProjectVO;
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
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(Integer.parseInt(currentPage), totalCount, request);
		
		params.put("startCount", String.valueOf(paging.getStartCount()));
		params.put("endCount", String.valueOf(paging.getEndCount()));
		
		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();		
		System.out.println("아디아디아디아디"+emp_code);
		params.put("emp_code", emp_code);
		
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
	public String updateVideoChat(VideoChatRoomVO vcv ,HttpServletRequest request) throws Exception{
			
		service.updateVideoChat(vcv);
		return "redirect:/user/video/chatList.do";
	}
	
	
	public String insertVideoChat(VideoChatRoomVO vcv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
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
	
	
}

