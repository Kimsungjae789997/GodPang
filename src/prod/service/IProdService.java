package prod.service;

import java.util.List;

import shop.vo.ProdVO;

public interface IProdService {

	// 카테고리 상품 조회
	public List<ProdVO> prodList(String prod);
	
	// 전체 상품 조회 
	public List<ProdVO> prodListAll();
	
	// 상세 상품 조회
	
	 
	 
}
