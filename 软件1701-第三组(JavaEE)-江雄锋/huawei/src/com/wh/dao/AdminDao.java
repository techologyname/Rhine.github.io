package com.wh.dao;

import java.util.List;

import org.springframework.ui.Model;

import com.wh.entity.Admin;

public interface AdminDao {
	public int doLogin_admin(Admin admin);
	public Admin findAdminbyId(Integer id);
	public List<Admin> findAdmin();
	public int doUpdate_admin(Admin admin);
	public int addAdmin(Admin admin);
	public int deleteAdmin(Admin admin);
	public List<Admin> findAdminbyUname(Admin admin);
}
