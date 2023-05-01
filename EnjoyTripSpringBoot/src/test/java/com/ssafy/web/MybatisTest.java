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
public class MybatisTest {

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
		BoardDto dto = new BoardDto();
		dto.setArticleNo(4);
		dto.setContent("o");
		dto.setHit(0);
		dto.setRegisterTime("2023-05-01 10:36:22");
		dto.setSubject("1");
		dto.setUserId("admin");
		
		int cnt = session.selectOne(ns + "selectBoardCount");
		System.out.println("selectBoardCount: " + cnt + "개");
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
		dto = session.selectOne(ns + "selectBoardOne", 3);
		System.out.println("selectBoardOne: " + dto);
		System.out.println();
		
		map.clear();
		dto = new BoardDto();
		int max_id = session.selectOne(ns + "selectRowId");
		dto.setArticleNo(max_id + 1);
		dto.setContent("q");
		dto.setHit(0);
		dto.setRegisterTime("2024-02-20 14:15:08");
		dto.setSubject("2");
		dto.setUserId("ssafy");
		cnt = session.insert(ns + "boardInsert", dto);
		System.out.println(cnt + "개 삽입");
		System.out.println();
		
		map.clear();
		dto.setContent("headmeat");
		cnt = session.update(ns + "boardUpdate", dto);
		System.out.println(cnt + "개 업데이트");
		System.out.println();
		
		map.clear();
		int tmp = 5;
		dto = session.selectOne(ns + "selectBoardOne", tmp);
		System.out.println("업데이트 전 조회수: " + dto.getHit());
		cnt = session.update(ns + "updateHit", tmp);
		dto = session.selectOne(ns + "selectBoardOne", tmp);
		System.out.println("업데이트 후 조회수: " + dto.getHit());
		System.out.println();
		
		map.clear();
		List<Integer> deleteList = new ArrayList<>();
		
		deleteList.add(max_id + 1);
		
		System.out.println();
		cnt = session.delete(ns + "boardDelete", deleteList);
		System.out.println(cnt + "개 삭제 완료");
		
		map.clear();
		MemberDto memberDto = new MemberDto();
		memberDto.setUserId("icebreakers");
		memberDto.setUserPwd("1234");
		memberDto.setUserName("최재용");
		memberDto.setEmailId("headmeat@ssafy.com");
		memberDto.setJoinDate("2022-10-01 15:03:01");
		memberDto.setEmailDomain("ssafy");
		String iwantnewId = "headmeat";
		
		//cnt = session.insert(ns + "memberInsert", memberDto);
		System.out.println("멤버 삽입 성공: " + cnt);
		System.out.println();
		
		memberMap.put("userId", iwantnewId);
		memberMap.put("userPwd", memberDto.getUserPwd());
		memberMap.put("userName", memberDto.getUserName());
		memberMap.put("emailId", memberDto.getEmailId());
		memberMap.put("emailDomain", memberDto.getEmailDomain());
		memberMap.put("joinDate", memberDto.getJoinDate());
		memberMap.put("originalId", memberDto.getUserId());
		cnt = session.update(ns + "memberUpdate", memberMap);
		System.out.println("업데이트 " + ((cnt > 0)?"성공":"실패"));
	}
}