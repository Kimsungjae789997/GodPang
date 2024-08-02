package member.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import shop.vo.PayVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024
* 50)
@WebServlet("/insertReview.do")
public class InsertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		IMemberService service = MemberServiceImpl.getService();
		
		Map<String, Object> reviewedInsert = new HashMap<>();
		
		HttpSession session = request.getSession();
		List<PayVO> cart_no_list = (List<PayVO>) session.getAttribute("cart_no_list");
		
		
		String prod_id = request.getParameter("prod_id");
		reviewedInsert.put("prod_id", prod_id);
		
		String review_title = request.getParameter("review_title");
		String review_content = request.getParameter("review_content");
		
		reviewedInsert.put("review_title", review_title);
		reviewedInsert.put("review_content", review_content);
		
				
		
		// 파일 처리
		String uploadPath = request.getServletContext().getRealPath("/images/prod/all");

		        File f = new File(uploadPath);
		        if(!f.exists()) {
		            f.mkdirs();
		        }
				
				Part part = request.getPart("file");
				
				String fileName = extractFileName(part);
				
				
				
				if(!"".equals(fileName)) {
		        	
			         String saveFileName = UUID.randomUUID().toString() + "_" + fileName;
			         		reviewedInsert.put("review_img", saveFileName);
			            
			            try {
			                part.write(uploadPath + File.separator + saveFileName);
			            } catch (Exception e) {
			                e.printStackTrace();
			            }

			        }
		
		
				for(PayVO vo : cart_no_list) {
				    reviewedInsert.put("cart_no", vo.getCart_no());
				}

				int cnt = service.insertReview(reviewedInsert);
				
			  response.sendRedirect(request.getContextPath() + "/member_jsp/notice/member/mypage_review.jsp");
		
		
	}

	
    private String extractFileName(Part part) {
        String fileName = "";


        String headerValue = part.getHeader("content-disposition");
        String[] itemArr = headerValue.split(";");

        for(String item : itemArr) {
            if(item.trim().startsWith("filename")) {    
                fileName = item.substring(item.indexOf("=")+2,item.length()-1);
            }
        }

        return fileName;
    }
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
