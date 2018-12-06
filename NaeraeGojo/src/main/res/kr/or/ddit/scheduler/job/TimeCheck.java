package kr.or.ddit.scheduler.job;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;







import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import kr.or.ddit.pblancboard.service.IPblancboardService;
import kr.or.ddit.vo.PblancBoardVO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

//@Component
public class TimeCheck{
	
	@Autowired
	private IPblancboardService service;
	
	private static String URL = "http://www.g2b.go.kr:8101/ep/tbid/tbidList.do?";
	
	@Scheduled(cron="5 * * * * *")
	public void crawling(){
		
		
		System.out.println("asdfasdf    : " + new SimpleDateFormat("yyyy/MM/dd hh:mm:ss").format(new Date()));
		
		String KEY_WORD = "system";   // 검색하고 싶은 단어.  영어로
		
		System.out.println("URL ::  " +  URL +getParameter(KEY_WORD) + "\n\n");
		
		// 1. Document를 가져온다
		Document doc = null;
		try {
			doc = Jsoup.connect(URL + getParameter(KEY_WORD)).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 2. 목록을 가져온다.
		//System.out.println("" + doc.toString());
		Elements elements = doc.select("tbody tr .tl a");
		//
		////3. 목록(배열 저장된)에서 정보를 가져온다.
		int idx = 0;
		
		Map<String, String> params = new HashMap<String, String>();
		for(Element element : elements){
			
			System.out.println(++idx + " : " + element.text()); // PBLANC_BOARD_COM
			String pblanc_board_link = element.attr("abs:href"); // 절대 경로 -- PBLANC_BOARD_LINK
			
//			if()
			
			PblancBoardVO pb = new PblancBoardVO();
			pb.setPblanc_board_com(element.text());
			pb.setPblanc_board_link(pblanc_board_link);
//			params.put("pblanc_board_com", element.text());
//			params.put("pblanc_board_link", pblanc_board_link);
			
			try {
				service.insertPblancInfo(pb);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			System.out.println(pblanc_board_link + "\n");
			System.out.println("=============================\n\n");
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
