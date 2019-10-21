package com.wh.dao;

import java.util.List;

import com.wh.entity.Address;

public interface AddressDao {
	public Address findAddressbyId(Integer id);
	public List<Address> findAddress();
	public Address findAddressbyUser_id(Integer id);
	public int doUpdate_address(Address address);
	public int addAddress(Address address);
	public int deleteAddress(Address address);
	public List<Address> findAddressbyRname(Address address);
}
