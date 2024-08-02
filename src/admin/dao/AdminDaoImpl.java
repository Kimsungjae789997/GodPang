package admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.config.MybatisUtil;
import shop.vo.LprodVO;
import shop.vo.NoticeVO;
import shop.vo.PayVO;
import shop.vo.ProdStockVO;
import shop.vo.ProdVO;
import shop.vo.ReviewVO;

public class AdminDaoImpl implements IAdminDao{

	// 싱글톤
	private static AdminDaoImpl dao;

	private AdminDaoImpl() {}
	
	public static AdminDaoImpl getInstance() {
		if(dao == null) dao = new AdminDaoImpl();
		return dao;
	}

	// 관리자 로그인
	@Override
	public String adminLogin(String code) {
		
		SqlSession session = null;
		String res = null;
		
		try {
			
			session = MybatisUtil.getSqlSession();
			res = session.selectOne("admin.adminLogin", code);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

	// 상품 카테고리목록들 다 가져오기
	@Override
	public List<LprodVO> getAllLprod() {

		SqlSession session = null;
		List<LprodVO> list = null;
		
		try {
			
			session = MybatisUtil.getSqlSession();
			list = session.selectList("lprod.getAllLprod");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	@Override
	public int insertLprod(LprodVO vo) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("lprod.insertLprod", vo);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}
	
	// lprod 수정
	@Override
	public int updateLprod(LprodVO vo) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			
			session = MybatisUtil.getSqlSession();
			cnt = session.update("lprod.updateLprod",vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
			System.out.println(cnt);
		}
		return cnt;
	}
	// 카테고리 삭제
	@Override
	public int deleteLprod(LprodVO vo) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("lprod.deleteLprod", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}


	@Override
	public int getTotalCount(Map<String, Object> map) {
		SqlSession session = MybatisUtil.getSqlSession();
		int count = 0;
		try {
			count = session.selectOne("prod.getTotalCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return count;
	}
	
	@Override
	public List<ProdVO> selectByPage(Map<String, Object> map) {
		SqlSession session = MybatisUtil.getSqlSession();
		List<ProdVO> list = null;
		
		try {
			list = session.selectList("prod.selectByPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	@Override
	public String getProdImg(String prod_id) {
		SqlSession session = null;
		String prod_img = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			prod_img = session.selectOne("prod.getProdImg", prod_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return prod_img;
	}

	public int getTotalCount2(Map<String, Object> map) {
		SqlSession session = MybatisUtil.getSqlSession();
		int count = 0;
		try {
			count = session.selectOne("pay.getTotalCount2", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return count;
	}

	@Override
	public List<PayVO> selectByPage2(Map<String, Object> map) {
		SqlSession session = MybatisUtil.getSqlSession();
		List<PayVO> list = null;
		
		try {
			list = session.selectList("pay.selectByPage2", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	public int getTotalCount3(Map<String, Object> map) {
		SqlSession session = MybatisUtil.getSqlSession();
		int count = 0;
		try {
			count = session.selectOne("prodstock.getTotalCount3", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return count;
	}

	@Override
	public List<ProdStockVO> selectByPage3(Map<String, Object> map) {
		SqlSession session = MybatisUtil.getSqlSession();
		List<ProdStockVO> list = null;
		
		try {
			list = session.selectList("prodstock.selectByPage3", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getTotalCount4(Map<String, Object> map) {
	
		SqlSession session = MybatisUtil.getSqlSession();
		int count = 0;
		try {
			count = session.selectOne("review.getTotalCount4", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return count;
	}

	@Override
	public List<ReviewVO> selectByPage4(Map<String, Object> map) {
		SqlSession session = MybatisUtil.getSqlSession();
		List<ReviewVO> list = null;
		
		try {
			list = session.selectList("review.selectByPage4", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getTotalCount5(Map<String, Object> map) {
		
		SqlSession session = MybatisUtil.getSqlSession();
		int count = 0;
		try {
			count = session.selectOne("notice.getTotalCount5", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return count;
	}

	@Override
	public List<NoticeVO> selectByPage5(Map<String, Object> map) {
		
		SqlSession session = MybatisUtil.getSqlSession();
		List<NoticeVO> list = null;
		
		try {
			list = session.selectList("notice.selectByPage5", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	// code check 중복 확인
	@Override
	public String codeCheck(String code) {
		SqlSession session = null;
		String res = null;
		try {
			session = MybatisUtil.getSqlSession();
			res = session.selectOne("prod.codeCheck", code);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

	@Override
	public int insertProd(ProdVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("prod.insertProd", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int updateProd(ProdVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("prod.updateProd", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int deleteProd(ProdVO vo) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("prod.deleteProd", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int deleteReview(ReviewVO vo) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("review.deleteReview", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int deletePay(PayVO vo) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("pay.deletePay", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("notice.insertNotice", vo);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("notice.updateNotice", vo);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int deleteNotice(NoticeVO vo) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("notice.deleteNotice", vo);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int insertStock(ProdStockVO vo) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("prodstock.insertStock", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		
		return cnt;
	}

	@Override
	public int updateStock(ProdStockVO vo) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("prodstock.updateStock", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		
		return cnt;
	}

	@Override
	public int deleteStock(ProdStockVO vo) {
		int cnt = 0;
		SqlSession session = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("prodstock.deleteStock", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}
}
	
	
	

