package kr.or.ddit.allfile.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.SuggestFileVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IAllFileDaoImpl implements IAllFileDao{
	@Autowired
	private SqlMapClient client;

	@Override
	public void insertAllFile(AllFileVO afv) throws SQLException {
		client.insert("allFile.insertAllFile",afv);
		
	}

	@Override
	public void updateAllFile(AllFileVO afv) throws SQLException {
		client.update("allFile.updateAllFile",afv);
		
	}

	@Override
	public void deleteAllFile(Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<AllFileVO> getAllFileList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AllFileVO getAllFile(Map<String, String> params) throws SQLException {
		return (AllFileVO) client.queryForObject("allFile.getAllFile", params);
	}

	

}
