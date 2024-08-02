package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.AdminServiceImpl;
import admin.service.IAdminService;
import shop.vo.NoticeVO;


@WebServlet("/noticeUpdate.do")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String notice_title = request.getParameter("notice_title1");
		String notice_content = request.getParameter("notice_content1");
		int notice_no = Integer.parseInt(request.getParameter("notice_no1"));
		
		NoticeVO vo = new NoticeVO();
		
		vo.setNotice_title(notice_title);
		vo.setNotice_content(notice_content);
		vo.setNotice_no(notice_no);
	
		IAdminService service = AdminServiceImpl.getInstance();
		
		service.updateNotice(vo);
		
		response.sendRedirect(request.getContextPath() + "/admin_jsp/admin_notice/admin_notice.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
