package kr.or.ddit.meeting.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.meeting.dao.IMeetingDao;
import kr.or.ddit.meetingFile.dao.IMeetingFileDao;
import kr.or.ddit.utils.AttachFileMapper2;
import kr.or.ddit.vo.MeetFileVO;
import kr.or.ddit.vo.MeetingVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.TempMeetingVO;
import oracle.net.aso.d;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IMeetingServiceImpl implements IMeetingService{

	@Autowired
	private IMeetingDao dao;
	
	@Autowired
	private IMeetingFileDao fileDao;
	
	@Autowired
	private AttachFileMapper2 fileMapper;
	
	@Override
	public List<TempMeetingVO> meetingInfo(Map<String, String> params)
			throws SQLException {
		return dao.meetingInfo(params);
	}

	@Override
	public List<TempMeetingVO> meetingList(Map<String, String> params)
			throws SQLException {
		return dao.meetingList(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW , rollbackFor={Exception.class})
	@Override
	public String insertMeetingInfo(MeetingVO mv, MultipartFile files)
			throws SQLException {
		
		String meeting_code = dao.insertMeetingInfo(mv);
		
		if (files != null) {
			
			MeetFileVO mfile = fileMapper.mapping(files, meeting_code);
			
			fileDao.insertMeetingFile(mfile);
		}
		
		return meeting_code;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteMeetingInfo(Map<String, String> params)
			throws SQLException {
		dao.deleteMeetingInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateMeetingInfo(MeetingVO mv)
			throws SQLException {
		
		dao.updateMeetingInfo(mv);
		
//		if (files != null) {
//			
//			String meeting_code = mv.getMeeting_code();
//			

//		}
	}

	
	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return dao.totalCount(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateHit(Map<String, String> params) throws SQLException {
		dao.updateHit(params);
	}

	@Override
	public List<ProjectVO> getProjectNM() throws SQLException {
		return dao.getProjectNM();
	}

	@Override
	public List<TempMeetingVO> getProjectModal(Map<String, String> params)
			throws SQLException {
		return dao.getProjectModal(params);
	}

	@Override
	public String getProjectname(Map<String, String> params)
			throws SQLException {
		return dao.getProjectname(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertmeetPw(Map<String, String> params) throws SQLException{
		dao.insertmeetPw(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteMeetPw(Map<String, String> params) throws SQLException {
		dao.deleteMeetPw(params);
	}
	
	

}
