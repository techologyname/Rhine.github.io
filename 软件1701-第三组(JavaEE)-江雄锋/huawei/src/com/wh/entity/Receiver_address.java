package com.wh.entity;

public class Receiver_address {
	private Integer id;
    private Integer user_id;
    private String receive_name;
    private String three_address;
    private String other_address;
    private Integer tel;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getReceive_name() {
		return receive_name;
	}
	public void setReceive_name(String receive_name) {
		this.receive_name = receive_name;
	}
	public String getThree_address() {
		return three_address;
	}
	public void setThree_address(String three_address) {
		this.three_address = three_address;
	}
	public String getOther_address() {
		return other_address;
	}
	public void setOther_address(String other_address) {
		this.other_address = other_address;
	}
	public Integer getTel() {
		return tel;
	}
	public void setTel(Integer tel) {
		this.tel = tel;
	}
	
}
