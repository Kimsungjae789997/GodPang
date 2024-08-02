package member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import shop.vo.MemberVO;

@WebServlet("/MypagePerson.do")
public class MypagePerson extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	IMemberService service = MemberServiceImpl.getService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		request.getRequestDispatcher("/member_jsp/member/mypageperson.jsp").forward(request,response);  
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // 요청 파라미터의 한글 처리
	    request.setCharacterEncoding("UTF-8");

	    // MemberVO 객체 생성 및 요청 파라미터를 해당 객체에 바인딩
	    MemberVO vo = new MemberVO();
	    try {
	        BeanUtils.populate(vo, request.getParameterMap());
	    } catch (IllegalAccessException | InvocationTargetException e) {
	        // 예외 처리
	        e.printStackTrace();
	    }

	    System.out.println("membervo====" + vo);
	    // MemberService 객체 생성
	    IMemberService service = MemberServiceImpl.getService();

	    // 회원 정보 업데이트 수행
	    int res = service.updateMyMember(vo);
	    System.out.println("update 결과 =" + res);

	    // 결과값을 request에 저장
	    request.setAttribute("res", res);

	    // 결과를 보여줄 view 페이지로 이동
	    RequestDispatcher disp = request.getRequestDispatcher("/member_jsp/member/mypageresult.jsp");
	    disp.forward(request, response);
	}
}


