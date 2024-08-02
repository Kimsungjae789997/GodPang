package admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import admin.service.AdminServiceImpl;
import admin.service.IAdminService;
import shop.vo.ProdVO;


@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024
* 50)
@WebServlet("/prodInsert.do")
public class ProdInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String prod_id = request.getParameter("prod_id");
		String prod_name = request.getParameter("prod_name");
		String prod_content = request.getParameter("prod_content");
		int prod_cost = Integer.parseInt(request.getParameter("prod_cost"));
		int prod_price = Integer.parseInt(request.getParameter("prod_price"));
		String lprod_gu = request.getParameter("lprod_gu");
		
		ProdVO prodVo = new ProdVO();
		
		prodVo.setProd_id(prod_id);
		prodVo.setProd_name(prod_name);
		prodVo.setProd_content(prod_content);
		prodVo.setProd_cost(prod_cost);
		prodVo.setProd_price(prod_price);
		prodVo.setLprod_gu(lprod_gu);
		
		IAdminService service = AdminServiceImpl.getInstance();
		
		// 파일 처리
		String uploadPath = request.getServletContext().getRealPath("/images/prod/all");

		        File f = new File(uploadPath);
		        if(!f.exists()) {
		            f.mkdirs();
		        }
				
				Part part = request.getPart("prod_img");
				
				String fileName = extractFileName(part);
				
				
				
				if(!"".equals(fileName)) {
		        	
			         String saveFileName = UUID.randomUUID().toString() + "_" + fileName;
			         		prodVo.setProd_img(saveFileName);
			            
			            try {
			                part.write(uploadPath + File.separator + saveFileName);
			            } catch (Exception e) {
			                e.printStackTrace();
			            }

			        }
				int cnt = service.insertProd(prodVo);
				
			if(cnt>0) {
				response.sendRedirect(request.getContextPath() + "/admin_jsp/admin_prod/admin_prod.jsp");
			}
		
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
