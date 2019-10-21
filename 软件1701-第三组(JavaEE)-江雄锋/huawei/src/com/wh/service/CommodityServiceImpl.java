package com.wh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wh.dao.CommodityDao;
import com.wh.entity.Commodity;
import com.wh.entity.ShoppingCart;

@Service("commodityServiceImpl")
public class CommodityServiceImpl implements  CommodityService {

    @Autowired
    private CommodityDao commodityDao;
    
    public void CommodityDao(CommodityDao commodityDao) {
        this.commodityDao = commodityDao;
    }
    
	public List<Commodity> findshopAll() {
		return commodityDao.findshopAll();
	}
	
	public List<Commodity> findshopAll_admin() {
		return commodityDao.findshopAll_admin();
	}
	
	public boolean addToCart(Integer id, ShoppingCart sc) {
		Commodity c = commodityDao.findshopbyId(id);
		if (c != null) {
			sc.addCommodity(c);
			return true;
		}
		return false;
	}
	public Commodity findshopbyId(Integer id) {
		return commodityDao.findshopbyId(id);
	}

	public ShoppingCart updateItemQuantity(ShoppingCart sc, Integer id, Integer quantity) {
		sc.updateItemQuantity(id, quantity);
		return sc;
	}

	public ShoppingCart removeItemFromShoppingCart(ShoppingCart sc, Integer id) {
		sc.removeItem(id);
		return sc;
	}

	public void clearShoppingCart(ShoppingCart sCart) {
		sCart.clear();
	}

	public int doUpdate(Commodity commodity) {
		return commodityDao.doUpdate(commodity);
	}

	public int addCommodity(Commodity commodity) {
		return commodityDao.addCommodity(commodity);
	}

	public int deleteCommodity(Commodity commodity) {
		return commodityDao.deleteCommodity(commodity);
	}

	public List<Commodity> findCommoditybyTwo(Commodity commodity) {
		return commodityDao.findCommoditybyTwo(commodity);
	}

	@Override
	public List<Commodity> findshopHuawei_Mate() {
		return commodityDao.findshopHuawei_Mate();
	}

	@Override
	public List<Commodity> findshopRongYao() {
		return commodityDao.findshopRongYao();
	}

	@Override
	public List<Commodity> findshopHuawei_P() {
		return commodityDao.findshopHuawei_P();
	}

	@Override
	public List<Commodity> findshopRongyao_Changwan() {
		return commodityDao.findshopRongyao_Changwan();
	}

	@Override
	public List<Commodity> findshopHuawei_nova() {
		return commodityDao.findshopHuawei_nova();
	}

	@Override
	public List<Commodity> findshopHuawei_Changxiang() {
		return commodityDao.findshopHuawei_Changxiang();
	}

	@Override
	public List<Commodity> findshopHuawei_maimang() {
		return commodityDao.findshopHuawei_maimang();
	}

	@Override
	public List<Commodity> findshopYidong_4G() {
		return commodityDao.findshopYidong_4G();
	}

}
