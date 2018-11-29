package kr.or.ddit.vo;

import lombok.Data;

@Data
public class VideoChatRoomVO {
	
	// 화상회의방

	private String video_chat_room_code;
	private String video_chat_room_title;
	private String video_chat_room_content;
	private String video_chat_room_url;
	private String video_chat_room_date;
	private String video_chat_room_delete;
	private String emp_code;
	private String project_code;
	private String rnum;
	private String video_chat_join_intime;
	private String video_chat_join_outtime;
	
	
	// 조인때문에 추가한 컬럼
	private String project_name;
	private String emp_name;
	private String video_chat_join_code;
	
	
}
