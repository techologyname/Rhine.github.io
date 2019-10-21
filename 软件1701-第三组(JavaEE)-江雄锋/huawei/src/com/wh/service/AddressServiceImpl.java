package com.wh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wh.dao.AddressDao;
import com.wh.entity.Address;
import com.wh.entity.Admin;

@Service("addressServiceImpl")
public class AddressServiceImpl implements  AddressService {

	 @Autowired
	    private AddressDao addressDao;

	    public void setAddressDao(AddressDao addressDao) {
	        this.addressDao = addressDao;
	    }

		public Address findAddressbyId(Integer id) {
			return addressDao.findAddressbyId(id);
		}

		public List<Address> findAddress() {
			return addressDao.findAddress();
		}

		public int doUpdate_address(Address address) {
			return addressDao.doUpdate_address(address);
		}

		public int addAddress(Address address) {
			return addressDao.addAddress(address);
		}

		public int deleteAddress(Address address) {
			return addressDao.deleteAddress(address);
		}

		public List<Address> findAddressbyRname(Address address) {
			return addressDao.findAddressbyRname(address);
		}

		public Address findAddressbyUser_id(Integer id) {
			return addressDao.findAddressbyUser_id(id);
		}

}
