package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import shop.vo.CartProdVO;
import shop.vo.MemberVO;
import shop.vo.PayVO;
import shop.vo.ProdVO;


@WebServlet("/reviewList.do")
public class ReviewList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberVO memvo = (MemberVO)session.getAttribute("loginMember");
		
		IMemberService service = MemberServiceImpl.getService();
	//	System.out.println(memvo.getMem_id());
		
		List<PayVO> cart_no_list= service.getCartNo(memvo.getMem_id());
		
		ProdVO prodvo = new ProdVO();
		List<ProdVO> list = new ArrayList<>();


		List<CartProdVO> prod_id_list = null;
		// 세션 처리 prod_id , cart_no = > 작성된 리뷰들을 보고싶어서 
		session.setAttribute("cart_no_list", cart_no_list);
		

		for(PayVO vo : cart_no_list) {
			
		 prod_id_list = service.getProdId(vo.getCart_no()); 
		 
	    for(CartProdVO vo2 : prod_id_list) {
	        prodvo = service.getReview_Prod(vo2.getProd_id());
	        System.out.println("prodvio" + prodvo);
	        list.add(prodvo);
	        
	    }
	}

		session.setAttribute("prod_id_list",prod_id_list);

	    request.setAttribute("list", list);
 

		request.getRequestDispatcher("/member_jsp/notice/member/view/prod_reviewlist.jsp").forward(request, response);
			

		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
