package shop.service;

import java.util.List;

import shop.vo.ReviewVO;

public interface IShopService {

	// 상세상품 리뷰 가져오기
	public List<ReviewVO> getProdDetailReview();
}
