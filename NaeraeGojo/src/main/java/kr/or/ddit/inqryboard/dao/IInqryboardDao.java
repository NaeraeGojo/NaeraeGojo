package kr.or.ddit.inqryboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.InqryBoardVO;

public interface IInqryboardDao {
	public InqryBoardVO inqryBoardInfo(Map<String,String> params) throws SQLException;
	public List<InqryBoardVO> inqryBoardList(Map<String, String> params) throws SQLException;
	public String insertInqryInfo(InqryBoardVO inqryBoardInfo) throws SQLException;
	public void deleteInqryInfo(Map<String,String> params) throws SQLException;
	public void updateInqryInfo(InqryBoardVO inqryBoardInfo) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;
	
}
