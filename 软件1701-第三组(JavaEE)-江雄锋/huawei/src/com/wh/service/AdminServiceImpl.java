package com.wh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wh.dao.AdminDao;
import com.wh.entity.Admin;

@Service("adminServiceImpl")
public class AdminServiceImpl implements  AdminService {

    @Autowired
    private AdminDao adminDao;

    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

	public List<Admin> findAdmin() {
		return adminDao.findAdmin();
	}

	public Admin findAdminbyId(Integer id) {
		return adminDao.findAdminbyId(id);
	}
	
	public int doUpdate_admin(Admin admin) {
		return adminDao.doUpdate_admin(admin);
	}

	public int addAdmin(Admin admin) {
		return adminDao.addAdmin(admin);
	}

	public int deleteAdmin(Admin admin) {
		return adminDao.deleteAdmin(admin);
	}

	public List<Admin> findAdminbyUname(Admin admin) {
		return adminDao.findAdminbyUname(admin);
	}

	public int doLogin_admin(Admin admin) {
		return adminDao.doLogin_admin(admin);
	}

	

    
}
