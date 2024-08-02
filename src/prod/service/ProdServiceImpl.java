package prod.service;

import java.util.List;
import java.util.Map;

import prod.dao.IProdDao;
import prod.dao.ProdDaoImpl;
import shop.vo.ProdVO;

public class ProdServiceImpl implements IProdService {

	private IProdDao dao;

	private static ProdServiceImpl service;

	private ProdServiceImpl() {
		dao = ProdDaoImpl.getInstance();
	}

	public static ProdServiceImpl getInstance() {
		if (service == null)
			service = new ProdServiceImpl();
  
		return service;
	}

	@Override
	public List<ProdVO> prodList(String lprod) {
		
		return dao.prodList(lprod);
	}

	@Override
	public List<ProdVO> prodListAll() {
		// TODO Auto-generated method stub
		return dao.prodListAll();
	}
}
