package kr.or.ddit.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import kr.or.ddit.vo.EmpVO;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

// P2P 간 이벤트 드리븐 방식의 접근 후  중계자
// ws://192.168.204.47/ng/wschat 
@ServerEndpoint("/wschat")
public class WebSocketEPChattingClazz {
	// Peer 맵
	private static ArrayList<Session> sessionList = new ArrayList<Session>();
	private HttpSession httpSession;
	
	private static ArrayList<Map<Session, String>> seList = new ArrayList<Map<Session,String>>();
	
	private static Map<String, List<Session>> seMap = new HashMap<String, List<Session>>();
	
	// Peer가 웹소켓 앤드포인트 정상 접근이 완료 콜ㅐㅂㄱ
	@OnOpen
	public void onOpen(Session webSocketSession){
		httpSession = ((PrincipalWithSession)webSocketSession.getUserPrincipal()).getSession();
		
		String emp_code = ((EmpVO)httpSession.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		String chatroom_code = (String) httpSession.getAttribute("chatroom_code");
		
		// 해당 채팅방코드로 생성된 맵이 있는경우(만들어진 방에입장)
		if(seMap.containsKey(chatroom_code)){
			seMap.get(chatroom_code).add(webSocketSession);
		}else{
			//해당 방에서의 첫번째 메시지(방장)
			List<Session> sl = new ArrayList<Session>();
			sl.add(webSocketSession);
			seMap.put(chatroom_code, sl);
			
		}
		
		
//		sessionList.add(webSocketSession);
		
		try {
			webSocketSession.getBasicRemote().sendText("WebSocket EndPoint에 접속 되었습니다.");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@OnClose
	public void onClose(Session webSocketSession){
		httpSession = ((PrincipalWithSession)webSocketSession.getUserPrincipal()).getSession();
		
//		sessionList.remove(webSocketSession);
		String chatroom_code = (String) httpSession.getAttribute("chatroom_code");
		seMap.get(chatroom_code).remove(webSocketSession);
		
	}
	
	@OnMessage
	public void onMessage(String msg){
		JSONObject job;
		String chatroom_code = null;
		try {
			job = new JSONObject(msg);
			chatroom_code = job.getString("chatroom_code");
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		// 브로드 캐스팅: 전체 Peer를 대상으로 통신
		// 멀티캐스팅 : 선택된 다수의 Peer를 대상으로 통신
		// 유니캐스팅 : 선택된 Peer를 대생으로 통신
		for(Session webSocketSession : seMap.get(chatroom_code)){
			Basic peerBasic =  webSocketSession.getBasicRemote();
			
			// HttpSession ID : HttpSession.getId();
			// javax.websocket.SessionID : Session.getID();
			System.out.println("WebSocketSession ID : " + webSocketSession.getId());
			try {
				peerBasic.sendText(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@OnError
	public void onError(Throwable exception){
		System.out.println("WSChat 에러 : " + exception.toString());
	}
}
