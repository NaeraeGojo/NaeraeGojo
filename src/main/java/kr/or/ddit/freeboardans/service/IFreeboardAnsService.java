package kr.or.ddit.freeboardans.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeBoardAnsVO;

public interface IFreeboardAnsService{
	public FreeBoardAnsVO freeboardAnsInfo(Map<String,String> params) throws SQLException;
	public List<FreeBoardAnsVO> freeboardAnsList(Map<String, String> params) throws SQLException;
	public void insertFreeboardAnsInfo(FreeBoardAnsVO freeboardAnsInfo) throws SQLException;
	public void deleteFreeboardAnsInfo(Map<String,String> params) throws SQLException;
	public void updateFreeboardAnsInfo(FreeBoardAnsVO freeboardAnsInfo) throws SQLException;
}
