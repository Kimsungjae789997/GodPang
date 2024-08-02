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


@WebServlet("/mypageBankInsert.do")
public class MypageBankInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String bank_name = request.getParameter("bank_name");
		String account = request.getParameter("account");
		//MypageBankInsert=>bank_name : 카카오뱅크, account :123123
		System.out.println("MypageBankInsert=>bank_name : " + bank_name + ", account :"  + account);
		
		HttpSession session = request.getSession();
		MemberVO memvo = (MemberVO)session.getAttribute("loginMember");
		/*
		MypageBankInsert=>memvo : MemberVO [mem_id=user4, mem_pass=Password123, mem_name=김영수
		, mem_zip=12345, mem_add1=서울특별시 서초구, mem_add2=반포동, mem_tel=010-5678-9012
		, mem_mail=user4@naver.com, mem_memorialq=What is your favorite food?, mem_memoriala=Pizza, mem_delete=N]
		 */
		System.out.println("MypageBankInsert=>memvo : " + memvo);
		
		MembershipVO vo = new MembershipVO();
		
		vo.setMembership_bank_name(bank_name);
		vo.setMembership_bank_no(account);
		vo.setMem_id(memvo.getMem_id());
		
		IMemberService service = MemberServiceImpl.getService();
		/*
		MypageBankInsert=>vo : MembershipVO [membership_no=0, mem_id=user4, membership_code=null, membership_hire_date=null
		, membership_retire_date=null, membership_delete=null, membership_bank_name=카카오뱅크
		, membership_bank_no=123123, membership_card_name=null, membership_card_no=null, membership_card_cvc=null
		, membership_card_pass=null, membership_discount_rate=0]
		 */
		System.out.println("MypageBankInsert=>vo : " + vo);
		service.insertBank(vo);
		
		request.getRequestDispatcher("/member_jsp/notice/member/mypage_membership2.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
