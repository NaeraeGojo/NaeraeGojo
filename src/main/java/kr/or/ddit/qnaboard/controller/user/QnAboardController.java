package kr.or.ddit.qnaboard.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.qnaboard.service.IQnAboardService;
import kr.or.ddit.vo.QnABoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class QnAboardController {
	@Autowired
	private IQnAboardService service;

	
	public void QnAboardForm(){}
	
	
	public Model QnAboardList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		
		return model;
	}
	
	
	public Model QnAboardView(String bo_no,Model model) throws Exception{
		
		return model;
	}
	
	
	public String insertQnAboard(QnABoardVO qbv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		return "";
	}
	
	
	public String deleteQnAboard(String bo_no) throws Exception{
		
		return "";
	}
	
	
	public String updateQnAboard(QnABoardVO qbv ,HttpServletRequest request) throws Exception{
		
		return "";
	}
}

