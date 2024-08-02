package shop.dao;

import shop.vo.MemberVO;

public interface IMemberDao {
	
	//로그인 (세션등록), 아이디 기억하기 쿠키등록 
	public MemberVO getLoginMember(MemberVO vo);
	
	//회원등록 
	public int insertMember(MemberVO vo);
	
	//아이디 중복 체크 
	public int checkedId(String memid);
	
	//업데이트 
	public int updateMember(MemberVO vo);
	

	//회원찾기 - 아이디   #전화번호   // 함
	public String selectId(String telno);
	
	//회원찾기 - 비밀번호 // 메일전송  // 함 
	public MemberVO selectPassword(String memid);
	
	
	
	
}
	
