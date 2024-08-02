package shop.service;

import java.util.List;
import java.util.Properties;


import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import shop.dao.IMemberDao;
import shop.dao.MemberDaoImpl;
import shop.vo.MemberVO;

public class MemberSeviceImpl implements IMeberService {
	private IMemberDao dao;
	private static MemberSeviceImpl service;
	
	private MemberSeviceImpl() {
		dao = MemberDaoImpl.getinstance();
	}

	public static IMeberService getInstance() {
		if (service == null)
			service = new MemberSeviceImpl();

		return service;
	}

	@Override
	public MemberVO getLoginMember(MemberVO vo) {

		return dao.getLoginMember(vo);
	}

	@Override
	public int insertMember(MemberVO vo) {
		return dao.insertMember(vo);
	}

	@Override
	public int checkedId(String memid) {
		return dao.checkedId(memid);
	}

	@Override
	public int updateMember(MemberVO vo) {
		return dao.updateMember(vo);
	}

	@Override
	public String selectId(String telno) {

		return dao.selectId(telno);
	}

	@Override
	public MemberVO selectPassword(String memid) {
		MemberVO memvo = dao.selectPassword(memid);

		return memvo;
	}

	

}
