package com.ssafy.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ssafy.web.dto.MemberDto;
import com.ssafy.web.repository.MemberRepository;
import com.ssafy.web.repository.MemberRepositoryImpl;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {
	@Autowired
	@Qualifier("MemberRepositoryImpl")
	MemberRepository repo;
	
	@Override
	public int idCheck(String userId) throws Exception {
		return repo.idCheck(userId);
	}

	@Override
	public int joinMember(MemberDto memberDto) throws Exception {
//		memberDto.setUserPwd(BCrypt.hashpw(memberDto.getUserPwd(), BCrypt.gensalt()));
		//memberDto.setUserPwd(memberDto.getUserPwd());
		//System.out.println(memberDto.getUserPwd() + " " + memberDto.getUserPwd().length());
		//return memberDao.joinMember(memberDto);
		return repo.joinMember(memberDto);
	}

	@Override
	public MemberDto loginMember(String userId, String userPwd) throws Exception {
		/* userPwd = BCrypt.hashpw(userPwd, BCrypt.gensalt()); */
//		System.out.println(userPwd);
//		MemberDto Member = memberDao.loginMember(userId, userPwd);
//		
//		try {
//			if (userPwd.equals(Member.getUserPwd())) {
//				return Member;
//			}
//			
//			return (new MemberDto());
//		} catch (Exception e) {
//			return null;
//		}
		
		return repo.loginMember(userId, userPwd);
	}

	@Override
	public int update(String userId, String userPwd) throws Exception {
		// TODO Auto-generated method stub
		/* userPwd = BCrypt.hashpw(userPwd, BCrypt.gensalt()); */
		//return memberDao.update(userId, userPwd);
		return repo.update(userId, userPwd);
	}

	@Override
	public int delete(String userId) throws Exception {
		// TODO Auto-generated method stub
		return repo.delete(userId);
	}
}
