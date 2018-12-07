package kr.or.ddit.inqryboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.InqryBoardVO;

public interface IInqryboardService {
	public InqryBoardVO inqryBoardInfo(Map<String,String> params) throws SQLException;
	public List<InqryBoardVO> inqryBoardList(Map<String, String> params) throws SQLException;
	public void insertInqryInfo(InqryBoardVO inqryBoardInfo,  MultipartFile[] files) throws SQLException;
	public void deleteInqryInfo(Map<String,String> params) throws SQLException;
	public void updateInqryInfo(InqryBoardVO inqryBoardInfo, MultipartFile[] files) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;
	
}
