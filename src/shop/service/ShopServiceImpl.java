package shop.service;

import java.util.List;

import shop.dao.IShopDao;
import shop.dao.ShopDaoImpl;
import shop.vo.ReviewVO;

public class ShopServiceImpl implements IShopService {

	private IShopDao dao;
	
	private static ShopServiceImpl service;
	
	private ShopServiceImpl() {
		dao = ShopDaoImpl.getInstance();
	}
	
	public static IShopService getInstance() {
		if(service == null) service = new ShopServiceImpl();
		return service;
	}
	
	@Override
	public List<ReviewVO> getProdDetailReview() {
		// TODO Auto-generated method stub
		return dao.getProdDetailReview();
	}

}
