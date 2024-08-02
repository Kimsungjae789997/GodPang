package shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shop.dao.IMemberDao;
import shop.service.IMeberService;
import shop.service.MemberSeviceImpl;
import shop.vo.MemberVO;
@WebServlet("/sessionloginMember.do")
public class SessionLoginMember extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String mem_id = request.getParameter("member_id");
        String mem_pw = request.getParameter("member_pw");

        MemberVO vo = new MemberVO();

        vo.setMem_id(mem_id);
        vo.setMem_pass(mem_pw); // 올바른 메소드를 사용하여 비밀번호를 설정

        //DB처리를 위한 Service 객체 생성
        IMeberService service = MemberSeviceImpl.getInstance();
        // ID와 Password에 일치하는 자료를 찾는다.
        MemberVO getMember = service.getLoginMember(vo);
        //세션얻기
        HttpSession session = request.getSession();   
        // 로그인 성공여부 검색, getLoginMember(paramMemberVo) 없으면 null을 반환 
        if(getMember != null) {     // 로그인이 성공하면 
            session.setAttribute("loginMember", getMember);
            response.sendRedirect(request.getContextPath()+"/mainpage.jsp"); // 로그인 성공 시 메인 페이지로 리다이렉트
        } else {
             response.sendRedirect(request.getContextPath()+"/login/LoginMember.jsp"); // 로그인 실패 시 로그인 페이지로 리다이렉트
        }
    }
}
