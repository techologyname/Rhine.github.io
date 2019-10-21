package com.wh.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.wh.entity.Address;
import com.wh.entity.Commodity;
import com.wh.entity.ShoppingCart;
import com.wh.service.AddressService;
import com.wh.service.AddressServiceImpl;
import com.wh.service.CommodityService;
import com.wh.util.ShopUtils;

@Controller
public class CommodityController {
	@Resource(name = "commodityServiceImpl")
	private CommodityService commodityService;

	public void setCommodityService(CommodityService commodityService) {
		this.commodityService = commodityService;
	}

	@RequestMapping(value = "/findshopAll")
	public String findshopAll(Model model) {
		List<Commodity> c = commodityService.findshopAll();
		model.addAttribute("c", c);
		return "showlist.jsp";
	}

	@RequestMapping(value = "/findshopHuawei_Mate")
	public String findshopHuawei_Mate(Model model) {
		List<Commodity> c = commodityService.findshopHuawei_Mate();
		model.addAttribute("c", c);
		return "showlist.jsp";
	}

	@RequestMapping(value = "/findshopRongYao")
	public String findshopRongYao(Model model) {
		List<Commodity> c = commodityService.findshopRongYao();
		model.addAttribute("c", c);
		return "showlist.jsp";
	}

	@RequestMapping(value = "/findshopHuawei_P")
	public String findshopHuawei_P(Model model) {
		List<Commodity> c = commodityService.findshopHuawei_P();
		model.addAttribute("c", c);
		return "showlist.jsp";
	}

	@RequestMapping(value = "/findshopRongyao_Changwan")
	public String findshopRongyao_Changwan(Model model) {
		List<Commodity> c = commodityService.findshopRongyao_Changwan();
		model.addAttribute("c", c);
		return "showlist.jsp";
	}

	@RequestMapping(value = "/findshopHuawei_nova")
	public String findshopHuawei_nova(Model model) {
		List<Commodity> c = commodityService.findshopHuawei_nova();
		model.addAttribute("c", c);
		return "showlist.jsp";
	}

	@RequestMapping(value = "/findshopHuawei_Changxiang")
	public String findshopHuawei_Changxiang(Model model) {
		List<Commodity> c = commodityService.findshopHuawei_Changxiang();
		model.addAttribute("c", c);
		return "showlist.jsp";
	}

	@RequestMapping(value = "/findshopHuawei_maimang")
	public String findshopHuawei_maimang(Model model) {
		List<Commodity> c = commodityService.findshopHuawei_maimang();
		model.addAttribute("c", c);
		return "showlist.jsp";
	}

	@RequestMapping(value = "/findshopYidong_4G")
	public String findshopYidong_4G(Model model) {
		List<Commodity> c = commodityService.findshopYidong_4G();
		model.addAttribute("c", c);
		return "showlist.jsp";
	}

	@RequestMapping(value = "/findshopAll_admin")
	public String findshopAll_admin(Model model) {
		List<Commodity> c = commodityService.findshopAll_admin();
		model.addAttribute("c", c);
		return "admin.jsp";
	}

	// 添加商品到购物车
	@RequestMapping(value = "/addToCart")
	public String addToCart(Model model, HttpServletRequest request) {
		// 1. 获取商品的 id
		String idStr = request.getParameter("id");
		int id = -1;

		try {
			id = Integer.parseInt(idStr);
		} catch (Exception e) {

		}
		if (id > 0) {
			// 2. 获取购物车对象
			ShoppingCart sc = ShopUtils.getShoppingCart(request);

			// 3. 调用 ComputerService 的 addToCart() 方法把商品放到购物车中
			commodityService.addToCart(id, sc);
		}
		return "cart.jsp";
	}
	@RequestMapping("/commodityService")
	protected @ResponseBody String updateItemQuantity(HttpServletRequest request, HttpServletResponse response,HttpSession seesion)
			throws ServletException, IOException {
		// 4. 在 updateItemQuantity 方法中, 获取 quanity, id, 再获取购物车对象, 调用 service 的方法做修改
		Integer id = Integer.parseInt(request.getParameter("id"));
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));

		ShoppingCart sc = ShopUtils.getShoppingCart(request);
		commodityService.updateItemQuantity(sc, id, quantity);
		seesion.setAttribute("ShoppingCart", sc);
		return "yes";
	}

	@RequestMapping(value = "/remove")
	protected @ResponseBody String remove(HttpServletRequest request, HttpServletResponse response,HttpSession seesion)
			throws ServletException, IOException {
		String idStr = request.getParameter("id");

		int id = -1;
		boolean flag = false;
		try {
			id = Integer.parseInt(idStr);
		} catch (Exception e) {
		}

		ShoppingCart sc = ShopUtils.getShoppingCart(request);
		sc = commodityService.removeItemFromShoppingCart(sc, id);
		seesion.setAttribute("ShoppingCart", sc);
		if (sc.isEmpty()) {
			
			return "no";
		}
			return "yes";
	}

	@RequestMapping(value = "/clear")
	protected void clear(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ShoppingCart sCart = ShopUtils.getShoppingCart(request);
		commodityService.clearShoppingCart(sCart);
		request.getRequestDispatcher("emptycart.jsp").forward(request, response);
	}

	// 去修改
	@RequestMapping(value = "/toUpdate")
	public String toUpdate(Model model, int id) {
		Commodity c = commodityService.findshopbyId(id);
		model.addAttribute("c", c);
		return "update.jsp";
	}

	// 修改
	@RequestMapping(value = "/doUpdate")
	public String doUpdate(Model model, Commodity commodity) {
		int temp = commodityService.doUpdate(commodity);
		return "findshopAll_admin";
	}

	// 添加商品
	@RequestMapping(value = "/addCommodity")
	public String addCommodity(Model model, Commodity commodity) {
		if (commodityService.addCommodity(commodity) >= 1) {
			model.addAttribute("msg", "注册成功");
			return "findshopAll_admin";
		} else {
			model.addAttribute("msg", "注册失败");
			return "addcommodity.jsp";
		}
	}

	// 删除商品
	@RequestMapping(value = "/deleteCommodity")
	public String deleteCommodity(Model model, Commodity commodity) {
		int temp = commodityService.deleteCommodity(commodity);
		return "findshopAll_admin";
	}

	// 按类型,姓名查找
	@RequestMapping(value = "/findCommoditybyTwo")
	public String findCommoditybyTwo(Model model, Commodity commodity) {
		List<Commodity> c = commodityService.findCommoditybyTwo(commodity);
		model.addAttribute("c", c);
		return "admin.jsp";
	}

	// 提交订单
	@RequestMapping(value = "/submitOrder")
	public String submitOrder(HttpServletRequest request) {
		request.getSession(true).invalidate();
		return "index.jsp";
	}

}
