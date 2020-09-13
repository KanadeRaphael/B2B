package com.myapp.service.impl;

import com.myapp.dao.AddressDao;
import com.myapp.dao.UserDao;
import com.myapp.entity.Address;
import com.myapp.entity.User;
import com.myapp.model.AddressDto;
import com.myapp.service.AddressService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class AddressServiceImpl implements AddressService {
    @Autowired
    UserDao userDao;
    @Autowired
    AddressDao addressDao;
    @Override
    public List<AddressDto> getAddress(int uid) {
        List<Address> goods = addressDao.getAddress(uid);
        List<AddressDto> alist = new ArrayList<AddressDto>();
        if (goods != null) {
            for (Address a : goods) {
                AddressDto aa = new AddressDto();
                BeanUtils.copyProperties(a, aa);
                aa.setUserId(a.getId());
                alist.add(aa);
            }
        }
        return alist;
    }

    @Override
    public AddressDto getAddressById(int id) {
        Address a = addressDao.getAddressById(id);
        AddressDto ad = new AddressDto();
        if (a != null) {
            BeanUtils.copyProperties(a, ad);
            ad.setUserId(a.getId());
        }
        return ad;
    }
//--------------------------

    @Override
    public void saveOrUpdate(AddressDto addressDto) {
        Address address = d2e(addressDto);
        addressDao.saveOrUpdate(address);
    }

    @Override
    public void delete(AddressDto addressDto) {
        addressDao.delete(addressDao.get(Address.class, addressDto.getId()));
    }

    @Override
    public void changeDefault(int userId, int addressId) {
        addressDao.changeDefault(userId, addressId);
    }

    @Override
    public List<AddressDto> findByUserId(int userId) {
        String hql = "FROM Address WHERE user.id=:userId ORDER BY type ASC";
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        List<Address> addresses = addressDao.find(hql, params);
        return e2dList(addresses);
    }

    @Override
    public String getDefault(int userId) {
        Address address = addressDao.get("FROM Address WHERE type=0 AND user_id="+userId);
        String defaultOrder = null;
        if(address!=null){
            defaultOrder = address.getProvince()+address.getCity()+address.getDetail();
        }
        return defaultOrder;
    }

    private Address d2e(AddressDto addressDto) {
        Address address = new Address();
        BeanUtils.copyProperties(addressDto, address);
        User user = userDao.get(User.class, addressDto.getUserId());
        address.setUser(user);
        return address;
    }

    private AddressDto e2d(Address address) {
        AddressDto addressDto = new AddressDto();
        BeanUtils.copyProperties(address, addressDto);
        addressDto.setUserId(address.getUser().getId());
        return addressDto;
    }

    private List<AddressDto> e2dList(List<Address> addresses) {
        List<AddressDto> addressDtos = new ArrayList<>();
        if (addresses != null && addresses.size() > 0) {
            for (Address a : addresses) {
                AddressDto addressDto = e2d(a);
                addressDtos.add(addressDto);
            }
        }
        return addressDtos;
    }
}
