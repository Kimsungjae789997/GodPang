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
import shop.vo.MembershipVO;


@WebServlet("/mypageBankUpdate.do")
public class MypageBankUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String bank_name = request.getParameter("bank_name");
		String account = request.getParameter("account");
		
		HttpSession session = request.getSession();
		MemberVO memvo = (MemberVO)session.getAttribute("loginMember");
		
		MembershipVO vo = new MembershipVO();
		
		vo.setMem_id(memvo.getMem_id());
		vo.setMembership_bank_name(bank_name);
		vo.setMembership_bank_no(account);
		
		IMemberService service = MemberServiceImpl.getService();
		
		service.updateBank(vo);
		
		request.getRequestDispatcher("/member_jsp/notice/member/mypage_membership2.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
