package com.wh.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wh.entity.User;
import com.wh.service.UserService;

@Controller
public class UserController {
	@Resource(name = "userServiceImpl")
	private UserService userService;

	public void setCommodityService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/doLogin")
	public String doLogin(Model model, User user, HttpServletRequest request) {
		if (userService.doLogin(user) >= 1) {
			User u = userService.findUser_login(user);
			request.getSession().setAttribute("u", u);
			return "index.jsp";
		} else {
			model.addAttribute("msg", "账号密码错误");
			return "user_login.jsp";
		}
	}

	@RequestMapping(value = "/doRegister")
	public String doRegister(Model model, User user) {
		if (userService.doRegister(user) >= 1) {
			model.addAttribute("msg", "注册成功");
			return "user_login.jsp";
		} else {

			model.addAttribute("msg", "注册失败");
			return "register.jsp";
		}
	}

	@RequestMapping(value = "/findUser")
	public String findUser(Model model) {
		List<User> u = userService.findUser();
		model.addAttribute("u", u);
		return "user_info.jsp";
	}

	// 去修改
	@RequestMapping(value = "/toUpdate_user")
	public String toUpdate_user(Model model, int id) {
		User u = userService.findUserbyId(id);
		model.addAttribute("u", u);
		return "update_user.jsp";
	}

	// 修改
	@RequestMapping(value = "/doUpdate_user")
	public String doUpdate_user(Model model, User user) {
		int temp = userService.doUpdate_user(user);
		return "findUser";
	}

	// 添加用户
	@RequestMapping(value = "/addUser")
	public String addUser(Model model, User user) {
		if (userService.addUser(user) >= 1) {
			model.addAttribute("msg", "注册成功");
			return "findUser";
		} else {
			model.addAttribute("msg", "注册失败");
			return "adduser.jsp";
		}
	}

	// 删除用户
	@RequestMapping(value = "/deleteUser")
	public String deleteUser(Model model, User user) {
		int temp = userService.deleteUser(user);
		return "findUser";
	}

	// 按用户名模糊查找
	@RequestMapping(value = "/findUserbyUname")
	public String findUserbyUname(Model model, User user) {
		List<User> u = userService.findUserbyUname(user);
		model.addAttribute("u", u);
		return "user_info.jsp";
	}

	// 退出(清理session)
	@RequestMapping(value = "/Quit")
	public String Quit(HttpServletRequest request) {
		request.getSession(true).invalidate();
		return "index.jsp";
	}
}
