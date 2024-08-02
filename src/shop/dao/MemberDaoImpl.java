package shop.dao;

import org.apache.ibatis.session.SqlSession;
import mybatis.config.MybatisUtil;
import shop.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao {
	private static MemberDaoImpl dao;
	private MemberDaoImpl service;
	private MemberDaoImpl() {
		
	}
	public static MemberDaoImpl getinstance() {
		if(dao == null) dao = new MemberDaoImpl();
		
		return dao;
	}
	// 회원 로그인 하기 
	@Override
	public MemberVO getLoginMember(MemberVO vo) {
		MemberVO sessionVO = null;
		SqlSession session = null;
		try {
			
			session = MybatisUtil.getSqlSession();
			sessionVO = session.selectOne("member.getLoginMember", vo);

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null )session.close();
		}
		
			
		return sessionVO;
	}
	// 회원 등록하기 
	@Override
	public int insertMember(MemberVO vo) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("member.insertMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			if(session != null )session.close();
		}
		return cnt;
	}
	// 회원 아이디 체크 
	@Override
	public int checkedId(String memid) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.selectOne("member.checkedId", memid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			if(session != null )session.close();
		}
		return cnt;
	}
	// 회원 정보 수정 
	@Override
	public int updateMember(MemberVO vo) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("member.updateMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			if(session != null )session.close();
		}
		return cnt;
	}
	//회원  전화번호로 id 찾기
	@Override
	public String selectId(String telno) {
		String cnt = "";
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.selectOne("member.selectId", telno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			if(session != null )session.close();
		}
		return cnt;
	}
	
	// 회원 비밀번호 찾기 
	@Override
	public MemberVO selectPassword(String memid) {
		MemberVO vo = new MemberVO();
		
		SqlSession session = null;
		try {
			session = MybatisUtil.getSqlSession();
			vo = session.selectOne("member.selectPassword", memid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			if(session != null )session.close();
		}
		return vo;
	}
	
	

}
