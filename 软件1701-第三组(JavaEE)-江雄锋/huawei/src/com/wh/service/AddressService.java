package com.wh.service;

import java.util.List;

import com.wh.entity.Address;
import com.wh.entity.Admin;

public interface AddressService {
	public Address findAddressbyId(Integer id);
	public List<Address> findAddress();
	public int doUpdate_address(Address address);
	public int addAddress(Address address);
	public int deleteAddress(Address address);
	public List<Address> findAddressbyRname(Address address);
	public Address findAddressbyUser_id(Integer id);
}
