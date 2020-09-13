package com.myapp.service.impl;

import com.myapp.dao.UserDao;
import com.myapp.entity.User;
import com.myapp.model.UserDto;
import com.myapp.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public void update(UserDto userDto) {
        User user = new User();
        BeanUtils.copyProperties(userDto, user);
        userDao.update(user);
    }

    @Override
    public UserDto login(UserDto userDto) {
        User user = null;
        Map<String, Object> params = new HashMap<String, Object>(0);
        if (userDto != null) {
            params.put("uid", userDto.getUid());
            params.put("password", userDto.getPassword());
            user = userDao.get("from User u where (u.uid=:uid OR u.nick=:uid OR u.email=:uid) and u.password=:password", params);
            if (user != null) {
                BeanUtils.copyProperties(user, userDto);
                return userDto;
            }
        }
        return null;
    }

    @Override
    public String alterPsw(String password, int myid) {
        User u;
        u = userDao.getById(myid);
        u.setPassword(password);
        userDao.save(u);
        return "修改密码成功";
    }

    @Override
    public UserDto getUser(Integer id) {
        User u = userDao.get(User.class, id);
        UserDto userDto = new UserDto();
        if (u != null) {
            BeanUtils.copyProperties(u, userDto);
        } else {
            return null;
        }
        return userDto;
    }

    @Override
    public UserDto getUserByEmail(String email) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("email", email);
        User u = userDao.get("from User u where u.email=:email", params);
        UserDto userDto = new UserDto();
        if (u != null) {
            BeanUtils.copyProperties(u, userDto);
        } else {
            return null;
        }
        return userDto;
    }

    @Override
    public void updates(UserDto userDto) {
        User u = userDao.get(User.class, userDto.getId());
        u.setGender(userDto.getGender());
        u.setPassword(userDto.getPassword());
        u.setMobile(userDto.getMobile());
        u.setNick(userDto.getNick());
        u.setEmail(userDto.getEmail());
    }

    @Override
    public void register(UserDto userModel) throws Exception {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("email", userModel.getEmail());
        if (userDao.count("select count(*) from User u where u.email=:email", params) > 0) {
            throw new Exception("邮箱已被注册");
        } else {
            User u = new User();
            BeanUtils.copyProperties(userModel, u);
            u.setUid("111");
            u.setBalance(BigDecimal.valueOf(0));
            userDao.save(u);
        }
    }

    @Override
    public void delete(Integer id) throws Exception {
        userDao.delete(userDao.get(User.class, id));
    }

    @Override
    public List<UserDto> findUser(Integer page, Integer rows, String search) {
        List<UserDto> list = new ArrayList<UserDto>(0);
        Map<String, Object> params = new HashMap<String, Object>(0);
        UserDto userDto;
        List<User> users;
        String hql;
        if (page == null || page == 0 || rows == null || rows == 0) {
            page = 1;
            rows = 0;
        }
        if (!search.isEmpty()) {
            hql = "from User u where u.uid like :search or u.nick like :search or u.trueName like :search";
            params.put("search", "%%" + search + "%%");
            users = userDao.find(hql, params, page, rows);
        } else {
            hql = "from User";
            users = userDao.find(hql, page, rows);
        }
        for (User u : users
        ) {
            userDto = new UserDto();
            BeanUtils.copyProperties(u, userDto);
            list.add(userDto);
        }
        return list;
    }

    @Override
    public Long getCount(String search) {
        Map<String, Object> params = new HashMap<String, Object>(0);
        if (search.isEmpty()) {
            return userDao.count("select count(*) from User");
        }
        params.put("search", "%%" + search + "%%");
        return userDao.count("select count(*) from User u where u.uid like :search or u.nick like :search or u.trueName like :search", params);
    }
}
