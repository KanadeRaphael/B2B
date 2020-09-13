package com.myapp.service;

import com.myapp.entity.ShoppingCart;
import com.myapp.model.CartDTO;
import com.myapp.model.TempCartDTO;

import java.util.List;

public interface CartService {
    public void saveCart(ShoppingCart sc, int uid, int gid);
    public CartDTO sortCart(TempCartDTO tcd);
    public List<CartDTO> sortCart(int[] cart_id);
//    public ShoppingCart getById();
}
