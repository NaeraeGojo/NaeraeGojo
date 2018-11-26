package kr.or.ddit.emp.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.emp.dao.IEmpDao;
import kr.or.ddit.vo.EmpVO;

@Service
public class IEmpServiceImpl implements IEmpService {

	@Autowired
	private IEmpDao dao;
	
	@Transactional(readOnly=true)
	@Override
	public EmpVO empInfo(Map<String, String> params) throws SQLException {
		return dao.empInfo(params);
	}

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
		String emp_code = dao.insertEmpInfo(empInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void deleteEmpInfo(Map<String, String> params) throws SQLException {
		dao.deleteEmpInfo(params);
	}
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateEmpInfo(EmpVO empInfo) throws SQLException {
		dao.updateEmpInfo(empInfo);
		
	}


//    @Override
//    public int totalCount(Map<String, String> params) {
//        int totalCount = 0;
//        try {
//            totalCount = dao.totalCount(params);
//        }catch (SQLException e){
//            e.printStackTrace();
//        }
//        return totalCount;
//    }

//	@Override
//	public String findEmpId(Map<String, String> params) throws SQLException {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
