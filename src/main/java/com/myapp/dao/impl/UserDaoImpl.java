package com.myapp.dao.impl;

import com.myapp.dao.UserDao;
import com.myapp.entity.User;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {
    @Override
    public User getById(int id) {
        return (User) getCurrentSession().get(User.class, id);
    }
}
