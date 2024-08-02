package shop.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.IMeberService;
import shop.service.MemberSeviceImpl;
import shop.vo.MemberVO;

@WebServlet("/selectMemPw.do")
public class SelectMemPw extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		int cnt =0;
		IMeberService service = MemberSeviceImpl.getInstance();
		
		MemberVO vo = service.selectPassword(email);
					  
		String mail = vo.getMem_mail();
		String pass = vo.getMem_pass();
		
		if(vo != null) {
			sendMail(mail, pass);
			cnt = 1;
		}
		// view 페이지 이동 
		request.setAttribute("cnt", cnt);
		request.getRequestDispatcher("/login/result.jsp").forward(request, response);
	}
	
	public void sendMail(String mail, String pass) {
		String recipient = mail;

		// 1. 발신자의 메일 계정과 비밀번호 설정
		final String user = "kkkk2088@naver.com";
		final String password = "UH2QURJPRF1W";

		// 2. Property에 SMTP 서버 정보 설정
		// 전송을 위해서는 사용하려는 이메일 계정에 SMTP 사용에 대한 허용도 해주어야한다.
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.naver.com");

		// 3. SMTP 서버정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스 생성
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// 4. Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성한다.
		MimeMessage message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(user));

			// 수신자(Recipient) 메일 주소
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

			// 제목
			message.setSubject("비밀코드입니다.");

			// 내용
			message.setText("비밀번호입니다" + pass);

			// 5. Transport 클래스를 사용하여 작성한 메시지를 전달한다.
			Transport.send(message); // 메시지 전송

		} catch (AddressException e) {
			 System.out.println("이메일 주소가 잘못되었습니다: " + e.getMessage());
		} catch (MessagingException e) {
			  System.out.println("이메일 전송 중 오류가 발생했습니다: " + e.getMessage());
		}
	}

}
