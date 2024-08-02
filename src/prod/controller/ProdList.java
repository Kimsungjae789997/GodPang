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

@WebServlet("/prodList.do")
public class ProdList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 // sd
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String lprod = request.getParameter("lprod");	
		
		IProdService service = ProdServiceImpl.getInstance();
		List<ProdVO> list = null;
		list = service.prodList(lprod);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/prod_category/view/prodListview.jsp").forward(request, response);

		      
		 
	}

	

}
