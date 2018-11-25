package kr.or.ddit.issuelv.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.IssueLvVO;

public interface IIssueLvService {
	public IssueLvVO issueLvInfo (Map<String, String> params) throws SQLException;
	public List<IssueLvVO> issueLvList(Map<String, String> params) throws SQLException;
}
