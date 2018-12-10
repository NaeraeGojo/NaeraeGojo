package kr.or.ddit.freeboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.FreeBoardAnsVO;
import kr.or.ddit.vo.FreeBoardVO;

public interface IFreeboardService {
	public FreeBoardVO freeboardInfo(Map<String,String> params) throws SQLException;
	public List<FreeBoardVO> freeboardList(Map<String, String> params) throws SQLException;
	public void insertFreeboardInfo(FreeBoardVO freeboardInfo, MultipartFile[] files) throws SQLException;
	public void deleteFreeboardInfo(Map<String,String> params) throws SQLException;
	public void updateFreeboardInfo(FreeBoardVO freeboardInfo, MultipartFile[] files) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;
	
	public List<FreeBoardAnsVO> replyFreeList(Map<String, String> params) throws  Exception;
	public void insertReply(FreeBoardAnsVO fri) throws Exception;
	public void deleteReply(Map<String,String>params) throws Exception;
	public void updateReply(FreeBoardAnsVO fri) throws Exception;
	public FreeBoardAnsVO freeReplyInfo(Map<String, String> params) throws Exception;

}
