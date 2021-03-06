package kr.or.ddit.controller.main;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.utils.CryptoGenerator;
//import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/join/")
public class MainController {
//	@Autowired
//	private IMemberService service;
	@Autowired
	private CryptoGenerator cryptoGen;

	@RequestMapping("main")
	public String main(HttpSession session, 
			Map<String, String> params,
			Model model) throws Exception{
//		MemberVO memberInfo = service.memberInfo(params);
//		if(session.getAttribute("LOGIN_MEMBERINFO") == null){
//			return "redirect:/user/loginForm.do";
//		}else{
//			Map<String, String> publicKeyMap = cryptoGen.getGeneratePairKey(session);
//			session.setAttribute("publicKeyMap", publicKeyMap);
			return "forward:/user/join/index.do";
//		}
	}
	@RequestMapping("index")
	public void index(){}
	@RequestMapping("calendar")
	public void calendar(){}
	@RequestMapping("bell")
	public void bell(){}
	@RequestMapping("project_manage")
	public void project_manage(){}
	@RequestMapping("project_manage_see")
	public void project_manage_see(){}
	@RequestMapping("project_1_2_1")
	public void project_1_2_1(){}
	@RequestMapping("modar")
	public void modar(){}
	
	

	@RequestMapping("qna_1")
	public void qna_1(){}

	
}