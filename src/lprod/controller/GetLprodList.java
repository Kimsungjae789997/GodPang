package lprod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lprod.service.ILprodService;
import lprod.service.LprodServiceImpl;
import shop.vo.LprodVO;
@WebServlet("/getLprodList.do")
public class GetLprodList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ILprodService service = LprodServiceImpl.getInstance();
		
		List<LprodVO> list = service.getLprodList();
		
		request.setAttribute("list", list);
		request.setCharacterEncoding("utf-8");
		request.getRequestDispatcher("/prod_category/view/lprodList.jsp").forward(request, response);
		  
	}
 
}
