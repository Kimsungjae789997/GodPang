package shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import shop.vo.ReviewVO;

public class ShopDaoImpl implements IShopDao{


	private static ShopDaoImpl dao;
	
	private ShopDaoImpl() { };
	
	public static ShopDaoImpl getInstance() {
		if(dao == null) dao = new ShopDaoImpl();
		return dao;
	}
	
	
	@Override
	public List<ReviewVO> getProdDetailReview() {
		SqlSession session = null;
		List<ReviewVO> list = null;
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("review.getProdDetailReview");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

}
