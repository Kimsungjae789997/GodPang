package admin.service;

import java.util.List;
import java.util.Map;

import shop.vo.LprodVO;
import shop.vo.NoticeVO;
import shop.vo.PageVO;
import shop.vo.PayVO;
import shop.vo.ProdStockVO;
import shop.vo.ProdVO;
import shop.vo.ReviewVO;

public interface IAdminService {

	// 관리자 로그인
	public String adminLogin(String code);
	
	// 상품 카테고리목록들 다 가져오기
	public List<LprodVO> getAllLprod();
	
	// lprod=========================================================================
	// lprod 등록
	public int insertLprod(LprodVO vo);
	
	// lprod 수정
	public int updateLprod(LprodVO vo);
	
	// lprod 삭제
	public int deleteLprod(LprodVO vo);
	
	// prod ============================================================================
	// 전체 글 갯수 구하기
	public int getTotalCount(Map<String, Object> map);
	
	// 페이지별 리스트
	public List<ProdVO> selectByPage(Map<String, Object> map);
	
	// 페이지 정보 가져오기	
	public PageVO getPageInfo(int page, String stype, String sword );
	
	// prod_img 가져오기
	public String getProdImg(String prod_id);
	// ====================================================================================
	
	
	// pay============================================================================
	// 전체 결제현황 갯수 구하기
	public int getTotalCount2(Map<String, Object> map);
	
	// 페이지별 리스트
	public List<PayVO> selectByPage2(Map<String, Object> map);
	
	// 페이지 정보 가져오기	
	public PageVO getPageInfo2(int page, String stype, String sword );
	
	// prodStock ===================================================================================

	
	public int getTotalCount3(Map<String, Object> map);
	
	// 페이지별 리스트
	public List<ProdStockVO> selectByPage3(Map<String, Object> map);
	
	// 페이지 정보 가져오기	
	public PageVO getPageInfo3(int page, String stype, String sword );
	
	// review==================================================
	public int getTotalCount4(Map<String, Object> map);
	
	// 페이지별 리스트
	public List<ReviewVO> selectByPage4(Map<String, Object> map);
	
	// 페이지 정보 가져오기	
	public PageVO getPageInfo4(int page, String stype, String sword );
	
	//notice ========================================
	public int getTotalCount5(Map<String, Object> map);
	
	// 페이지별 리스트
	public List<NoticeVO> selectByPage5(Map<String, Object> map);
	
	// 페이지 정보 가져오기	
	public PageVO getPageInfo5(int page, String stype, String sword );
	
	
	
	//=======================================================
	// 상품등록할때 상품 코드 중복 체크
	public String codeCheck(String code);
	
	// 상품등록
	public int insertProd(ProdVO vo);
	
	// 상품수정
	public int updateProd(ProdVO vo);
	
	// 상품삭제
	public int deleteProd(ProdVO vo);
	
	
	//=================================
	// 리뷰 삭제
	public int deleteReview(ReviewVO vo);
	
	// ===============================
	// 결제 삭제
	public int deletePay(PayVO vo);
	
	// 공지사항 등록
	public int insertNotice(NoticeVO vo);
	
	// 공지사항 수정
	public int updateNotice(NoticeVO vo);
	
	// 공지 삭제
	public int deleteNotice(NoticeVO vo);
	
	// 상품재고 등록
	public int insertStock(ProdStockVO vo);
	
	// 상품재고 수정
	public int updateStock(ProdStockVO vo);
	
	// 상품제고 삭제
	public int deleteStock(ProdStockVO vo);
	
}
