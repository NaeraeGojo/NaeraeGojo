package kr.or.ddit.rqpps.controller.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.mp.service.IMpService;
import kr.or.ddit.rqpps.service.IRqppsService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.SetContent;
import kr.or.ddit.vo.FreeBoardVO;
import kr.or.ddit.vo.MpVO;
import kr.or.ddit.vo.RqppsVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/rfp/")
public class RqppsController {
	@Autowired
	private IRqppsService service;
	
	@Autowired
	private IMpService mpservice;

	@RequestMapping("rfpForm")
	public void RqppsForm(){}
	
	@RequestMapping("rfpList")
	public Model RqppsList(Model model, Map<String, String> params 
								, HttpServletRequest request
								, HttpSession session
								, String currentPage) throws Exception{
		SetContent.setPath(request);
		
		currentPage = SetContent.getPage(request);
		
		params = SetContent.getParams(request);
		
		if(currentPage == null){
			currentPage = "1";
		}
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil paging = new RolePagingUtil(Integer.parseInt(currentPage), totalCount, request,6);
		
		params = SetContent.setParams(params, paging);
		
		List<RqppsVO> rl = service.getRqppsList(params);
		
		for(RqppsVO rv : rl){
			String end_date = rv.getRqpps_end_date().substring(0,10);
			String rqpps_date = rv.getRqpps_date().substring(0,10);
			rv.setRqpps_end_date(end_date);
			rv.setRqpps_date(rqpps_date);
		}
		
		model.addAttribute("rl",rl);
		model.addAttribute("page", paging.getPagingHtmls());
		
		
		
		return model;
	}
	
	@RequestMapping("rfpView")
	public Model RqppsView(String rqpps_code,Model model
			, Map<String, String> params) throws Exception{
		params.put("rqpps_code", rqpps_code);
		RqppsVO rv = service.getRqpps(params);
		
		String end_date = rv.getRqpps_end_date().substring(0,10);
		String rqpps_date = rv.getRqpps_date().substring(0,10);
		rv.setRqpps_end_date(end_date);
		rv.setRqpps_date(rqpps_date);
		
		params.put("mp_code", rv.getMp_code());
		
		MpVO mv = mpservice.mpInfo(params);
		
		
		model.addAttribute("rv", rv);
		model.addAttribute("mv", mv);
		
		return model;
	}
	
	
	@RequestMapping("rfpInsert")
	public String insertRqpps(RqppsVO rqv
									, @RequestParam("files") MultipartFile[] files) throws Exception{
		service.insertRqpps(rqv, files);
		
		
		// 여기에 pm 인서트가 들어가면 될것같아여
		
		return "redirect:/user/rfp/rfpList.do";
	}
	
	@RequestMapping("rfpDelete")
	public String deleteRqpps(String rqpps_code , Map<String, String> params) throws Exception{
		params.put("rqpps_code", rqpps_code);
		service.deleteRqpps(params);
		
		return "redirect:/user/rfp/rfpList.do";
	}
	
	@RequestMapping("rfpUpdate")
	public String updateRqpps(RqppsVO rqv) throws Exception{
		service.updateRqpps(rqv);
		
		
		return "redirect:/user/rfp/rfpList.do";
	}
	
	@RequestMapping("getMyRfp")
	public ModelAndView getMyRfp(ModelAndView mav, String rqpps_code
			, RqppsVO rv , MpVO mv
			, Map<String, String> params) throws SQLException{
		params.put("rqpps_code", rqpps_code);
		rv = service.getRqpps(params);
		
		String end_date = rv.getRqpps_end_date().substring(0,10);
		String rqpps_date = rv.getRqpps_date().substring(0,10);
		rv.setRqpps_end_date(end_date);
		rv.setRqpps_date(rqpps_date);
		
		mav.addObject("rv",rv);
		
		params.clear();
		params.put("mp_code", rv.getMp_code());
		
		mv = mpservice.mpInfo(params);
		
		mav.addObject("mv",mv);
		
		mav.setViewName("jsonConvertView");
		
		return mav;
	}
	
	
	
}


