package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminServiceImpl;
import admin.service.IAdminService;
import shop.vo.LprodVO;


@WebServlet("/lprodAllSelect.do")
public class LprodAllSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		List<LprodVO> list = service.getAllLprod();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/admin_jsp/admin_lprod/admin_lprod.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
