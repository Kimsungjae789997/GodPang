package admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminServiceImpl;
import admin.service.IAdminService;
import shop.vo.LprodVO;


@WebServlet("/lprodInsert.do")
public class LprodInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String lprod_gu = request.getParameter("lprod_gu");
		String lprod_nm = request.getParameter("lprod_nm");
		
		LprodVO vo = new LprodVO();
		
		vo.setLprod_gu(lprod_gu);
		vo.setLprod_nm(lprod_nm);
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		int cnt = service.insertLprod(vo);
		
		request.setAttribute("cnt", cnt);
		
		request.getRequestDispatcher("/admin_jsp/admin_lprod/view/admin_insert.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
