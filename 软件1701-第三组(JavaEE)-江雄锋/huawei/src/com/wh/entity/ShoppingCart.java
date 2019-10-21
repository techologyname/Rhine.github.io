package com.wh.entity;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.wh.entity.Commodity;
import com.wh.entity.ShoppingCartItem;

public class ShoppingCart {
	
	private Map<Integer, ShoppingCartItem> commoditys = new HashMap<>();
	
	/**
	 * 修改指定购物项的数量
	 */
	public void updateItemQuantity(Integer id, int quantity){
		ShoppingCartItem sci =commoditys.get(id);
		if(sci != null){
			sci.setQuantity(quantity);
		}
	}
	
	/**
	 * 移除指定的购物项
	 * @param id
	 */
	public void removeItem(Integer id){
		commoditys.remove(id);
	}
	
	/**
	 * 清空购物车
	 */
	public void clear(){
		commoditys.clear();
	}
	
	/**
	 * 返回购物车是否为空
	 * @return
	 */
	public boolean isEmpty(){
		return commoditys.isEmpty();
	}
	
	/**
	 * 获取购物车中所有的商品的总的钱数
	 * @return
	 */
	public float getTotalMoney(){
		float total = 0;
		
		for(ShoppingCartItem sci: getItems()){
			total += sci.getItemMoney();
		}
		
		return total;
	}
	
	/**
	 * 获取购物车中的所有的 ShoppingCartItem 组成的集合
	 * @return
	 */
	public Collection<ShoppingCartItem> getItems(){
		return commoditys.values();
	}
	
	/**
	 * 返回购物车中商品的总数量
	 * @return
	 */
	public int getCommodityNumber(){
		int total = 0;
		
		for(ShoppingCartItem sci: commoditys.values()){
			total += sci.getQuantity();
		}
		
		return total;
	}
	
	public Map<Integer, ShoppingCartItem> getCommoditys() {
		return commoditys;
	}
	
	/**
	 * 检验购物车中是否有 id 指定的商品		
	 * @param id
	 * @return
	 */
	public boolean hasCommodity(Integer id){
		return commoditys.containsKey(id);
	}		
			
	/**
	 * 向购物车中添加一件商品	
	 * @param commodity
	 */
	public void addCommodity(Commodity commodity){
		//1. 检查购物车中有没有该商品, 若有, 则使其数量 +1, 若没有, 
				//新创建其对应的 ShoppingCartItem, 并把其加入到 commoditys 中
		ShoppingCartItem sci = commoditys.get(commodity.getId());
		
		if(sci == null){
			sci = new ShoppingCartItem(commodity);
			commoditys.put(commodity.getId(), sci);
		}else{
			sci.increment();
		}
	}
}
