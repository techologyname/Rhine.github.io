package com.wh.dao;

import java.util.List;

import com.wh.entity.User;

public interface UserDao {
	 public int doRegister(User user);
	 public int doLogin(User user);
	 public User findUserbyId(Integer id);
	 public List<User> findUser();
	 public int doUpdate_user(User user);
	 public int addUser(User user);
	 public int deleteUser(User user);
	 public List<User> findUserbyUname(User user);
	 public User findUser_login(User user);
}
