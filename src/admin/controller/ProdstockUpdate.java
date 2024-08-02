package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminServiceImpl;
import admin.service.IAdminService;
import shop.vo.ProdStockVO;


@WebServlet("/prodstockUpdate.do")
public class ProdstockUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String prod_id = request.getParameter("prod_id1");
		int prod_stock_j_00 = Integer.parseInt( request.getParameter("prod_stock_j_00"));
		int prod_stock_in = Integer.parseInt(request.getParameter("prod_stock_in"));
		int prod_stock_j_99 = Integer.parseInt(request.getParameter("prod_stock_j_99"));
	
	
		ProdStockVO vo = new ProdStockVO();
		vo.setProd_id(prod_id);
		vo.setProd_stock_j_00(prod_stock_j_00);
		vo.setProd_stock_in(prod_stock_in);
		vo.setProd_stock_j_99(prod_stock_j_99);
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		service.updateStock(vo);
		
		response.sendRedirect(request.getContextPath() + "/admin_jsp/admin_prodstock/admin_prodstock.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
