package com.wh.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wh.entity.Address;
import com.wh.service.AddressService;

@Controller
public class AddressController {
	@Resource(name = "addressServiceImpl")
	private AddressService addressService;

	public void AddressService(AddressService addressService) {
		this.addressService = addressService;
	}

	@RequestMapping(value = "/findAddress")
	public String findAdmin(Model model) {
		List<Address> a = addressService.findAddress();
		model.addAttribute("a", a);
		return "address_info.jsp";
	}
	
	// 去修改
	@RequestMapping(value = "/toUpdate_address")
	public String toUpdate_address(Model model, int id) {
		Address a = addressService.findAddressbyId(id);
		model.addAttribute("a", a);
		return "update_address.jsp";
	}

	// 修改
	@RequestMapping(value = "/doUpdate_address_admin")
	public String doUpdate_address_admin(Model model, Address address,HttpServletRequest request) {
		addressService.doUpdate_address(address);
		return "findAddress";
	}
	// 修改
		@RequestMapping(value = "/doUpdate_address")
		public String doUpdate_address(Model model, Address address,HttpServletRequest request) {
			addressService.doUpdate_address(address);
			String id=request.getParameter("user_id");
			return "toAccount?id="+id;
		}

	// 添加地址
	@RequestMapping(value = "/addAddress")
	public String addAddress(Model model, Address address,HttpServletRequest request) {
		String id=request.getParameter("user_id");
		if (addressService.addAddress(address) >= 1) {
			model.addAttribute("msg", "注册成功");
			return "toAccount?id="+id;
		} else {
			model.addAttribute("msg", "注册失败");
			return "toAccount?id="+id;
		}
	}

	// 删除地址
	@RequestMapping(value = "/deleteAddress")
	public String deleteAddress(Model model, Address address,HttpServletRequest request) {
		String id=request.getParameter("user_id");
		int temp = addressService.deleteAddress(address);
		return "toAccount?id="+id;
	}
	
	@RequestMapping(value = "/deleteAddress_admin")
	public String deleteAddress_admin(Model model, Address address,HttpServletRequest request) {
		String id=request.getParameter("user_id");
		int temp = addressService.deleteAddress(address);
		return "findAddress";
	}
	// 按用户名模糊查找
	@RequestMapping(value = "/findAddressbyRname")
	public String findAddressbyRname(Model model, Address address) {
		List<Address> a = addressService.findAddressbyRname(address);
		model.addAttribute("a", a);
		return "address_info.jsp";
	}
	
	// 跳转确认订单页
	@RequestMapping(value = "/toAccount")
	public String toAccount(Model model, int id) {
		Address a = addressService.findAddressbyUser_id(id);
		model.addAttribute("a", a);
		return "account.jsp";
	}
}
