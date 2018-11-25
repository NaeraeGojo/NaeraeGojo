package kr.or.ddit.publicinstitution.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PublicInstitutionVO;

public interface IPublicInstitutionDao {
	public void insertPublicInstitution(Map<String, String> params) throws SQLException;
	
	public void updatePublicInstitution(PublicInstitutionVO piv) throws SQLException;
	
	public void deletePublicInstitution(Map<String, String> params) throws SQLException;
	
	public List<PublicInstitutionVO> getPublicInstitutionList(Map<String, String> params) throws SQLException;
	
	public PublicInstitutionVO getPublicInstitution(Map<String, String> params) throws SQLException;
	
}
