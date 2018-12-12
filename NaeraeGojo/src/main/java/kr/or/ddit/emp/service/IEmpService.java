package kr.or.ddit.emp.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.UserFileVO;

public interface IEmpService {
	public EmpVO empInfo(Map<String,String> params) throws SQLException;
	public void empInfoW(Map<String,String> params) throws SQLException;
	public List<EmpVO> empList(Map<String, String> params) throws SQLException;
	public void insertEmpInfo(EmpVO empInfo) throws SQLException;
	public void deleteEmpInfo(Map<String,String> params) throws SQLException;
	public void updateEmpInfo(EmpVO empInfo, MultipartFile[] files) throws SQLException;
	public EmpVO empNum(Map<String,String> params) throws SQLException;
	public EmpVO empPass(Map<String,String> params) throws SQLException;
	public void insertUserFile(List<UserFileVO> ufv) throws SQLException;
	public UserFileVO userFileInfo(Map<String, String> params) throws SQLException;
	public void updateUserFile(List<UserFileVO> ufv) throws SQLException;
	public void updateEmpInfo2(EmpVO empInfo, MultipartFile[] files) throws SQLException;
	
	public List<EmpVO> empMail(Map<String, String> params) throws SQLException;
}
