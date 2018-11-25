package kr.or.ddit.inqryboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.InqryBoardVO;

public interface IInqryboardService {
	public InqryBoardVO inqryBoardInfo(Map<String,String> params) throws SQLException;
	public List<InqryBoardVO> inqryBoardList(Map<String, String> params) throws SQLException;
	public void insertInqryBoardInfo(InqryBoardVO inqryBoardInfo) throws SQLException;
	public void deleteInqryBoardInfo(Map<String,String> params) throws SQLException;
	public void updateInqryBoardInfo(InqryBoardVO inqryBoardInfo) throws SQLException;
}
