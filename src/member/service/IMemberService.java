package member.service;

import java.util.List;
import java.util.Map;

import shop.vo.CartProdVO;
import shop.vo.MemberVO;
import shop.vo.MembershipVO;
import shop.vo.PayVO;
import shop.vo.ProdVO;
import shop.vo.ReviewVO;

public interface IMemberService {
	
	//저장하기 - 회원가입
	public int insertMember(MemberVO vo);
	
	// 저장하기 - 멤버쉽쪽
	public int insertMembership(String id);
	
	public String getMem_name(String id);
	
	// 마이페이지에서 멤버십페이지 들어갈때 회원의 멤버십 유무
	public String getmembershipYN(String id);
	
	// 멤버쉽 계좌등록
	public int insertBank(MembershipVO vo);
	
	// 멤버쉽 자신의 계좌정보 가져오기
	public MembershipVO getBank(String id);
	
	// 멤버십 회원 삭제
	public int deleteMembership(String id);
	
	// 멤버십 계좌 수정
	public int updateBank(MembershipVO vo);
	
	// 리뷰에서 상품 목록 가져오기 위해서 조인보다 셀렉트를 3번 처리했다.
	public List<PayVO> getCartNo(String id);
	
	public List<CartProdVO> getProdId(int cart_no);
	
	public ProdVO getReview_Prod(String prod_id);
	
	public List<ReviewVO> getReviewed_list(Map<String, Object> map);
	
	public int insertReview(Map<String, Object> map);
	
	public String getReviewImg(String id);
	
	public int deleteReview2(int review_no);
	
	public List<ReviewVO> getProdDetailReview(String id);
	
	// CartProd테이블에서 prod_id로 Cart_no 얻기
	public int getCart_no(String prod_id);
}
