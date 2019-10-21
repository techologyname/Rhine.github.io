package com.wh.entity;

import com.wh.entity.Commodity;

/**
 * 封装了购物车中的商品, 包含对商品的引用以及购物车中该商品的数量
 *
 */
public class ShoppingCartItem {

	private Commodity commodity;
	private int quantity;
	
	public ShoppingCartItem(Commodity commodity) {
		this.commodity = commodity;
		this.quantity = 1;
	}
	
	public Commodity getCommodity() {
		return commodity;
	}
	
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	/**
	 * 返回该商品在购物车中的钱
	 * 
	 */
	public float getItemMoney(){
		return commodity.getPrice() * quantity;
	}
	
	/**
	 * 使商品数量 + 1
	 */
	public void increment(){
		quantity++;
	}
	
	
}
