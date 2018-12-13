package kr.or.ddit.mail.controller;

import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.emp.service.IEmpService;
import kr.or.ddit.vo.EmpVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mail/")
public class MailController {

	@Resource
	private IEmpService service;
	
	@RequestMapping("send")
	public ModelAndView send(HttpSession sessionMail,
                String email_nick,
                String code,
                String pass,
                ModelAndView model) throws Exception {
     
      String host = "smtp.naver.com";
      final String user = "protoss2018@naver.com";
      final String password = "protossA1";
      String to = email_nick+"@naver.com";
      String codeNum = code;
      String Pass = pass;
      
      
      // Get the session object
      Properties props = new Properties();
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.auth", "true");
      
      Session session = Session.getDefaultInstance(props,
            new javax.mail.Authenticator() {
               protected PasswordAuthentication getPasswordAuthentication() {
                  return new PasswordAuthentication(user, password);
               }
            });

      // Compose the message
      try {
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(user));
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
         
         
         // 메일제목
         message.setSubject("ProToss 회원가입 인증입니다.");
         
//         Random r = new Random();
//         int[] arr = new int[2];
//         for (int i = 0; i <2; i++) {
//            arr[i] += r.nextInt(10);
//         }
//         String d = arr.toString();
//         c = d.substring(3, 9);
         
         // 메일 내용을 섹션값에 저장한 내용
//         sessionMail.setAttribute("sendMail", arr);
         
         
         // 메일 보낸 내용
         message.setContent("<h2>회원가입을 완료하려면 아래 해당 로그인 페이지를 클릭해주세요~</h2><br/><br/>"
        		+ "<a href=\'http://localhost/user/join/loginForm.do?emp_code="+codeNum+"&emailNick="+ email_nick+"\'>"
        				+ "<h3>http://localhost/user/join/loginForm.do</h3></a>"
        		 +"<p> <h3>사원번호 : "+codeNum +"</h3></p>" 
        		 +"<p> <h3>비밀번호 : "+Pass +"</h3></p>"
        		 +"<img src=\'https://t1.daumcdn.net/cfile/tistory/998778485A79C4CA0B\'>", "text/html; charset=utf-8");

         //         message.setText("회원가입을 하려면 해당 링크를 클릭해주세요~ \r\n"
//        		 +"인증코드 : http://localhost/NaeraeGojo/user/join/loginForm.do?emp_code="+codeNum+"&emailNick="+ email_nick
//        		 +"\r\n 사원번호 : "+codeNum 
//        		 + "\r\n 비밀번호 : "+Pass);
//         
         System.out.println(code);
         // send the message
         Transport.send(message);

      } catch (MessagingException e) {
         e.printStackTrace();
      }
      model.addObject("emp_code", codeNum);
      model.addObject("emp_pass", Pass);
      model.setViewName("jsonConvertView");
//      model.setViewName("user/emp/empList");
      
      return model;
   
   }
   @RequestMapping(value="passCheck", method = RequestMethod.POST)
   public ModelAndView passCheck(String emp_pass, String emp_code,
			Map<String, String> params, EmpVO empPass,
			HttpServletRequest request, HttpServletResponse response,
			Model model, ModelMap modelMap, ModelAndView model1, HttpSession sessionMail,
		   String emailID) throws Exception {
	   	params.put("emp_code", emp_code);
	   	String emp_email = emailID + "@naver.com";
		params.put("emp_email", emp_email);
		
		empPass = service.empPass(params); 
		if(empPass == null){
			return model1;
		}
		else{
			emp_pass = empPass.getEmp_pass();
			String host = "smtp.naver.com";
			final String user = "protoss2018@naver.com";
			final String password = "protossA1";
			String to = emailID+"@naver.com";
			String pass = emp_pass;
		   
		   
		   // Get the session object
		   Properties props = new Properties();
		   props.put("mail.smtp.host", host);
		   props.put("mail.smtp.auth", "true");
		   
		   Session session = Session.getDefaultInstance(props,
				   new javax.mail.Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
				   return new PasswordAuthentication(user, password);
			   }
		   });
		   
		   // Compose the message
		   try {
			   MimeMessage message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(user));
			   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			   
			   
			   // 메일제목
			   message.setSubject("ProToss 분실한 비밀번호 안내입니다.");
			   
	//         Random r = new Random();
	//         int[] arr = new int[2];
	//         for (int i = 0; i <2; i++) {
	//            arr[i] += r.nextInt(10);
	//         }
	//         String d = arr.toString();
	//         c = d.substring(3, 9);
			   
			   // 메일 내용을 섹션값에 저장한 내용
	//         sessionMail.setAttribute("sendMail", arr);
			   
			   
			   // 메일 보낸 내용
			   message.setText("회원님의 분실한 비밀번호는 아래와 같습니다. \r\n"
					   +"비밀번호 : "+pass);
			   
			   System.out.println(pass);
			   // send the message
			   Transport.send(message);
			   
		   } catch (MessagingException e) {
			   e.printStackTrace();
		   }
		   model1.addObject("emp_pass", pass);
		   model1.setViewName("jsonConvertView");
	//      model.setViewName("user/emp/empList");
		   
		   return model1;
		   
	   }
   }
}