package prod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import shop.vo.AdminVO;
import shop.vo.ProdVO;

public class ProdDaoImpl implements IProdDao {

	private static ProdDaoImpl dao;

	private ProdDaoImpl() {

	}
 
	public static ProdDaoImpl getInstance() {
		if (dao == null)
			dao = new ProdDaoImpl();
		return dao;
	}
 
	@Override
	public List<ProdVO> prodList(String lprodgu) {

		SqlSession session = null;
		List<ProdVO> list = null;
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("prod.prodList", lprodgu);
			System.out.println("prodList " + list.get(0).getLprod_gu());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list; 
	}

	@Override
	public List<ProdVO> prodListAll() {
		SqlSession session = null;
		List<ProdVO> list = null;
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("prod.prodListAll");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list; 
	}

	
	
}
