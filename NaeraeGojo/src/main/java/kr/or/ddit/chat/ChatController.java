package kr.or.ddit.chat;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.chat.service.IChatJoinService;
import kr.or.ddit.chat.service.IChatRoomService;
import kr.or.ddit.vo.ChatJoinVO;
import kr.or.ddit.vo.ChatRoomVO;
import kr.or.ddit.vo.EmpVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/chat/")
public class ChatController {
	@Autowired
	private IChatRoomService crservice;
	
	@Autowired
	private IChatJoinService cjservice;
	
	
	@RequestMapping("chatRoom")
	public Model chatRoom(Model model
							, String chatroom_code
							, Map<String, String> params
							, HttpSession session) throws Exception{
		String emp_code = ((EmpVO)session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		session.setAttribute("chatroom_code", chatroom_code);
		
		// 여기서 초대자 목록 가져감
		params.put("chatjoin_chatroom", chatroom_code);
		
		String ivl = cjservice.invList(params);
		model.addAttribute("ivl",ivl);
		
		return model;
	}
	
	@RequestMapping("lastNum")
	public ModelAndView lastNum(ModelAndView mav
								, Map<String, String> params
								, String chatjoin_emp)throws Exception{
		
		params.put("chatjoin_emp", chatjoin_emp);
		String lastNum = cjservice.lastNum(params);
		
		if(lastNum==null){
			lastNum = "";
		}
		
		// 삭제되지 않았고, 내가 참여하고있지 않은 chatjoin의 마지막 코드번호를 가지고온다.
		mav.addObject("lastNum",lastNum);
		mav.setViewName("jsonConvertView");
		return mav;
	}
	
	@RequestMapping("partList")
	public ModelAndView partList(String chatjoin_chatroom
								, ModelAndView mav
								, Map<String, String> params
								) throws Exception{
		
		params.put("chatjoin_chatroom", chatjoin_chatroom);
		
		// invList 에서 part가 존재할 시에 partList 를뽑아오도록 dynamic 쿼리
		params.put("part", "true");
		
		String cpl = cjservice.invList(params);
		
		mav.addObject("cpl", cpl);
		mav.setViewName("jsonConvertView");
		return mav;
	}
	
	
	@RequestMapping("chatRoomInsert")
	public ModelAndView chatRoomInsert(ModelAndView mav
										, ChatRoomVO crv
										, String[] el
										) throws Exception{
		//여기서 채팅방 개설, 채팅참여 인서트 필요
		// 필요한 정보, 채팅에 참여할 emp_code 들, 개설자의 emp_code
		String chatroom_code = crservice.insertChatRoom(crv);
		
		List<ChatJoinVO> cjl = new ArrayList<ChatJoinVO>();
		
		// 개설자를 먼저 chatjoinVO 로 만든다.
		ChatJoinVO cjv = new ChatJoinVO();
		cjv.setChatjoin_chatroom(chatroom_code);
		cjv.setChatjoin_emp(crv.getChatroom_writer());
		cjv.setChatjoin_join("y");
		
		// chatjoinVO가 담긴 리스트에 개설자를 추가
		cjl.add(cjv);
		
		// 받아온 emp_code 리스트를 반복하면서 chatjoinVO를 만들고 리스트에 추가
		for(String emp_code : el){
			ChatJoinVO cjv2 = new ChatJoinVO();
			cjv2.setChatjoin_chatroom(chatroom_code);
			cjv2.setChatjoin_emp(emp_code);
			
			cjl.add(cjv2);
		}
		
		cjservice.insertChatJoin(cjl);
		
		mav.addObject("chatroom_code",chatroom_code);
		mav.setViewName("jsonConvertView");
		
		return mav;
	}
	
	@RequestMapping("chatList")
	public ModelAndView chatList(ModelAndView mav , String emp_code
									,Map<String, String> params) throws Exception{
		
		params.put("emp_code", emp_code);
		List<ChatRoomVO> crl = crservice.getChatList(params);
		
		mav.addObject("crl", crl);
		mav.setViewName("jsonConvertView");
		return mav;
	}
	
	@RequestMapping("joinRoom")
	public ModelAndView joinRoom(ModelAndView mav
								, ChatJoinVO cjv) throws Exception{
		cjservice.joinRoom(cjv);
		
		mav.setViewName("jsonConvertView");
		return mav;
	}
	
	@RequestMapping("deleteRoom")
	public ModelAndView deleteRoom(ModelAndView mav
									, Map<String, String> params
									, ChatJoinVO cjv) throws Exception{
		cjservice.deleteRoom(cjv);
		
		params.put("chatjoin_chatroom", cjv.getChatjoin_chatroom());
		
		// 여기서 해당 채팅방에 join이 몇인지 확인
		int join_cnt = cjservice.joinCount(params);
		
		if(join_cnt == 0){
			// 해당 채팅방에 참여하고 있는 사람이 0인경우, 해당 채팅방의 open 을 'n'으로 변경
			params.clear();
			params.put("chatroom_code", cjv.getChatjoin_chatroom());
			crservice.closeRoom(params);
		}
		
		mav.setViewName("jsonConvertView");
		return mav;
	}
	
}
