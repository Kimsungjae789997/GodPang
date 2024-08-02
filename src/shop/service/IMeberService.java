package shop.service;


import shop.vo.MemberVO;

public interface IMeberService {

	//로그인 (세션등록), 아이디 기억하기 쿠키등록 
	public MemberVO getLoginMember(MemberVO vo);
	
	//회원등록 
	public int insertMember(MemberVO vo);
	
	//아이디 중복 체크 
	public int checkedId(String memid);
	
	//개인정보 수정  
	public int updateMember(MemberVO vo);
	

	//회원찾기 - 아이디   #전화번호 입력  
	public String selectId(String telno);
	
	//회원찾기 - 비밀번호  #회원(아이디 필요) 이메일로 서비스에서 - 비밀번호 전송 
	public MemberVO selectPassword(String memid);
	
}
