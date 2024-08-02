package lprod.service;

import java.util.List;

import lprod.dao.ILprodDao;
import lprod.dao.LprodDaoImpl;
import shop.vo.LprodVO;

public class LprodServiceImpl implements ILprodService{

	   private ILprodDao dao; //다오랑 연결
	   
	   //싱글톤
	   private static LprodServiceImpl service;
	   
	   private LprodServiceImpl() {
	      dao = LprodDaoImpl.getInstance();
	   }
	   public static LprodServiceImpl getInstance() {
	      if(service==null) service = new LprodServiceImpl();
	      
	       return service;
	   }
	@Override
	public List<LprodVO> getLprodList() {
		// TODO Auto-generated method stub
		return dao.getLprodList();
	}
	    
	   
	   
	}