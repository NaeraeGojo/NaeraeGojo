package kr.or.ddit.pblancboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PblancBoardVO;

public interface IPblancboardDao {
	public PblancBoardVO pblancboardInfo(Map<String,String> params) throws SQLException;
	public List<PblancBoardVO> pblancboardList(Map<String, String> params) throws SQLException;
	public String insertPblancboardInfo(PblancBoardVO pblancboardInfo) throws SQLException;
	public void deletePblancboardInfo(Map<String,String> params) throws SQLException;
	public void updatePblancboardInfo(PblancBoardVO pblancboardInfo) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;

}
