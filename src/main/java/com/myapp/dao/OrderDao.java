package com.myapp.dao;

import com.myapp.entity.Order;

import java.util.List;

public interface OrderDao extends BaseDao<Order> {
    public List<Order> getOrder(int gid, int uid);
}
