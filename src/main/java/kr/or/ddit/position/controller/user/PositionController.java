package kr.or.ddit.position.controller.user;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.position.service.IPositionService;
import kr.or.ddit.vo.PositionVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/position/")
public class PositionController {
	
	
	public ModelAndView positionList(HttpServletRequest request, HttpSession session) throws Exception{
		return null;
	}
	
	
	public ModelAndView updatePosition(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertPosition() throws Exception{
		
		return null;
	}
	
	
	public String deletePosition() throws Exception{
		
		return null;
	}
}

