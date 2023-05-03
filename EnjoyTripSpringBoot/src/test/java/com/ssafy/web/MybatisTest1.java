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
import com.ssafy.web.dto.UserDto;

@SpringBootTest
public class MybatisTest1 {

	@Autowired//참조하는 Bean Container에서 일치하는 자료형이 있다면 '주입실행'!!
	private SqlSessionFactory sqlFactory;
	
	@Autowired
	private SqlSession session;
	
	//mapper namespace
	String ns = "com.ssafy.web.repository.BoardRepository.";
	
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
//		List<MemDTO> list = session.selectList("ssafy.user.selectList");
//		for (MemDTO m : list) {
//			System.out.println(m);
//		}
//	}
	
	@Test
	public void testDynamicSql() throws Exception{
		//SqlSession(MyBatis에 정의된 sql문 호출하는 객체)객체 테스트
		Map<String, Integer> map = new HashMap<>();
		Map<String, String> userMap = new HashMap<>();
		//map.put("col", "num");
		//map.put("num", "111");
		UserDto mDto = new UserDto();
		UserDto mDto2 = new UserDto();
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
		session.delete(ns + "userDelete", mDto.getUserId());
		session.delete(ns + "userDelete", mDto2.getUserId());
		int cnt = session.insert(ns + "userInsert", mDto);
		cnt += session.insert(ns + "userInsert", mDto2);
		System.out.println("2명 중 " + cnt + "명 입력 성공");
		
		/*
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
		
		System.out.println();*/
		
		/*
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
		*/
		
//		map.clear();
//		UserDto userDto = new UserDto();
//		userDto.setUserId("headmeat");
//		userDto.setUserPwd("1234");
//		userDto.setUserName("최재용");
//		userDto.setEmailId("headmeat@ssafy.com");
//		userDto.setJoinDate("2022-10-01 15:03:01");
//		userDto.setEmailDomain("ssafy");
//		String iwantnewId = "icebreakers";
//		
//		userMap.put("userId", iwantnewId);
//		userMap.put("userPwd", mDto.getUserPwd());
//		userMap.put("userName", mDto.getUserName());
//		userMap.put("emailId", mDto.getEmailId());
//		userMap.put("emailDomain", mDto.getEmailDomain());
//		userMap.put("joinDate", mDto.getJoinDate());
//		userMap.put("originalId", mDto.getUserId());
//		cnt = session.update(ns + "userUpdate", userMap);
//		System.out.println("업데이트 " + ((cnt > 0)?"성공":"실패"));
		
		Map<String, String> memMap = new HashMap<>();
		memMap.put("userId", "eldertree777");
		memMap.put("userPwd", "5678");
		UserDto mem = session.selectOne(ns + "loginUser", memMap);
		System.out.println("loginUser: " + mem);
		System.out.println();
		
		memMap.put("userPwd", "456789");
		cnt = session.update(ns + "userUpdate", memMap);
		System.out.println("[userUpdate]");
		System.out.println(cnt + "명 업데이트 완료");
	}
}