package com.myapp.dao.impl;

import com.myapp.dao.AddressDao;
import com.myapp.entity.Address;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AddressDaoImpl extends BaseDaoImpl<Address> implements AddressDao {

    @Override
    public List<Address> getAddress(int uid) {
        Query q = getCurrentSession().createQuery("FROM Address a where a.user.id = :uid");
        q.setParameter("uid", uid);
        return q.list();
    }

    @Override
    public Address getAddressById(int id) {
        return (Address) getCurrentSession().get(Address.class, id);
    }

    //--------------------------------------------------
    @Override
    public void changeDefault(int userId, int addressId) {
        String hql = "UPDATE Address SET type=1 WHERE user.id=:userId AND type=0";
        Query q = getCurrentSession().createQuery(hql);
        q.setParameter("userId", userId);
        q.executeUpdate();
        hql = "UPDATE Address SET type=0 WHERE user.id=:userId AND id=:addressId";
        q = getCurrentSession().createQuery(hql);
        q.setParameter("userId", userId);
        q.setParameter("addressId", addressId);
        q.executeUpdate();
    }
}
