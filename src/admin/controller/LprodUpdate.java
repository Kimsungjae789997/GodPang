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

import admin.service.AdminServiceImpl;
import admin.service.IAdminService;
import shop.vo.LprodVO;

@WebServlet("/lprodUpdate.do")
public class LprodUpdate extends HttpServlet {
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
    	
     System.out.println("request ==" + reqdata);
    	
     Gson gson = new Gson();
     JsonArray lprodList = gson.fromJson(reqdata, JsonObject.class).getAsJsonArray("lprod_list");
     
     int cnt = 0;
     LprodVO vo = new LprodVO();
     IAdminService service = AdminServiceImpl.getInstance();
     
     for (JsonElement element : lprodList) {

    	    JsonObject obj = element.getAsJsonObject();
    	    
    	    String lprodGu = obj.get("lprod_gu").getAsString();
    	    String lprodNm = obj.get("lprod_nm").getAsString();
    	    
    	    vo.setLprod_gu(lprodGu);
    	    vo.setLprod_nm(lprodNm);
    	    cnt += service.updateLprod(vo);
    	    System.out.println("lprod_gu: " + lprodGu + ", lprod_nm: " + lprodNm);
    	    
    	}
     
     	request.setAttribute("cnt", cnt);
     
        request.getRequestDispatcher("/admin_jsp/admin_lprod/view/admin_update.jsp").forward(request, response);
     
    }
}