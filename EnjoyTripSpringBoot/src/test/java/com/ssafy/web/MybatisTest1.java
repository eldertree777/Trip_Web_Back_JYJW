package com.ssafy.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.assertj.core.util.Arrays;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ssafy.web.dto.BoardDto;
import com.ssafy.web.dto.MemberDto;

@SpringBootTest
public class MybatisTest1 {

	@Autowired//참조하는 Bean Container에서 일치하는 자료형이 있다면 '주입실행'!!
	private SqlSessionFactory sqlFactory;
	
	@Autowired
	private SqlSession session;
	
	//mapper namespace
	String ns = "com.ssafy.web.repository.";
	
	//ibatis의 SqlMapClient    ==  mybatis의 SqlSession
	
//	@Test
//	public void testFactory() throws Exception{
//       //SqlSessionFactory객체 테스트
//		System.out.println("sqlFactory==> "+ sqlFactory);
//	}
//	
//	@Test
//	public void testSession() throws Exception{
//		//SqlSession(MyBatis에 정의된 sql문 호출하는 객체)객체 테스트	
//		System.out.println("session==> "+ session);
//		System.out.println("Hello");
//	}	
//	@Test
//	public void testSessionList() throws Exception{
//		//SqlSession(MyBatis에 정의된 sql문 호출하는 객체)객체 테스트	
//		List<MemDTO> list = session.selectList("ssafy.member.selectList");
//		for (MemDTO m : list) {
//			System.out.println(m);
//		}
//	}
	
	@Test
	public void testDynamicSql() throws Exception{
		//SqlSession(MyBatis에 정의된 sql문 호출하는 객체)객체 테스트
		Map<String, Integer> map = new HashMap<>();
		Map<String, String> memberMap = new HashMap<>();
		//map.put("col", "num");
		//map.put("num", "111");
		MemberDto mDto = new MemberDto();
		MemberDto mDto2 = new MemberDto();
		mDto.setUserId("headmeat");
		mDto.setEmailId("headmeat");
		mDto.setEmailDomain("ssafy");
		mDto.setJoinDate("2019-11-02 18:13:55");
		mDto.setUserName("Choi");
		mDto.setUserPwd("1234");
		
		mDto2.setEmailDomain("naver.com");
		mDto2.setEmailId("eldertree777");
		mDto2.setJoinDate("2018-10-02 18:14:44");
		mDto2.setUserId("eldertree777");
		mDto2.setUserName("Hwang");
		mDto2.setUserPwd("5678");
		int cnt = session.insert(ns + "memberInsert", mDto);
		cnt += session.insert(ns + "memberInsert", mDto2);
		System.out.println("2명 중 " + cnt + "명 입력 성공");
		
		BoardDto dto = new BoardDto();
		BoardDto dto2 = new BoardDto();
		dto.setContent("o");
		dto.setHit(0);
		dto.setSubject("subject1");
		dto.setUserId("eldertree777");
		
		dto2.setContent("x");
		dto2.setHit(0);
		dto2.setSubject("subject2");
		dto2.setUserId("headmeat");
		cnt = session.insert(ns + "boardInsert", dto);
		cnt += session.insert(ns + "boardInsert", dto2);
		System.out.println("2개 중 " + cnt + "개 삽입 성공");
		
		cnt = session.selectOne(ns + "selectBoardCount");
		System.out.println("selectBoardCount: " + cnt + "개 존재");
		System.out.println();
		
		map.clear();
		map.put("start", 0);
		map.put("listsize", 2);
		List<BoardDto> list = session.selectList(ns + "selectBoardList", map);
		System.out.println("selectBoardList");
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		System.out.println();
		
		map.clear();
		int boardId = session.selectOne(ns + "selectRowId");
		dto = session.selectOne(ns + "selectBoardOne", boardId);
		System.out.println("selectBoardOne: " + dto);
		System.out.println();
		
		//수정
		map.clear();
		dto.setContent("headmeat");
		cnt = session.update(ns + "boardUpdate", dto);
		System.out.println(cnt + "개 업데이트");
		System.out.println();
		
		map.clear();
		boardId = session.selectOne(ns + "selectRowId");
		dto = session.selectOne(ns + "selectBoardOne", boardId);
		System.out.println("업데이트 전 조회수: " + dto.getHit());
		cnt = session.update(ns + "updateHit", boardId);
		dto = session.selectOne(ns + "selectBoardOne", boardId);
		System.out.println("업데이트 후 조회수: " + dto.getHit());
		System.out.println();
		
		map.clear();
		List<Integer> deleteList = new ArrayList<>();
		
		int deleteId = session.selectOne(ns + "selectRowId");
		deleteList.add(deleteId);
		
		System.out.println();
		cnt = session.delete(ns + "boardDelete", deleteList);
		System.out.println(cnt + "개 삭제 완료");
		
		map.clear();
		MemberDto memberDto = new MemberDto();
		memberDto.setUserId("headmeat");
		memberDto.setUserPwd("1234");
		memberDto.setUserName("최재용");
		memberDto.setEmailId("headmeat@ssafy.com");
		memberDto.setJoinDate("2022-10-01 15:03:01");
		memberDto.setEmailDomain("ssafy");
		String iwantnewId = "icebreakers";
		
		memberMap.put("userId", iwantnewId);
		memberMap.put("userPwd", mDto.getUserPwd());
		memberMap.put("userName", mDto.getUserName());
		memberMap.put("emailId", mDto.getEmailId());
		memberMap.put("emailDomain", mDto.getEmailDomain());
		memberMap.put("joinDate", mDto.getJoinDate());
		memberMap.put("originalId", mDto.getUserId());
		cnt = session.update(ns + "memberUpdate", memberMap);
		System.out.println("업데이트 " + ((cnt > 0)?"성공":"실패"));
		
		Map<String, String> memMap = new HashMap<>();
		memMap.put("userId", "eldertree777");
		memMap.put("userPwd", "1234");
		MemberDto mem = session.selectOne(ns + "loginMember", memMap);
		System.out.println(mem);
	}
}
