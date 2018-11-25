package kr.or.ddit.utils;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;



@ServerEndpoint("/wscam")
public class WebSocketEPCamClazz {

	private static ArrayList<Session> sessionList = new ArrayList<Session>();
	
	@OnOpen
	public void onOpen(Session websocketSession){
		System.out.println("WebCam을 통한 WebSocket EndPoint에 접속 되었습니다");
	}
	@OnMessage(maxMessageSize=52422880)
	public void onMessage(Session websocketSession, byte[] imgBytes){
		System.out.println("서버 buffer size : " + imgBytes.length);
		
		ByteBuffer buffer = ByteBuffer.wrap(imgBytes);
		
		if(websocketSession.isOpen()){
			Basic peerBasic = websocketSession.getBasicRemote();
			try {
				peerBasic.sendBinary(buffer);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	@OnClose
	public void onClose(Session websocketSession){
		System.out.println("WebSocket EndPoint와 접속이 종료됩니다.");
		try {
			websocketSession.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@OnError
	public void onError(Session websocketSession,Throwable exception){
		System.out.println("WSChat 에러 : " + exception.toString());
	}
}
