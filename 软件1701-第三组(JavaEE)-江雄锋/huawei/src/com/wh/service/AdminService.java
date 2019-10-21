package com.wh.service;

import java.util.List;

import com.wh.entity.Admin;

public interface AdminService {
	public int doLogin_admin(Admin admin);
	public List<Admin> findAdmin ();
	public Admin findAdminbyId(Integer id);
	public int doUpdate_admin(Admin admin);
	public int addAdmin(Admin admin);
	public int deleteAdmin(Admin admin);
	public List<Admin> findAdminbyUname(Admin admin);
}
