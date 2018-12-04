package kr.or.ddit.meetingFile.service;


import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.meeting.dao.IMeetingDao;
import kr.or.ddit.meetingFile.dao.IMeetingFileDao;
import kr.or.ddit.utils.AttachFileMapper2;
import kr.or.ddit.vo.MeetFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IMeetingFileServiceImpl implements IMeetingFileService{

	@Autowired
	private IMeetingFileDao dao;
	
	@Autowired
	private AttachFileMapper2 fileMapper;

	@Override
	public MeetFileVO getMeetingFile(Map<String, String> params)
			throws SQLException {
		return dao.getMeetingFile(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void updateMeetingFile(MultipartFile files, String meeting_code) throws SQLException {
		
		MeetFileVO mfile = fileMapper.mapping(files, meeting_code);
		
		String filesCode = dao.getfileCode(meeting_code);
		mfile.setMeeting_file_code(filesCode);
		dao.updateMeetingFile(mfile);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public void insertMeetingFile(MultipartFile files, String meeting_code)
			throws SQLException {
		MeetFileVO mfile = fileMapper.mapping(files, meeting_code);
		
		String filesCode = dao.getfileCode(meeting_code);
		mfile.setMeeting_file_code(filesCode);
		
		dao.insertMeetingFile(mfile);
	}
	
	

}
