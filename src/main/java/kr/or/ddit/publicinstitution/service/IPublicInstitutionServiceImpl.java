package kr.or.ddit.publicinstitution.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.publicinstitution.dao.IPublicInstitutionDao;
import kr.or.ddit.vo.PublicInstitutionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IPublicInstitutionServiceImpl implements IPublicInstitutionService{
	@Autowired
	private IPublicInstitutionDao dao;

	@Override
	public void insertPublicInstitution(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePublicInstitution(PublicInstitutionVO piv)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePublicInstitution(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PublicInstitutionVO> getPublicInstitutionList(
			Map<String, String> params) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PublicInstitutionVO getPublicInstitution(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
