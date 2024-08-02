package admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.dao.AdminDaoImpl;
import admin.dao.IAdminDao;
import shop.vo.LprodVO;
import shop.vo.NoticeVO;
import shop.vo.PageVO;
import shop.vo.PayVO;
import shop.vo.ProdStockVO;
import shop.vo.ProdVO;
import shop.vo.ReviewVO;

public class AdminServiceImpl implements IAdminService{

    private static AdminServiceImpl service;
    private IAdminDao dao;

    private AdminServiceImpl() {
        dao = AdminDaoImpl.getInstance();
    }

    public static AdminServiceImpl getInstance() {
        if(service == null) 
            service = new AdminServiceImpl();
        return service;
    }

    // 관리자 로그인
	@Override
	public String adminLogin(String code) {
		return dao.adminLogin(code);
	}

	// 상품 카테고리목록들 다 가져오기
	@Override
	public List<LprodVO> getAllLprod() {
		return dao.getAllLprod();
	}
	
	// lprod 등록
	@Override
	public int insertLprod(LprodVO vo) {
		return dao.insertLprod(vo);
	}
	
	// lprod 수정
	@Override
	public int updateLprod(LprodVO vo) {
		return dao.updateLprod(vo);
	}

	@Override
	public int deleteLprod(LprodVO vo) {
		return dao.deleteLprod(vo);
	}


