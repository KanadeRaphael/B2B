package com.myapp.dao.impl;

import com.myapp.dao.OrderDao;
import com.myapp.entity.Order;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDaoImpl extends BaseDaoImpl<Order> implements OrderDao {
    @Override
    public List<Order> getOrder(int gid, int uid) {
        Query q = getCurrentSession().createQuery("FROM OrderDetail od WHERE od.order.user.id=:uid and od.goods.id=:gid"); //查询有米有买过改商品
        q.setParameter("uid", uid);
        q.setParameter("gid", gid);
        return q.list();
    }
}
