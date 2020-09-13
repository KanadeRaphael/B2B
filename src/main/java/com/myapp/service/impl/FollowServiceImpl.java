package com.myapp.service.impl;

import com.myapp.dao.FollowDao;
import com.myapp.dao.GoodsDao;
import com.myapp.dao.UserDao;
import com.myapp.entity.Follow;
import com.myapp.entity.Goods;
import com.myapp.model.FollowDto;
import com.myapp.service.FollowService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class FollowServiceImpl implements FollowService {
    @Autowired
    private UserDao UserDao;
    @Autowired
    private GoodsDao GoodsDao;
    @Autowired
    private FollowDao FollowDao;

    @Override
    public void changeFollow(Follow fl, int uid, int gid) {
        Follow f = FollowDao.getFollow(uid, gid);
        if (f!=null) {
            FollowDao.delete(f);
            return;
        }
        fl.setUser(UserDao.getById(uid));
        fl.setGoods(GoodsDao.getGoodsByid(gid));
        FollowDao.save(fl);
    }

    @Override
    public List<FollowDto> findByUserId(int userId) {
        String hql = "FROM Follow WHERE user.id="+userId;
        List<Follow> follows = FollowDao.find(hql);
        return e2dList(follows);
    }

    @Override
    public void delete(FollowDto followDto) {
        Follow follow = FollowDao.get(Follow.class,followDto.getId());
        FollowDao.delete(follow);
    }

    private FollowDto e2d(Follow follow) {
        FollowDto followDto = new FollowDto();
        BeanUtils.copyProperties(follow,followDto);
        Goods goods = GoodsDao.get(Goods.class,follow.getGoods().getId());
        followDto.setGoodsId(goods.getId());
        followDto.setGoodsName(goods.getName());
        return followDto;
    }

    private List<FollowDto> e2dList(List<Follow> follows){
        List<FollowDto> followDtos = new ArrayList<>();
        if(follows!=null && follows.size()>0){
            for(Follow f : follows){
                FollowDto followDto = e2d(f);
                followDtos.add(followDto);
            }
        }
        return followDtos;
    }

}
