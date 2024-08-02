package admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminServiceImpl;
import admin.service.IAdminService;
import shop.vo.NoticeVO;
import shop.vo.PageVO;
import shop.vo.ReviewVO;


@WebServlet("/noticeGet.do")
public class NoticeGet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int page = Integer.parseInt(request.getParameter("page"));
		String stype = request.getParameter("stype");
		String sword = request.getParameter("sword");
		System.out.println(page + "stype" + "sword");
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		PageVO vo = service.getPageInfo5(page, stype, sword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("sword", sword);
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		
		List<NoticeVO> list = service.selectByPage5(map);
		
		request.setAttribute("asd", list);
		request.setAttribute("startp", vo.getStartPage());
		request.setAttribute("endp", vo.getEndPage());
		request.setAttribute("totalp", vo.getTotalPage());
		
		// view페이지로 이동
		request.getRequestDispatcher("/admin_jsp/admin_notice/view/admin_list.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
