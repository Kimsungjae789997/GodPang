package shop.dao;

import java.util.List;

import shop.vo.ReviewVO;

public interface IShopDao {

	// 상세상품 리뷰 가져오기
	public List<ReviewVO> getProdDetailReview();
}
