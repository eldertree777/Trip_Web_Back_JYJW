package com.ssafy.web.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.web.dto.UserDto;
import com.ssafy.web.repository.UserRepository;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService {
	@Autowired
	@Qualifier("UserRepositoryImpl")
	UserRepository repo;
	
	@Override
	
	public int idCheck(String userId) throws SQLException {
		// TODO Auto-generated method stub
		return repo.idCheck(userId);
	}

	@Override
	@Transactional
	public int joinUser(UserDto userDto) throws SQLException {
		// TODO Auto-generated method stub
		return repo.joinMember(userDto);
	}

	@Override
	public UserDto loginUser(String userId, String userPwd) throws SQLException {
		// TODO Auto-generated method stub
		return repo.loginUser(userId, userPwd);
	}

	@Override
	@Transactional
	public int update(String userId, String userPwd) throws SQLException {
		// TODO Auto-generated method stub
		return repo.update(userId, userPwd);
	}

	@Override
	@Transactional
	public int delete(String userId) throws SQLException {
		// TODO Auto-generated method stub
		return repo.delete(userId);
	}
}