package com.myapp.dao;

import com.myapp.entity.ShoppingCart;

public interface ShoppingCartDao extends BaseDao<ShoppingCart> {
    public ShoppingCart getGoods(int gid, int uid, String color);
    public ShoppingCart getById(int id);
}
