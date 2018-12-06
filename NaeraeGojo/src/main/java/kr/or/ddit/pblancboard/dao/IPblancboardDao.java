package kr.or.ddit.pblancboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.jsoup.select.Elements;

import kr.or.ddit.vo.PblancBoardVO;

public interface IPblancboardDao {
	public PblancBoardVO pblancboardInfo(Map<String,String> params) throws SQLException;
	public List<PblancBoardVO> pblancboardList(Map<String, String> params) throws SQLException;
	public String insertPblancboardInfo(PblancBoardVO pblancboardInfo) throws SQLException;
	public void deletePblancboardInfo(Map<String,String> params) throws SQLException;
	public void updatePblancboardInfo(PblancBoardVO pblancboardInfo) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;
	public String insertPblancInfo(PblancBoardVO pb) throws SQLException;
	public String pblanc_board_comVS(String pblanc_board_com) throws SQLException;
	public void updatePblancInfo(Map<String, String> params) throws SQLException;

}
