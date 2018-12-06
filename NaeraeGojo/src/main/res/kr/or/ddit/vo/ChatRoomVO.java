package kr.or.ddit.vo;


import java.util.List;

import lombok.Data;

@Data
public class ChatRoomVO {
	
	private String chatroom_code;
	private String chatroom_writer;
	private String chatroom_reg_date;
	private String chatroom_open;
	
	private List<String> chatroom_jl;
	
}
