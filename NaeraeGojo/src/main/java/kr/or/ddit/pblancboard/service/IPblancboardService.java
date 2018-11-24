package kr.or.ddit.pblancboard.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.PblancBoardVO;

public interface IPblancboardService {
	public PblancBoardVO pblancboardInfo(Map<String,String> params) throws SQLException;
	public List<PblancBoardVO> pblancboardList(Map<String, String> params) throws SQLException;
	public void insertPblancboardInfo(PblancBoardVO pblancboardInfo, MultipartFile[] files) throws SQLException;
	public void deletePblancboardInfo(Map<String,String> params) throws SQLException;
	public void updatePblancboardInfo(PblancBoardVO pblancboardInfo) throws SQLException;
	public int totalCount(Map<String, String> params) throws SQLException;

}
