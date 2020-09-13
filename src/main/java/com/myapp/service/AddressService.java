package com.myapp.service;

import com.myapp.model.AddressDto;

import java.util.List;

public interface AddressService {
    public List<AddressDto> getAddress(int uid);
    public AddressDto getAddressById(int id);
    //------------------
    void saveOrUpdate(AddressDto addressDto);
    void delete(AddressDto addressDto);
    void changeDefault(int userId, int addressId);
    List<AddressDto> findByUserId(int userId);
    String getDefault(int userId);
}
