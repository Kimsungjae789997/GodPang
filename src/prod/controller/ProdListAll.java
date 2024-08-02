package prod.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import prod.service.IProdService;
import prod.service.ProdServiceImpl;
import shop.vo.ProdVO;

@WebServlet("/prodListAll.do")
public class ProdListAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IProdService service = ProdServiceImpl.getInstance();
		
		List<ProdVO> list = service.prodListAll();
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/prod_category/view/prodListview.jsp").forward(request, response);
  
	}
 

}
