package com.wh.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wh.entity.Admin;
import com.wh.service.AdminService;

@Controller
public class AdminController {
	@Resource(name = "adminServiceImpl")
	private AdminService adminService;

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@RequestMapping(value = "/doLogin_admin")
    public String doLogin_admin(Model model, Admin admin)  {
		
        if(adminService.doLogin_admin(admin)>=1){
            return "findAdmin";
        }
        else{
            model.addAttribute("msg","账号密码错误");
            return "admin_login.jsp";
        }
    }
	
	@RequestMapping(value = "/findAdmin")
	public String findAdmin(Model model) {
		List<Admin> a = adminService.findAdmin();
		model.addAttribute("a", a);
		return "admin_info.jsp";
	}
	
	//去修改
    @RequestMapping(value = "/toUpdate_admin")
    public String toUpdate_admin(Model model, int id)  {
    	Admin a = adminService.findAdminbyId(id);
        model.addAttribute("a",a);
        return "update_admin.jsp";
    }
    
    //修改
    @RequestMapping(value = "/doUpdate_admin")
    public String doUpdate_admin(Model model, Admin admin)  {
        int temp = adminService.doUpdate_admin(admin);
        return "findAdmin";
    }
    
    //添加管理员
    @RequestMapping(value = "/addAdmin")
    public String addCommodity(Model model, Admin admin)  {
        if(adminService.addAdmin(admin)>=1){
            model.addAttribute("msg","注册成功");
            return "findAdmin";
        }
        else{
            model.addAttribute("msg","注册失败");
            return "addadmin.jsp";
        }
    }
    
    //删除管理员
    @RequestMapping(value = "/deleteAdmin")
    public String deleteAdmin(Model model, Admin admin)  {
        int temp = adminService.deleteAdmin(admin);
        return "findAdmin";
    }
    
    //按用户名模糊查找
    @RequestMapping(value = "/findAdminbyUname")
    public String findAdminbyUname(Model model, Admin admin)  {
        List<Admin> a = adminService.findAdminbyUname(admin);
        model.addAttribute("a",a);
        return "admin_info.jsp";
    }
}
