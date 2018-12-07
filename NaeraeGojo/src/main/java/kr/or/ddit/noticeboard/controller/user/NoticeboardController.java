package kr.or.ddit.noticeboard.controller.user;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.allfile.service.IAllFileService;
import kr.or.ddit.global.GlobalConstant;
import kr.or.ddit.noticeboard.service.INoticeFileService;
import kr.or.ddit.noticeboard.service.INoticeboardService;
import kr.or.ddit.utils.AllFileMapper;
import kr.or.ddit.utils.NoticeFileMapper;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.AllFileVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.NoPrEmpVO;
import kr.or.ddit.vo.NoticeAllVO;
import kr.or.ddit.vo.NoticeBoardVO;
import kr.or.ddit.vo.NoticeFileVO;
import kr.or.ddit.vo.PblancBoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/project/notice")
public class NoticeboardController {
	@Resource
	private INoticeboardService service;
	
	@Autowired
	INoticeFileService fileService;
	
	@Autowired
	private NoticeFileMapper noticeFileMapper;
	//
	@RequestMapping("noticeFileDownload")
	public ModelAndView downloadFile(ModelAndView andView,String notice_file_code
			, Map<String, String> params) throws Exception{
		params.put("notice_file_code", notice_file_code);
		NoticeFileVO nfv =fileService.getNoticeFile(params);
		
		File targetFile = new File(GlobalConstant.SAVE_NOTICE, nfv.getNotice_file_save_name()); 
		andView.addObject("downloadFile", targetFile);
		andView.addObject("downloadFileName",nfv.getNotice_file_name());
		andView.setViewName("downloadView");
		return andView;
	}
	
	
	@RequestMapping("notice_list")
	public ModelAndView notice_list(HttpServletRequest request,
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
		
//		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();		
//		System.out.println("아디아디아디아디"+emp_code);
//		params.put("emp_code", emp_code);
		
//		if(params != null){
//			String message = (String) params.get("message");
//			System.out.println("RedirectAttribute post 전송 파람 : " + message);
//		}
		String project_code = (String) session.getAttribute("project_code");
		params.put("project_code", project_code);
		
		
		int totalCount = service.totalCount(params);
		RolePagingUtil paginUtil = new RolePagingUtil(Integer.parseInt(currentPage),totalCount,request);
		params.put("startCount",  String.valueOf(paginUtil.getStartCount()));
		params.put("endCount", String.valueOf(paginUtil.getEndCount()));
		List<NoticeBoardVO> noticeList = service.noticeboardList(params);
		andView.addObject("noticeList",noticeList);
		andView.addObject("pagingHtmls",paginUtil.getPagingHtmls());
		andView.setViewName("user/project/notice/notice_list");
		return andView;
	}
	
	@RequestMapping("notice_view/{notice_code}")
	public ModelAndView notice_view(
			HttpServletRequest request,
			ModelAndView andView,
			NoticeBoardVO vo,
			@PathVariable String notice_code, Map<String, String> params
			)throws Exception{
		
		params.put("notice_code", notice_code);
		
		vo = service.noticeboardInfo(params);
		service.updateHit(params);
		andView.addObject("vo",vo);
		andView.setViewName("user/project/notice/notice_view");
		
		return andView;
	}
	
	
	@RequestMapping("deleteNotice/{notice_code}")
	public String deleteNotice(@PathVariable String notice_code, Map<String, String> params) throws SQLException{
		params.put("notice_code", notice_code);
		service.deleteNoticeboardInfo(params);
		return "redirect:/user/project/notice/notice_list.do";
	}
	
	@RequestMapping("updateNotice")
	public String updateNotice(NoticeBoardVO vo) throws SQLException{
		service.updateNoticeboardInfo(vo);
		
		return "redirect:/user/project/notice/notice_list.do";
	}
	
	@RequestMapping("insertNotice")
	public String insertNotice(NoticeBoardVO nbv,
								  HttpSession session,
								  String emp_code,
									@RequestParam("files") MultipartFile[] files) throws Exception{
		emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		
		service.insertNoticeboardInfo(nbv, files);
		return "redirect:/user/project/notice/notice_list.do";
	}
	
	

	@RequestMapping("notice_form")
	public ModelAndView notice_allForm(ModelAndView andView,
									Map<String, String> params
			) throws Exception{
		List<NoticeBoardVO> vo = service.projectList(params);
		
		andView.addObject("vo",vo);
		andView.setViewName("user/project/notice/notice_form");
		
		
		
		return andView;
	}
	
	
	
	
	
	public ModelAndView NoticeboardList(HttpServletRequest request, HttpSession session) throws Exception{
	
		return null;
	}
	
	
	public ModelAndView updateNoticeboard(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	
	public String insertNoticeboard(NoticeBoardVO nbv, HttpSession session,
			  String emp_code, @RequestParam("files") MultipartFile[] files) throws Exception{
		
		
			service.insertNoticeboardInfo(nbv, files);
			return "redirect:/user/project/notice/notice_list.do";
			
			
	}
	
	
	public String deleteNoticeboard() throws Exception{
		
		return null;
	}
}

