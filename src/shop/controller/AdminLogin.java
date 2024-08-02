package shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminServiceImpl;
import admin.service.IAdminService;


@WebServlet("/adminLogin.do")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String admin_code = request.getParameter("admin_code");
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		request.setAttribute("admin_code", service.adminLogin(admin_code)); 
		
		request.getRequestDispatcher("/admin_jsp/admin_login/view/admin_login.jsp").forward(request, response);
	}

}
