package kr.or.ddit.qnaboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.QnABoardVO;

public interface IQnAboardService {
	public void insertQnAboard(Map<String, String> params) throws SQLException;
	
	public void updateQnAboard(QnABoardVO qv) throws SQLException;
	
	public void deleteQnAboard(Map<String, String> params) throws SQLException;
	
	public List<QnABoardVO> getQnAboardList(Map<String, String> params) throws SQLException;
	
	public QnABoardVO getQnAboard(Map<String, String> params) throws SQLException;

}
