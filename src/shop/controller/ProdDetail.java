package shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.service.IShopService;
import shop.service.ShopServiceImpl;
import shop.vo.ReviewVO;


@WebServlet("/prodDetail.do")
public class ProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String prod_id = request.getParameter("prod_id");
		
		IShopService service= ShopServiceImpl.getInstance();
		
		List<ReviewVO> list = service.getProdDetailReview();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/prod_detail_center.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
