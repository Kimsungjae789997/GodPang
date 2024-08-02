package lprod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import shop.vo.LprodVO;

public class LprodDaoImpl implements ILprodDao {

	private static LprodDaoImpl dao;

	private LprodDaoImpl() {

	} 

	public static LprodDaoImpl getInstance() {
		if (dao == null)
			dao = new LprodDaoImpl();
		return dao;
	}
 
	@Override
	public List<LprodVO> getLprodList() {
		SqlSession session = MybatisUtil.getSqlSession();
		
		List<LprodVO> list = null;
		try {
			list = session.selectList("lprod.getLprodList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return list;
	}
}