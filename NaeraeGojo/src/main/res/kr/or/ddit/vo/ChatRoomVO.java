package kr.or.ddit.vo;



import lombok.Data;

@Data
public class ChatRoomVO {
	
	private String chatroom_code;
	private String chatroom_writer;
	private String chatroom_reg_date;
	private String chatroom_open;

	// 개설자 이름
	private String chatroom_writer_name;
	
	// 참여자 목록(현재 참여중)
	private String chatroom_jl;
	
}
