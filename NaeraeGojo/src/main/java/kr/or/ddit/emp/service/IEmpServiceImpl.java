package kr.or.ddit.emp.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.emp.dao.IEmpDao;
import kr.or.ddit.userfile.dao.IUserFileDao;
import kr.or.ddit.utils.AttachPictureMapper;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.UserFileVO;

@Service
public class IEmpServiceImpl implements IEmpService {

	@Autowired
	private IEmpDao dao;
	
	@Autowired
	private AttachPictureMapper fileMapper;
	
	@Transactional(readOnly=true)
	@Override
	public EmpVO empInfo(Map<String, String> params) throws SQLException {
		return dao.empInfo(params);
	}

//	@Transactional(propagation=Propagation.REQUIRED, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
//	@Override
//	public List<EmpVO> empPhotoList(Map<String, String> params)
//			throws SQLException {
//		return dao.empPhotoList(params);
//	}

	@Transactional(readOnly=true)
	@Override
	public void empInfoW(Map<String, String> params) throws SQLException {
		dao.empInfoW(params);
	}

	@Transactional(propagation=Propagation.REQUIRED, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public List<EmpVO> empList(Map<String, String> params) throws SQLException {
		return dao.empList(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true, rollbackFor={RuntimeException.class, SQLException.class, })
	@Override
	public void insertEmpInfo(EmpVO empInfo) throws SQLException {
		dao.insertEmpInfo(empInfo);
		
		List<UserFileVO> ufv = fileMapper.picture_mapping(empInfo.getFiles(), empInfo.getEmp_code());
		dao.insertUserFile(ufv);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteEmpInfo(Map<String, String> params) throws SQLException {
		dao.deleteEmpInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateEmpInfo(EmpVO empInfo, MultipartFile[] files) throws SQLException {
		dao.updateEmpInfo(empInfo);
		
		List<UserFileVO> ufv = fileMapper.picture_mapping(files, empInfo.getEmp_code());
		dao.updateUserFile(ufv);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateEmpInfo2(EmpVO empInfo, MultipartFile[] files) throws SQLException {
		dao.updateEmpInfo(empInfo);
		
		List<UserFileVO> ufv = fileMapper.picture_mapping(files, empInfo.getEmp_code());
		dao.insertUserFile(ufv);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public EmpVO empNum(Map<String, String> params) throws SQLException {
		return dao.empNum(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public EmpVO empPass(Map<String, String> params) throws SQLException {
		return dao.empPass(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void insertUserFile(List<UserFileVO> ufv) throws SQLException {
		try{
			dao.insertUserFile(ufv);
		}catch (Exception e){
			e.printStackTrace();
		}
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public UserFileVO userFileInfo(Map<String, String> params) throws SQLException {
		return dao.userFileInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateUserFile(List<UserFileVO> ufv) throws SQLException {
		dao.updateUserFile(ufv);
	}

}
