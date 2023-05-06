package com.ssafy.web.repository;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ssafy.web.dto.UserDto;

@Repository("UserRepositoryImpl")
public class UserRepositoryImpl implements UserRepository {
	@Autowired
	SqlSession session;
	
	String ns = "com.ssafy.web.repository.UserRepository.";
	
	//중복 방지
	@Override
	public int idCheck(String userId) throws SQLException {
		// TODO Auto-generated method stub
		return session.selectOne(ns + "id");
	}

	@Override
	public int joinMember(UserDto userDto) throws SQLException {
		// TODO Auto-generated method stub
		System.out.println(userDto);
		return session.selectOne(ns + "userInsert", userDto);
	}

	@Override
	public UserDto loginUser(String userId, String userPwd) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("userPwd", userPwd);
		
		return session.selectOne(ns + "loginUser", map);
	}

	@Override
	public int update(String userId, String userPwd) throws SQLException {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<>();
		map.put("userPwd", userPwd);
		map.put("userId", userId);
		return session.update(ns + "userUpdate", map);
	}

	@Override
	public int delete(String userId) throws SQLException {
		// TODO Auto-generated method stub
		return session.delete(ns + "userDelete", userId);
	}
}