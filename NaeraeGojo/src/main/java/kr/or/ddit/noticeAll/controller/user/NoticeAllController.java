package kr.or.ddit.noticeAll.controller.user;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import kr.or.ddit.noticeAll.service.INoticeAllService;
import kr.or.ddit.noticeboard.service.INoticeboardService;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.NotEmpVO;
import kr.or.ddit.vo.NoticeAllVO;
import kr.or.ddit.vo.RqppsVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/noticeAll/")
public class NoticeAllController {
	@Resource
	private INoticeAllService service;
	
	
	@RequestMapping("notice_allList")
	public ModelAndView NoticeAllList(HttpServletRequest request,
									ModelAndView andView,
									HttpSession session,
									String search_keyword,
									String search_keycode,
									String currentPage
									,String emp_code) throws Exception{
		if(currentPage==null){
			currentPage = "1";
		}
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();		
		System.out.println("아디아디아디아디"+emp_code);
		params.put("emp_code", emp_code);
		
		if(params != null){
			String message = (String) params.get("message");
			System.out.println("RedirectAttribute post 전송 파람 : " + message);
		}
		
		
		int totalCount = service.totalCount(params);
		RolePagingUtil paginUtil = new RolePagingUtil(Integer.parseInt(currentPage),totalCount,request);
		params.put("startCount",  String.valueOf(paginUtil.getStartCount()));
		params.put("endCount", String.valueOf(paginUtil.getEndCount()));
		List<NotEmpVO> noticeAllList = service.noticeAllList(params);
		andView.addObject("noticeAllList",noticeAllList);
		andView.addObject("pagingHtmls",paginUtil.getPagingHtmls());
		andView.setViewName("user/noticeAll/notice_allList");
		return andView;
	}
	
	@RequestMapping("notice_allView/{notice_all_code}")
	public ModelAndView notice_allView(
			HttpServletRequest request,
			ModelAndView andView,
			NotEmpVO vo,
			@PathVariable String notice_all_code, Map<String, String> params
			)throws Exception{
//		vo = service.getBBSInfo(params); 
//		//vo.setRnum(rnum);
//		service.updateHit(params);
//		andView.addAttribute("vo",vo);
		params.put("notice_all_code", notice_all_code);
		
		vo = service.noticeAllInfo(params);
		service.updateHit(params);
		andView.addObject("vo",vo);
		andView.setViewName("user/noticeAll/notice_allView");
		
		return andView;
	}
	
//	@RequestMapping("deleteNoticeAll/{notice_all_code}")
//	public String deleteNoticeAll(
//			HttpServletRequest request,
//			ModelAndView andView,
//			@PathVariable String notice_all_code, Map<String, String> params) throws SQLException{
//		
//		params.put("notice_all_code", notice_all_code);
//		service.deleteNoticeAllInfo(params);
//		System.out.println("asdfsadf");
//		andView.setViewName("user/noticeAll/notice_allList");
//		return andView;
//	}
	
	@RequestMapping("deleteNoticeAll/{notice_all_code}")
	public String deleteNoticeAll(@PathVariable String notice_all_code, Map<String, String> params) throws SQLException{
		params.put("notice_all_code", notice_all_code);
		service.deleteNoticeAllInfo(params);
		return "redirect:/user/noticeAll/notice_allList.do";
	}
	
	@RequestMapping("updateNoticeAll")
	public String updateNoticeAll(NotEmpVO vo) throws SQLException{
		service.updateNoticeAllInfo(vo);
		
		return "redirect:/user/noticeAll/notice_allList.do";
	}
	
	@RequestMapping("insertNoticeAll")
	public String insertNoticeAll(NoticeAllVO nav,
								  HttpSession session,
								  String emp_code,
									@RequestParam("files") MultipartFile[] files) throws Exception{
		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		System.out.println("불러와야해 그래야 살아"+emp_code);
		service.insertNoticeAllInfo(nav, files);
		
		if(files ==null){
			return "redirect:/user/noticeAll/notice_allList.do";
		}
		
		
		
		
		return "redirect:/user/noticeAll/notice_allList.do";
	}
	
	
	
	
	
	

	@RequestMapping("notice_allForm")
	public String notice_allForm(){
		return "user/noticeAll/notice_allForm"; 
	}
	

	
	
}

