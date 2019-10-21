package com.wh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wh.dao.UserDao;
import com.wh.entity.User;

@Service("userServiceImpl")
public class UserServiceImpl implements  UserService {

    @Autowired
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

	public User findUserbyId(Integer id) {
		return userDao.findUserbyId(id);
	}

	public List<User> findUser() {
		return userDao.findUser();
	}

	public int doUpdate_user(User user) {
		return userDao.doUpdate_user(user);
	}

	public int addUser(User user) {
		return userDao.addUser(user);
	}

	public List<User> findUserbyUname(User user) {
		return userDao.findUserbyUname(user);
	}

	public int deleteUser(User user) {
		return userDao.deleteUser(user);
	}

	@Override
	public int doLogin(User user) {
		return userDao.doLogin(user);
	}

	@Override
	public User findUser_login(User user) {
		return userDao.findUser_login(user);
	}

	@Override
	public int doRegister(User user) {
		return userDao.doRegister(user);
	}
    
    
}
