package com.myapp.dao;

import com.myapp.entity.User;

public interface UserDao  extends BaseDao<User> {
    public User getById(int id);
}
