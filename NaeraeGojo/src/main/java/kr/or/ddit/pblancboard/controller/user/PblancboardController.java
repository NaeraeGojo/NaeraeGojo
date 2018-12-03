package kr.or.ddit.pblancboard.controller.user;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.pblancboard.service.IPblancboardService;
import kr.or.ddit.utils.AllFileMapper;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.NoticeAllVO;
import kr.or.ddit.vo.PblancBoardVO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/pblancboard")
public class PblancboardController {
	
	@Resource
	private IPblancboardService service;
	
	@Autowired
	private AllFileMapper allFileMapper;
	
	// 크롤링할 주소
	private static String URL = "http://www.g2b.go.kr:8101/ep/tbid/tbidList.do?";  
	
	@RequestMapping("pblancboardForm")
	public void pblancboardForm(){}
	
	
	
	@RequestMapping("pblancboardList")
	public ModelAndView pblancboardList(HttpServletRequest request, HttpSession session 
			,String search_keyword, String search_keycode, String currentPage, 
			Map<String, String> params, ModelAndView andView) throws Exception{
		
		if(currentPage==null){
			currentPage = "1";
		}
		
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		int totalCount = service.totalCount(params);
		
		RolePagingUtil pagingUtil = new RolePagingUtil(Integer.parseInt(currentPage),totalCount,request);
		
		params.put("startCount",  String.valueOf(pagingUtil.getStartCount()));
		params.put("endCount", String.valueOf(pagingUtil.getEndCount()));
		
		List<PblancBoardVO> pblancboardList = service.pblancboardList(params);
		
		andView.addObject("pagingUtil",pagingUtil.getPagingHtmls());
		andView.addObject("pblancboardList", pblancboardList);
		andView.setViewName("user/pblancboard/pblancboardList");
		return andView;
	}
	
	@RequestMapping("pblancboardView")
	public ModelAndView ModelAndView(HttpSession session, String pblanc_board_code, 
			ModelAndView andView, Map<String, String> params) throws Exception{
	
		params.put("pblanc_board_code", pblanc_board_code);
		
		PblancBoardVO pblancboardInfo = service.pblancboardInfo(params);
		
		String keycode = (String) session.getAttribute("search_keycode");
		String keyword = (String) session.getAttribute("search_keyword");
		
		session.setAttribute("keycode", keycode);
		session.setAttribute("keyword", keyword);
		
		andView.setViewName("user/pblancboard/pblancboardView");
		andView.addObject("pblancboardInfo", pblancboardInfo);
		return andView;
	}
	
	@RequestMapping("insertPblancboard")
	public String insertPblancboard(PblancBoardVO pblancboardInfo, HttpSession session,
			  String emp_code, @RequestParam("files") MultipartFile[] files) throws Exception{

		pblancboardInfo.setEmp_code(((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code());
		service.insertPblancboardInfo(pblancboardInfo, files);
		return "redirect:/user/pblancboard/pblancboardList.do";
	}
	
	
	@RequestMapping("updatePblancboard")
	public ModelAndView updatePblancboard(@RequestBody String queryString, 
			PblancBoardVO pblancboardInfo, ModelAndView andView) throws Exception{
		
		service.updatePblancboardInfo(pblancboardInfo);
		
		andView.setViewName("redirect:/user/pblancboard/pblancboardList.do");
		return andView;
	}
	
	@RequestMapping("deletePblancboard/{pblanc_board_code}")
	public String deletePblancboard(@PathVariable("pblanc_board_code") String pblanc_board_code, Map<String, String> params) throws Exception{
		params.put("pblanc_board_code", pblanc_board_code);
		
		service.deletePblancboardInfo(params);
		
		return "redirect:/user/pblancboard/pblancboardList.do";
	}
	
	@Scheduled()
	public String adsf() throws Exception{
		
		String KEY_WORD2 = "CCTV";   // 검색하고 싶은 단어.  영어로
		// 한글은 더 해야함
		
		String KEY_WORD = URLEncoder.encode(KEY_WORD2, "UTF-8");
		
		System.out.println("URL ::  " +  URL +getParameter(KEY_WORD) + "\n\n");
		
		// 1. Document를 가져온다
		Document doc = Jsoup.connect(URL + getParameter(KEY_WORD)).get();
		
		// 2. 목록을 가져온다.
		//System.out.println("" + doc.toString());
		Elements elements = doc.select("tbody tr .tl a");
		//
		////3. 목록(배열 저장된)에서 정보를 가져온다.
		int idx = 0;
		for(Element element : elements){
			
			// 들어가는 링크가져오는거
			System.out.println(++idx + " : " + element.text());
			String tag = element.attr("abs:href"); // 절대 경로
			System.out.println(tag + "\n");
			System.out.println("=============================\n\n");
		}
			
			
			
		return "";
	}
	
	
	
	public static String getParameter(String KEY_WORD){
		String params = "searchType=1" +
						"&bidSearchType=1" + 
						"&taskClCds=" +
						"&bidNm="+ KEY_WORD + "" +
						"&searchDtType=1" +
						"&fromBidDt=2018" +
						"%2F11%2F03" +
						"&toBidDt=2018%2F12%2F03" +
						"&fromOpenBidDt=" +
						"&toOpenBidDt=" +
						"&radOrgan=1" +
						"&instNm=" +
						"&instSearchRangeType=" +
						"&refNo=" +
						"&area=" +
						"&areaNm=" +
						"&industry=" +
						"&industryCd=" +
						"&budget=" +
						"&budgetCompare=UP" +
						"&detailPrdnmNo=" +
						"&detailPrdnm=" +
						"&procmntReqNo=" +
						"&intbidYn=" +
						"&regYn=Y" +
						"&recordCountPerPage=30 " ;
		return params;
	}
	
}