	@Override
	public int getTotalCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getTotalCount(map);
	}

	@Override
	public List<ProdVO> selectByPage(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectByPage(map);
	}

	@Override
	public PageVO getPageInfo(int page, String stype, String sword) {
		PageVO pvo = new PageVO();
		
		// 전체 글 갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("sword", sword);
		int count = this.getTotalCount(map);
		
		// 전체페이지수 구하기
		
		int plist = PageVO.getPerList();
		int totalPage = (int)(Math.ceil((double)count / plist));
		
		// start, end
		// 1페이지 : 1~3 , 2페이지 : 4~6, 3페이지 : 7~9
		// 7페이지 : 19~20
		
		int start = (page-1) * plist + 1;
		int end = start + plist -1;
		
		if(end > count) end = count;
		
		// startPage, endPage
		int ppage = PageVO.getPerPage();	// 2
		int startPage = ((page-1) / ppage * ppage) + 1;
		int endPage = startPage + ppage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		pvo.setStart(start);
		pvo.setEnd(end);
		pvo.setStartPage(startPage);
		pvo.setEndPage(endPage);
		pvo.setTotalPage(totalPage);
		
		
		return pvo;
	}

	@Override
	public String getProdImg(String prod_id) {
		// TODO Auto-generated method stub
		return dao.getProdImg(prod_id);
	}

	
	
	@Override
	public int getTotalCount2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getTotalCount2(map);
	}

	@Override
	public List<PayVO> selectByPage2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectByPage2(map);
	}

	@Override
	public PageVO getPageInfo2(int page, String stype, String sword) {
		PageVO pvo = new PageVO();
		
		// 전체 글 갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("sword", sword);
		int count = this.getTotalCount(map);
		
		// 전체페이지수 구하기
		
		int plist = PageVO.getPerList();
		int totalPage = (int)(Math.ceil((double)count / plist));
		
		// start, end
		// 1페이지 : 1~3 , 2페이지 : 4~6, 3페이지 : 7~9
		// 7페이지 : 19~20
		
		int start = (page-1) * plist + 1;
		int end = start + plist -1;
		
		if(end > count) end = count;
		
		// startPage, endPage
		int ppage = PageVO.getPerPage();	// 2
		int startPage = ((page-1) / ppage * ppage) + 1;
		int endPage = startPage + ppage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		pvo.setStart(start);
		pvo.setEnd(end);
		pvo.setStartPage(startPage);
		pvo.setEndPage(endPage);
		pvo.setTotalPage(totalPage);
		
		
		return pvo;
	}

	@Override
	public int getTotalCount3(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getTotalCount3(map);
	}

	@Override
	public List<ProdStockVO> selectByPage3(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectByPage3(map);
	}

	
	@Override
	public PageVO getPageInfo3(int page, String stype, String sword) {
		PageVO pvo = new PageVO();
		
		// 전체 글 갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("sword", sword);
		int count = this.getTotalCount(map);
		
		// 전체페이지수 구하기
		
		int plist = PageVO.getPerList();
		int totalPage = (int)(Math.ceil((double)count / plist));
		
		// start, end
		// 1페이지 : 1~3 , 2페이지 : 4~6, 3페이지 : 7~9
		// 7페이지 : 19~20
		
		int start = (page-1) * plist + 1;
		int end = start + plist -1;
		
		if(end > count) end = count;
		
		// startPage, endPage
		int ppage = PageVO.getPerPage();	// 2
		int startPage = ((page-1) / ppage * ppage) + 1;
		int endPage = startPage + ppage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		pvo.setStart(start);
		pvo.setEnd(end);
		pvo.setStartPage(startPage);
		pvo.setEndPage(endPage);
		pvo.setTotalPage(totalPage);
		
		return pvo;
	}

	@Override
	public int getTotalCount4(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getTotalCount4(map);
	}

	@Override
	public List<ReviewVO> selectByPage4(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectByPage4(map);
	}

	@Override
	public PageVO getPageInfo4(int page, String stype, String sword) {
		
		PageVO pvo = new PageVO();
		
		// 전체 글 갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("sword", sword);
		int count = this.getTotalCount(map);
		
		// 전체페이지수 구하기
		
		int plist = PageVO.getPerList();
		int totalPage = (int)(Math.ceil((double)count / plist));
		
		// start, end
		// 1페이지 : 1~3 , 2페이지 : 4~6, 3페이지 : 7~9
		// 7페이지 : 19~20
		
		int start = (page-1) * plist + 1;
		int end = start + plist -1;
		
		if(end > count) end = count;
		
		// startPage, endPage
		int ppage = PageVO.getPerPage();	// 2
		int startPage = ((page-1) / ppage * ppage) + 1;
		int endPage = startPage + ppage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		pvo.setStart(start);
		pvo.setEnd(end);
		pvo.setStartPage(startPage);
		pvo.setEndPage(endPage);
		pvo.setTotalPage(totalPage);
		
		return pvo;
	}

	@Override
	public int getTotalCount5(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getTotalCount5(map);
	}

	@Override
	public List<NoticeVO> selectByPage5(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectByPage5(map);
	}

	@Override
	public PageVO getPageInfo5(int page, String stype, String sword) {
		PageVO pvo = new PageVO();
		
		// 전체 글 갯수 구하기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype", stype);
		map.put("sword", sword);
		int count = this.getTotalCount(map);
		
		// 전체페이지수 구하기
		
		int plist = PageVO.getPerList();
		int totalPage = (int)(Math.ceil((double)count / plist));
		
		// start, end
		// 1페이지 : 1~3 , 2페이지 : 4~6, 3페이지 : 7~9
		// 7페이지 : 19~20
		
		int start = (page-1) * plist + 1;
		int end = start + plist -1;
		
		if(end > count) end = count;
		
		// startPage, endPage
		int ppage = PageVO.getPerPage();	// 2
		int startPage = ((page-1) / ppage * ppage) + 1;
		int endPage = startPage + ppage - 1;
		if(endPage > totalPage) endPage = totalPage;
		
		pvo.setStart(start);
		pvo.setEnd(end);
		pvo.setStartPage(startPage);
		pvo.setEndPage(endPage);
		pvo.setTotalPage(totalPage);
		
		return pvo;
	}

	@Override
	public String codeCheck(String code) {
		// TODO Auto-generated method stub
		return dao.codeCheck(code);
	}

	@Override
	public int insertProd(ProdVO vo) {
		// TODO Auto-generated method stub
		return dao.insertProd(vo);
	}

	@Override
	public int updateProd(ProdVO vo) {
		// TODO Auto-generated method stub
		return dao.updateProd(vo);
	}

	@Override
	public int deleteProd(ProdVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteProd(vo);
	}

	@Override
	public int deleteReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteReview(vo);
	}

	@Override
	public int deletePay(PayVO vo) {
		// TODO Auto-generated method stub
		return dao.deletePay(vo);
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		// TODO Auto-generated method stub
		return dao.insertNotice(vo);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		// TODO Auto-generated method stub
		return dao.updateNotice(vo);
	}

	@Override
	public int deleteNotice(NoticeVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteNotice(vo);
	}

	@Override
	public int insertStock(ProdStockVO vo) {
		// TODO Auto-generated method stub
		return dao.insertStock(vo);
	}

	@Override
	public int updateStock(ProdStockVO vo) {
		// TODO Auto-generated method stub
		return dao.updateStock(vo);
	}

	@Override
	public int deleteStock(ProdStockVO vo) {
		// TODO Auto-generated method stub
		return dao.deleteStock(vo);
	}


}