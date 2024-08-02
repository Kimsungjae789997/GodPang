package admin.controller;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;

import admin.service.AdminServiceImpl;
import admin.service.IAdminService;
import shop.vo.ProdStockVO;


@WebServlet("/prodstockDelete.do")
public class ProdstockDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		StringBuffer strbuf = new StringBuffer();
	     
	     String line = null;
	     
	     BufferedReader reader = request.getReader();
	     
	     while( (line = reader.readLine()) != null ) {
	    	 strbuf.append(line);
	     }
	       
	     String reqdata = String.valueOf(strbuf);
	     
	     System.out.println(reqdata);
	     Gson gson = new Gson();
	     
	     ProdStockVO vo = new ProdStockVO();
	     IAdminService service = AdminServiceImpl.getInstance();
	     
	     JsonArray checkedIdsArray = gson.fromJson(reqdata, JsonElement.class).getAsJsonObject().getAsJsonArray("checkedIds");
	     for (JsonElement idElement : checkedIdsArray) {
	         String id = idElement.getAsString();
	         vo.setProd_id(id);
	         
	         System.out.println(id);
	         
	         service.deleteStock(vo); 
	     }
	     
	     response.sendRedirect(request.getContextPath() + "/admin_jsp/admin_prodstock/admin_prodstock.jsp");
	     
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
