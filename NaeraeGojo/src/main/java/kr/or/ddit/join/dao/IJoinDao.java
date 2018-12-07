package kr.or.ddit.join.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.JoinVO;
import kr.or.ddit.vo.MpJoinVO;
import kr.or.ddit.vo.MpVO;
import kr.or.ddit.vo.ReportVO;
import kr.or.ddit.vo.RqppsVO;


public interface IJoinDao {
	public JoinVO joinInfo(Map<String,String> params) throws SQLException;
	public List<JoinVO> joinList(Map<String, String> params) throws SQLException;
	public void insertJoinInfo(Map<String, String> params) throws SQLException;
	public void deleteJoinInfo(Map<String,String> params) throws SQLException;
	public void updateJoinInfo(JoinVO joinInfo) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;
	public List<RqppsVO> rqppsNm() throws SQLException;
	public MpJoinVO mpList(Map<String, String> params) throws SQLException;
	public List<EmpVO> empList1(Map<String, String> params) throws SQLException;
	public List<JoinVO> joinFinalList() throws SQLException;
	public List<JoinVO> clickList(Map<String, String> params) throws SQLException;
	public void updateRole(JoinVO jvo) throws SQLException;
	public List<JoinVO> addList(Map<String, String> params) throws SQLException;
	public String insertAdd(JoinVO jvo) throws SQLException;
}
