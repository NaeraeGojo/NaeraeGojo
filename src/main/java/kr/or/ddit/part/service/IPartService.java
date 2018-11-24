package kr.or.ddit.part.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PartVO;

public interface IPartService {
	public PartVO partInfo(Map<String,String> params) throws SQLException;
	public List<PartVO> partList() throws SQLException;
//	public void insertPartInfo(PartVO partInfo) throws SQLException;
//	public void deletePartInfo(Map<String,String> params) throws SQLException;
//	public void updatePartInfo(PartVO partInfo) throws SQLException;
	
}
