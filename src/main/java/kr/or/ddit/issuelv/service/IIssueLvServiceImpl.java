package kr.or.ddit.issuelv.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.issuelv.dao.IIssueLvDao;
import kr.or.ddit.vo.IssueLvVO;

@Service
public class IIssueLvServiceImpl implements IIssueLvService{

	@Autowired
	private IIssueLvDao issueLvDao;
	
	@Override
	public IssueLvVO issueLvInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<IssueLvVO> issueLvList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
