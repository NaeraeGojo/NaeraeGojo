package kr.or.ddit.pblancboard.controller.user;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.pblancboard.service.IPblancboardService;
import kr.or.ddit.utils.AllFileMapper;
import kr.or.ddit.utils.RolePagingUtil;
import kr.or.ddit.vo.EmpVO;
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
	
	private static String URL22 = "http://www.g2b.go.kr:8081/ep/invitation/publish/bidInfoDtl.do?bidno=20181109970&bidseq=00&releaseYn=Y&taskClCd=1";
	
	@RequestMapping("pblancboardForm")
	public void pblancboardForm(){}
	
	
	
	@RequestMapping("pblancboardList")
	public ModelAndView pblancboardList(HttpServletRequest request, HttpSession session 
			,String search_keyword, String search_keycode, String currentPage, 
			Map<String, String> params, ModelAndView andView) throws Exception{
		
		if(currentPage==null || currentPage == ""){
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
	
//	@Scheduled(cron="5 * * * * *")
	public void crawling() throws Exception{
		String KEY_WORD2 = "정부청사";   // 검색하고 싶은 단어.  영어로
		// 한글은 더 해야함

		String KEY_WORD = URLEncoder.encode(KEY_WORD2, "euc-kr");
		
		System.out.println("URL ::  " +  URL +getParameter(KEY_WORD) + "\n\n");
		
		// 1. Document를 가져온다
		Document doc = Jsoup.connect(URL + getParameter(KEY_WORD)).get();
		
		// 2. 목록을 가져온다.
		//System.out.println("" + doc.toString());
		Elements elements = doc.select("tbody tr .tl a");
		
		// 3. 목록(배열 저장된)에서 정보를 가져온다.
		int idx = 0;
		for(Element element : elements){
			String setPblanc_board_title = element.text();  // setPblanc_board_title - 사업 이름
			
			//기존에 정보있는지 확인
			String tmp = service.pblanc_board_comVS(setPblanc_board_title);
			if(tmp == null){
				
				System.out.println(++idx + " : " + setPblanc_board_title);
				String pblanc_board_link = element.attr("abs:href"); // 절대 경로 -- PBLANC_BOARD_LINK
				
				
				PblancBoardVO pb = new PblancBoardVO();
				pb.setPblanc_board_title(element.text());
				pb.setPblanc_board_link(pblanc_board_link);
				String pblanc_board_code = service.insertPblancInfo(pb);
				
				
				Document doc2 = Jsoup.connect(URL22).get();
				
				Elements pblanc_board_com = doc2.select("#container div:eq(7) .table_info tbody tr:eq(3) td:eq(3)");  // 공고일시 
				Elements com_date = doc2.select("#container div:eq(9) .table_info tbody tr:eq(2) td:eq(1)");  // 공고일시 
				Elements end_proposal = doc2.select("#container div:eq(9) .table_info tbody tr:eq(2) td:eq(3)");  // 마감일시 
				Elements budget = doc2.select("#container div:eq(13) .table_info tbody tr:eq(2) td:eq(1)");  // 예산 
				
				String realbudget = budget.text();
				realbudget = realbudget.replaceAll("원", "");
				
				realbudget = realbudget.replaceAll(",", "" );
				
				Map<String, String> params = new HashMap<String, String>();
				params.put("pblanc_board_com_date", com_date.text());
				params.put("pblanc_board_end_proposal", end_proposal.text());
				params.put("pblanc_board_budget", realbudget);
				params.put("pblanc_board_com", pblanc_board_com.text());
				params.put("pblanc_board_code", pblanc_board_code);
				
				service.updatePblancInfo(params);
				
			}
			
		}
		

		
		
		
		
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
				"&recordCountPerPage=1" ;
		return params;
		
	}
	
	
	
	
}

