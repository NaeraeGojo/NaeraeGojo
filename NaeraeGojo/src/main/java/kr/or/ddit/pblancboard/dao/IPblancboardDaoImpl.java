package kr.or.ddit.pblancboard.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jsoup.select.Elements;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.PblancBoardVO;

@Repository
public class IPblancboardDaoImpl implements IPblancboardDao {

	@Resource
	private SqlMapClient client;
	
	@Override
	public PblancBoardVO pblancboardInfo(Map<String, String> params) throws SQLException {
		client.update("pblancboard.updateHIT", params);
		return (PblancBoardVO) client.queryForObject("pblancboard.pblancboardInfo", params);
	}

	@Override
	public List<PblancBoardVO> pblancboardList(Map<String, String> params) throws SQLException {
		return client.queryForList("pblancboard.pblancboardList", params);
	}

	@Override
	public String insertPblancboardInfo(PblancBoardVO pblancboardInfo) throws SQLException {
		return 	(String) client.insert("pblancboard.insertPblancboard", pblancboardInfo);
	}

	@Override
	public void deletePblancboardInfo(Map<String, String> params) throws SQLException {
		client.update("pblancboard.deletePblancboard", params);
	}

	@Override
	public void updatePblancboardInfo(PblancBoardVO pblancboardInfo) throws SQLException {
		client.update("pblancboard.updatePblancboard", pblancboardInfo);
	}

	@Override
	public int totalCount(Map<String, String> params) throws SQLException {
		return (int) client.queryForObject("pblancboard.totalCount", params);
	}

	@Override
	public String insertPblancInfo(PblancBoardVO pb)
			throws SQLException {
		return (String) client.insert("pblancboard.insertPblancInfo", pb);
	}

	@Override
	public String pblanc_board_comVS(String pblanc_board_com)
			throws SQLException {
		return (String) client.queryForObject("pblancboard.pblanc_board_comVS", pblanc_board_com);
	}

	@Override
	public void updatePblancInfo(Map<String, String> params)
			throws SQLException {
		client.update("pblancboard.updatePblancInfo", params);
	} 

}
