package shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.IMeberService;
import shop.service.MemberSeviceImpl;

@WebServlet("/selectMemId.do")
public class SelectMemId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone = request.getParameter("phone");
		
		IMeberService service = MemberSeviceImpl.getInstance();
		String userid = service.selectId(phone);
		
		request.setAttribute("userid", userid);
		
		// view 페이지 이동 
		request.getRequestDispatcher("/login/selectMemIdView.jsp").forward(request, response);;
	}

}
