package com.wh.dao;

import java.util.List;

import com.wh.entity.Commodity;

public interface CommodityDao {
		public List<Commodity> findshopAll ();
		public List<Commodity> findshopAll_admin ();
		public Commodity findshopbyId(Integer id);
		public int doUpdate(Commodity commodity);
		public int addCommodity(Commodity commodity);
		public int deleteCommodity(Commodity commodity);
		public List<Commodity> findCommoditybyTwo(Commodity commodity);
		public List<Commodity> findshopHuawei_Mate();
		public List<Commodity> findshopRongYao();
		public List<Commodity> findshopHuawei_P();
		public List<Commodity> findshopRongyao_Changwan();
		public List<Commodity> findshopHuawei_nova();
		public List<Commodity> findshopHuawei_Changxiang();
		public List<Commodity> findshopHuawei_maimang();
		public List<Commodity> findshopYidong_4G();
}