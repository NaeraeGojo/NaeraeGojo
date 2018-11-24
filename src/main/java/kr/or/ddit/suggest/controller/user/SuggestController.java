package kr.or.ddit.suggest.controller.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.mp.service.IMpService;
import kr.or.ddit.rqpps.service.IRqppsService;
import kr.or.ddit.suggest.service.ISuggestService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.utils.SetContent;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MpVO;
import kr.or.ddit.vo.RqppsVO;
import kr.or.ddit.vo.SuggestVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/user/suggest/")
public class SuggestController {
	@Autowired
	private ISuggestService service;
	
	@Autowired
	private IRqppsService rfpService;
	
	@Autowired
	private IMpService mpservice;

	@RequestMapping("suggestForm")
	public Model SuggestForm(HttpSession session
			, Map<String, String>params, Model model) throws SQLException{
		//내가 작성한 제안요청서를 상태별(1:요청서,2:인력,3:제안서,4:프로젝트)로 조회
		EmpVO ev = (EmpVO) session.getAttribute("LOGIN_EMPINFO");
		params.put("emp_code", ev.getEmp_code());
		params.put("rqpps_now_condition", "2");
		
		List<RqppsVO> rl = rfpService.getMyRfp(params);
		
		model.addAttribute("rl",rl);
		
		return model;
	}
	
	@RequestMapping("suggestList")
	public Model SuggestList(Model model, Map<String, String> params 
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
		
		List<SuggestVO> sl = service.getSuggestList(params);
		
		
		// 데이터 제대로 들어가면 try,catch 지워야함( 날짜 자르는 부분)
		for(SuggestVO sv : sl){
			
			try{
				String start_date = sv.getSuggest_start_date().substring(0,10);
				sv.setSuggest_start_date(start_date);
			}catch(Exception e){
				e.printStackTrace();
			}
			
			try{
				String end_date = sv.getSuggest_end_date().substring(0,10);
				sv.setSuggest_end_date(end_date);
			}catch(Exception e){
				e.printStackTrace();
			}
			
			try{
				String reg_date = sv.getSuggest_reg_date().substring(0,10);
				sv.setSuggest_reg_date(reg_date);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		model.addAttribute("sl",sl);
		model.addAttribute("page", paging.getPagingHtmls());
		return model;
	}
	
	@RequestMapping("suggestView")
	public Model SuggestView(String suggest_code,Model model 
								,Map<String, String> params) throws Exception{
		
		params.put("suggest_code", suggest_code);
		SuggestVO sv = service.getSuggest(params);
		
		String start_date = sv.getSuggest_start_date().substring(0,10);
		String end_date = sv.getSuggest_end_date().substring(0,10);
		String reg_date = sv.getSuggest_reg_date().substring(0,10);
		
		sv.setSuggest_start_date(start_date);
		sv.setSuggest_end_date(end_date);
		sv.setSuggest_reg_date(reg_date);
		model.addAttribute("sv", sv);
		
		params.put("rqpps_code", sv.getRqpps_code());
		RqppsVO rv = rfpService.getRqpps(params);
		model.addAttribute("rv",rv);
		
		params.put("mp_code", rv.getMp_code());
		MpVO mv = mpservice.mpInfo(params);
		model.addAttribute("mv", mv);
		
		return model;
	}
	
	@RequestMapping("suggestInsert")
	public String insertSuggest(SuggestVO sv
									, @RequestParam("files") MultipartFile[] files
									, Map<String, String> params) throws Exception{
		service.insertSuggest(sv, files);
		
		params.put("rqpps_code", sv.getRqpps_code());
		params.put("rqpps_now_condition", "3");
		rfpService.updateRfpCondition(params);
		
		
		return "redirect:/user/suggest/suggestList.do";
	}
	
	@RequestMapping("suggestDelete")
	public String deleteSuggest(String suggest_code, Map<String, String> params) throws Exception{
		//delete 하면 rqpps 상태 바꾸기
		params.put("suggest_code", suggest_code);
		service.deleteSuggest(params);
		
		params.put("rqpps_code", suggest_code);
		params.put("rqpps_now_condition", "2");
		rfpService.updateRfpCondition(params);
		
		return "redirect:/user/suggest/suggestList.do";
	}
	
	@RequestMapping("suggestUpdate")
	public String updateSuggest(SuggestVO sv ,HttpServletRequest request) throws Exception{
		service.updateSuggest(sv);
		
		return "redirect:/user/suggest/suggestList.do";
	}
}

