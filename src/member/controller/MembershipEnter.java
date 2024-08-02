package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import shop.vo.MemberVO;


@WebServlet("/membershipEnter.do")
public class MembershipEnter extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("loginMember");
		
		IMemberService service = MemberServiceImpl.getService();
		
		String res = null;
		
		System.out.println(vo.getMem_id());
		res = service.getmembershipYN(vo.getMem_id());
		// 멤버쉽 마다 다른 곳을 감
		if(res != null && res.equals("Y")) {
		    request.getRequestDispatcher("/member_jsp/notice/member/mypage_membership2.jsp").forward(request, response);
		} else {
		    request.getRequestDispatcher("/member_jsp/notice/member/mypage_membership.jsp").forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
