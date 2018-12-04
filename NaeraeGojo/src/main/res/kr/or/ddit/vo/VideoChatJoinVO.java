package kr.or.ddit.vo;

import lombok.Data;

@Data
public class VideoChatJoinVO {

	//개인 화상회의 기록
	private String video_chat_join_code;
	private String video_chat_join_intime;
	private String video_chat_join_outtime;
	private String video_chat_join_delete;
	private String emp_code;
	private String video_chat_room_code;
	private String video_chat_join_sign;
	
	
	
}
