package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import shop.vo.CartProdVO;
import shop.vo.PayVO;
import shop.vo.ReviewVO;

@WebServlet("/reviewed_List.do")
public class Reviewed_List extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        List<CartProdVO> prod_id_list = (List<CartProdVO>) session.getAttribute("prod_id_list");
        List<PayVO> cart_no_list = (List<PayVO>) session.getAttribute("cart_no_list");

        IMemberService service = MemberServiceImpl.getService();

        List<ReviewVO> list = new ArrayList<>();
        if (prod_id_list != null && cart_no_list != null) {
            for (CartProdVO cartProdVO : prod_id_list) {
                for (PayVO payVO : cart_no_list) {
                    Map<String, Object> reviewedlist = new HashMap<>();
                    reviewedlist.put("cart_no", payVO.getCart_no());
                    reviewedlist.put("prod_id", cartProdVO.getProd_id());
                    List<ReviewVO> reviewList = service.getReviewed_list(reviewedlist);
                    list.addAll(reviewList);
                }
            }
        }

        request.setAttribute("list", list);
        request.getRequestDispatcher("/member_jsp/notice/member/view/prod_reviewlist.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}