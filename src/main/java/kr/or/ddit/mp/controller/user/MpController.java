package kr.or.ddit.mp.controller.user;

import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.mp.service.IMpService;
import kr.or.ddit.vo.MpVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/mp/")
public class MpController {
	@Resource
	private IMpService service;
	
	public ModelAndView moList(HttpServletRequest request, HttpSession session) throws Exception{
		
		return null;
	}
	
	@RequestMapping("insertMp")
	public ModelAndView insertMp(ModelAndView mav, MpVO mv) throws SQLException{
		
		String mp_code = service.insertMp(mv);
		
		mv.setMp_code(mp_code);
		
		mav.addObject("mp", mv);
		
		mav.setViewName("jsonConvertView");
		
		return mav;
	}

	@RequestMapping("getMp")
	public ModelAndView getMp(Map<String, String> params, ModelAndView mav
								, String mp_code, MpVO mv) throws SQLException{
		
		params.put("mp_code", mp_code);
		
		mv = service.mpInfo(params);
		
		mav.addObject("mp", mv);
		mav.setViewName("jsonConvertView");
		
		return mav;
	}
	
	@RequestMapping("updateMp")
	public ModelAndView updateMp(ModelAndView mav, MpVO mv) throws SQLException{
		
		service.updateMp(mv);
		
		mav.addObject("mp", mv);
		
		mav.setViewName("jsonConvertView");
		
		return mav;
	}
	
	
	
}

