package kr.or.ddit.meetingFile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.MeetFileVO;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.TempMeetingVO;

public interface IMeetingFileService {
	

	public MeetFileVO getMeetingFile(Map<String, String> params) throws SQLException;

	public void updateMeetingFile(MultipartFile files, String meeting_code) throws SQLException;

	public void insertMeetingFile(MultipartFile files, String meeting_code) throws SQLException;

	
	public String getfileCode(String meeting_code) throws SQLException;
}
