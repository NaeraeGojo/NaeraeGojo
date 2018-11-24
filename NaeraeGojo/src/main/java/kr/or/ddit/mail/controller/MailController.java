package kr.or.ddit.mail.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mail/")
public class MailController {

   @RequestMapping("send")
   public ModelAndView send(HttpSession sessionMail,
                String email_nick,
                String code,
                ModelAndView model) throws Exception {
     
      String host = "smtp.naver.com";
      final String user = "protoss2018@naver.com";
      final String password = "protossA1";
      String to = email_nick+"@naver.com";
      String codeNum = code;
      
      
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
         message.setText("회원가입을 하려면 해당 링크를 클릭해주세요~ \r\n"
        		 +"인증코드 : http://localhost/NaeraeGojo/user/join/loginForm.do?emp_code="+codeNum
        		 +"\r\n 사원번호 : "+codeNum);
         
         System.out.println(code);
         // send the message
         Transport.send(message);

      } catch (MessagingException e) {
         e.printStackTrace();
      }
      model.addObject("emp_code", codeNum);
      model.setViewName("jsonConvertView");
//      model.setViewName("user/emp/empList");
      
      return model;
   
   }
}