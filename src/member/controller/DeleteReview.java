package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;


@WebServlet("/deleteReview.do")
public class DeleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		
		IMemberService service = MemberServiceImpl.getService();
		
		service.deleteReview2(review_no);
		
		response.sendRedirect(request.getContextPath() + "/member_jsp/notice/member/mypage_review.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
