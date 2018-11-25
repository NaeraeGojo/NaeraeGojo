package kr.or.ddit.computationoutdoc.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ComputationOutDocVO;

public interface IComputationOutDocDao {
	public ComputationOutDocVO computationOutDocInfo(Map<String,String> params) throws SQLException;
	public List<ComputationOutDocVO> computationOutDocList(Map<String, String> params) throws SQLException;
	public void insertComputationOutDocInfo(ComputationOutDocVO computationOutDocInfo) throws SQLException;
	public void deleteComputationOutDocInfo(Map<String,String> params) throws SQLException;
	public void updateComputationOutDocInfo(ComputationOutDocVO computationOutDocInfo) throws SQLException;
}
