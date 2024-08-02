package member.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import shop.vo.MemberVO;




@WebServlet("/InsertMember.do")
public class InsertMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
   


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//
		request.setCharacterEncoding("UTF-8");
		
		
		MemberVO vo = new MemberVO();
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	//service 객체 얻기
	IMemberService service = MemberServiceImpl.getService();
	
	// 1> member테이블에 입력하기
	//service메소드 호출
	int cnt = service.insertMember(vo);
	//결과값을 request에 저장
	request.setAttribute("cnt", cnt);
	
	// 2> 멤버십 테이블에 입력하기
	service.insertMembership(vo.getMem_id());
	
	
	
	
	
	
	//view페이지로 이동
	RequestDispatcher disp = request.getRequestDispatcher("/member_jsp/view/result.jsp");
	disp.forward(request, response);

}
}
