package kr.or.ddit.computation.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ComputationVO;

public interface IComputationService {
	public ComputationVO computationInfo(Map<String,String> params) throws SQLException;
	public List<ComputationVO> computationList(Map<String, String> params) throws SQLException;
	public void insertComputationInfo(ComputationVO computationInfo) throws SQLException;
	public void deleteComputationInfo(Map<String,String> params) throws SQLException;
	public void updateComputationInfo(ComputationVO computationInfo) throws SQLException;
}
