package kr.or.ddit.videoFile.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.utils.AttachFileMapper2;
import kr.or.ddit.videoFile.dao.IVideoFileDao;
import kr.or.ddit.videochatroom.dao.IVideoChatDao;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MeetFileVO;
import kr.or.ddit.vo.ProjectVO;
import kr.or.ddit.vo.VideoChatRoomVO;
import kr.or.ddit.vo.ChatListTempVO;
import kr.or.ddit.vo.VideoFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IVideoFileServiceImpl implements IVideoFileService{
	@Autowired
	private IVideoFileDao dao;
	
	@Autowired
	private AttachFileMapper2 fileMapper;

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertChatFile(String video_chat_room_code, MultipartFile files)
			throws SQLException {
		
		VideoFileVO mfile = fileMapper.mapping2(files, video_chat_room_code);
		dao.insertChatFile(mfile);
	}

	@Override
	public VideoFileVO getVideoFile(Map<String, String> params)
			throws SQLException {
		return dao.getVideoFile(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateMeetingFile(MultipartFile files,
			String video_chat_room_code) throws SQLException {
		VideoFileVO vhfile = fileMapper.mapping2(files, video_chat_room_code);
		
		String filesCode = dao.getfileCode(video_chat_room_code);
		vhfile.setVideo_file_code(filesCode);
		dao.updateVideoChatFile(vhfile);
		
	}

}
