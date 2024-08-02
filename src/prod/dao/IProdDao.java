package prod.dao;

import java.util.List;

import shop.vo.ProdVO;

public interface IProdDao {
	public List<ProdVO> prodList(String lrodgu);
	public List<ProdVO> prodListAll();
}
  