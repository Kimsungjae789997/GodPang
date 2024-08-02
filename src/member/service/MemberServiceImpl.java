package member.service;

import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import member.dao.IMemberDao;
import member.dao.MemberDaoImpl;
import shop.vo.CartProdVO;
import shop.vo.MemberVO;
import shop.vo.MembershipVO;
import shop.vo.PayVO;
import shop.vo.ProdVO;
import shop.vo.ReviewVO;


public class MemberServiceImpl implements IMemberService{

	
	//dao객체가 필요
	private IMemberDao dao;
	
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getDao();
	}
	
	
	//싱글톤을 위한 자신의 객체
	private static IMemberService service;
	
	public static IMemberService getService() {
		if(service == null) service = new MemberServiceImpl();
		
		return service;
	}
	
	//회원가입 등록
	@Override
	public int insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.insertMember(vo);
	}

	@Override
	public int insertBank(MembershipVO vo) {
		// TODO Auto-generated method stub
		return dao.insertBank(vo);
	}

	@Override
	public MembershipVO getBank(String id) {
		// TODO Auto-generated method stub
		return dao.getBank(id);
	}

	@Override
	public String getmembershipYN(String id) {
		// TODO Auto-generated method stub
		return dao.getmembershipYN(id);
	}

	@Override
	public int deleteMembership(String id) {
		// TODO Auto-generated method stub
		return dao.deleteMembership(id);
	}

	@Override
	public int insertMembership(String id) {
		// TODO Auto-generated method stub
		return dao.insertMembership(id);
	}

	@Override
	public int updateBank(MembershipVO vo) {
		// TODO Auto-generated method stub
		return dao.updateBank(vo);
	}

	@Override
	public List<PayVO> getCartNo(String id) {
		// TODO Auto-generated method stub
		return dao.getCartNo(id);
	}

	@Override
	public List<CartProdVO> getProdId(int cart_no) {
		// TODO Auto-generated method stub
		return dao.getProdId(cart_no);
	}

	@Override
	public ProdVO getReview_Prod(String prod_id) {
		// TODO Auto-generated method stub
		return dao.getReview_Prod(prod_id);
	}

	@Override
	public List<ReviewVO> getReviewed_list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getReviewed_list(map);
	}

	@Override
	public int insertReview(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertReview(map);
	}

	@Override
	public String getReviewImg(String id) {
		// TODO Auto-generated method stub
		return dao.getReviewImg(id);
	}

	@Override
	public int deleteReview2(int review_no) {
		// TODO Auto-generated method stub
		return dao.deleteReview2(review_no);
	}

	@Override
	public String getMem_name(String id) {
		
		return dao.getMem_name(id);
	}

	@Override
	public List<ReviewVO> getProdDetailReview(String id) {
		// TODO Auto-generated method stub
		return dao.getProdDetailReview(id);
	}

	@Override
	public int getCart_no(String prod_id) {
		// TODO Auto-generated method stub
		return dao.getCart_no(prod_id);
	}



}
