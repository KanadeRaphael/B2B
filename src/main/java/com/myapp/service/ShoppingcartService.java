package com.myapp.service;

import com.myapp.model.ShoppingCartDto;
import com.myapp.model.UserDto;

import java.util.List;

public interface ShoppingcartService {
    List<ShoppingCartDto> getShoppingcart(UserDto userDto);
    List<ShoppingCartDto> saveShoppingcart(String str, Integer userId);
    void updateJianshao(String number, ShoppingCartDto shoppingCartDto);
    void updateZengjia(String number, ShoppingCartDto shoppingCartDto);
    void deleteShoppingcart(ShoppingCartDto shoppingCartDto);
    void deleteShoppingcartAll(UserDto userDto);
}
