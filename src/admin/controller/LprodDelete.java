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
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import admin.service.AdminServiceImpl;
import admin.service.IAdminService;
import shop.vo.LprodVO;



@WebServlet("/lprodDelete.do")
public class LprodDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
	     
	     int cnt = 0;
	     LprodVO vo = new LprodVO();
	     IAdminService service = AdminServiceImpl.getInstance();
	     
	     JsonArray checkedIdsArray = gson.fromJson(reqdata, JsonElement.class).getAsJsonObject().getAsJsonArray("checkedIds");
	     for (JsonElement idElement : checkedIdsArray) {
	         String id = idElement.getAsString();
	         vo.setLprod_gu(id);
	         cnt += service.deleteLprod(vo);	         
	     }
	     
	     	request.setAttribute("cnt", cnt);
	     
	        request.getRequestDispatcher("/admin_jsp/admin_lprod/view/admin_delete.jsp").forward(request, response);

	     
	  
	}

}
