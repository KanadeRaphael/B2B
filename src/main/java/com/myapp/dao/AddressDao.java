package com.myapp.dao;

import com.myapp.entity.Address;

import java.util.List;

public interface AddressDao extends BaseDao<Address> {
    public List<Address> getAddress(int uid);
    public Address getAddressById(int id);
    //-------------------------------------------
    void changeDefault(int userId, int addressId);
}
