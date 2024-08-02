package member.dao;

import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.sun.xml.internal.ws.encoding.MtomCodec;

import mybatis.config.MybatisUtil;
import shop.vo.CartProdVO;
import shop.vo.MemberVO;
import shop.vo.MembershipVO;
import shop.vo.PayVO;
import shop.vo.ProdVO;
import shop.vo.ReviewVO;;



public class MemberDaoImpl implements IMemberDao {
  // mybatis를 실행하기 위한 sqlSesstion이 필요
  // sqlSesstion을 SqlSesstionFactory에서 만든다
  // SqlSesstionFactory는 mybatis-config.xml을 가지고 만든다.
	
	//싱글톤을 위한 자신의 객체를 생성하고 리턴하는 메소드
	private static IMemberDao dao;
	
	private MemberDaoImpl() {
		
	}
	
	public static IMemberDao getDao() {
		if(dao == null) dao = new MemberDaoImpl();
		
		return dao;
	}
	
	
	

	//회원가입 등록
	public int insertMember(MemberVO vo) {
		SqlSession session = MybatisUtil.getSqlSession();
		
		int res = 0;
		try {
			res = session.insert("member.insertMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return res;
		
	}
	

	//회원의 정보 가져오기 mem_id=user1
	@Override
	public MemberVO getMemberOne(String mem_id) {
		SqlSession session = MybatisUtil.getSqlSession();
		MemberVO memberVO;
		
		int res = 0;
		try {
			memberVO = session.selectOne("member.getMemberOne",mem_id);
		} catch (Exception e) {
			return null;
		}finally {
			session.close();
		}
		return memberVO;
	}
	
	//마이페이지 수정하기 
	@Override
	public int updateMyMember(MemberVO vo) {
		SqlSession session = MybatisUtil.getSqlSession();
		
		int res = 0;
		try {
			res = session.update("member.updateMyMember",vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return res;
	}

	@Override
	public int insertBank(MembershipVO vo) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			System.out.println("session : " + session);
			cnt = session.update("membership.insertBank", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public MembershipVO getBank(String id) {
		SqlSession session = null;
		MembershipVO vo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			vo = session.selectOne("membership.getBank",id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return vo;
	}

	@Override
	public String getmembershipYN(String id) {
		SqlSession session = null;
		String res = null;
		try {
			session = MybatisUtil.getSqlSession();
			res = session.selectOne("membership.getmembershipYN", id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

	@Override
	public int deleteMembership(String id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("membership.deleteMembership", id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertMembership(String id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("membership.insertMembership", id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public int updateBank(MembershipVO vo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("membership.updateBank", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public List<PayVO> getCartNo(String id) {
		SqlSession session = null;
		List<PayVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("pay.getCartNo", id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public List<CartProdVO> getProdId(int cart_no) {
		SqlSession session = null;
		List<CartProdVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("cartprod.getProdId",cart_no);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	@Override
	public ProdVO getReview_Prod(String prod_id) {
		SqlSession session = null;
		ProdVO vo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			vo = session.selectOne("prod.getReview_Prod",prod_id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return vo;
	}

	@Override
	public List<ReviewVO> getReviewed_list(Map<String, Object> map) {
		SqlSession session = null;
		List<ReviewVO> vo = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			vo = session.selectList("review.getReviewed_list", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return vo;
	}

	@Override
	public int insertReview(Map<String, Object> map) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("review.insertReview", map);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public String getReviewImg(String id) {
		SqlSession session = null;
		String review_img = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			review_img = session.selectOne("review.getReviewImg", id);
			
		} catch (Exception e) {
			session.close();
		}
		return review_img;
	}

	@Override
	public int deleteReview2(int review_no) {
		SqlSession session = null;
		int cnt = 0;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("review.deleteReview2", review_no);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		return cnt;
	}

	@Override
	public String getMem_name(String id) {
		SqlSession session = null;
		String res = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			res = session.selectOne("member.getMem_name", id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}

	@Override
	public List<ReviewVO> getProdDetailReview(String id) {
		SqlSession session = null;
		List<ReviewVO> list = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			list = session.selectList("review.getProdDetailReview", id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
	}

	@Override
	public int getCart_no(String prod_id) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.selectOne("cartprod.getCart_no", prod_id);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		
		return cnt;
	}

}
