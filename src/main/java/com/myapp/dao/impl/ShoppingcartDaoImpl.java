package com.myapp.dao.impl;

import com.myapp.dao.ShoppingCartDao;
import com.myapp.entity.ShoppingCart;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

@Repository
public class ShoppingcartDaoImpl extends BaseDaoImpl<ShoppingCart> implements ShoppingCartDao {
    @Override
    public ShoppingCart getGoods(int gid, int uid, String color) {
        Query q = getCurrentSession().createQuery("FROM ShoppingCart sc WHERE sc.user.id=:uid and sc.goods.id=:gid and sc.color=:color");
        q.setParameter("uid", uid);
        q.setParameter("gid", gid);
        q.setParameter("color", color);
        return (ShoppingCart)q.uniqueResult();
    }

    @Override
    public ShoppingCart getById(int id) {
        return (ShoppingCart) getCurrentSession().get(ShoppingCart.class, id);
    }
}
