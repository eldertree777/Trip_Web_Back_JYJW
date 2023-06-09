package com.ssafy.member.model.service;

import org.springframework.security.crypto.bcrypt.BCrypt;

import com.ssafy.member.model.MemberDto;
import com.ssafy.member.model.dao.MemberDao;
import com.ssafy.member.model.dao.MemberDaoImpl;

public class MemberServiceImpl implements MemberService {

	private static MemberService memberService = new MemberServiceImpl();
	private MemberDao memberDao;

	private MemberServiceImpl() {
		memberDao = MemberDaoImpl.getMemberDao();
	}

	public static MemberService getMemberService() {
		return memberService;
	}

	@Override
	public int idCheck(String userId) throws Exception {
		return memberDao.idCheck(userId);
	}

	@Override
	public int joinMember(MemberDto memberDto) throws Exception {
		memberDto.setUserPwd(BCrypt.hashpw(memberDto.getUserPwd(), BCrypt.gensalt()));
		System.out.println(memberDto.getUserPwd() + " " + memberDto.getUserPwd().length());
		return memberDao.joinMember(memberDto);
	}

	@Override
	public MemberDto loginMember(String userId, String userPwd) throws Exception {
//		userPwd = BCrypt.hashpw(userPwd, BCrypt.gensalt());
//		System.out.println(userPwd);
		MemberDto Member = memberDao.loginMember(userId, userPwd);
		try {
			if (BCrypt.checkpw(userPwd, Member.getUserPwd())) {
				return Member;
			}
			
			return (new MemberDto());
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public int update(String userId, String userPwd) throws Exception {
		// TODO Auto-generated method stub
		userPwd = BCrypt.hashpw(userPwd, BCrypt.gensalt());
		return memberDao.update(userId, userPwd);
	}

	@Override
	public int delete(String userId) throws Exception {
		// TODO Auto-generated method stub
		return memberDao.delete(userId);
	}

}
