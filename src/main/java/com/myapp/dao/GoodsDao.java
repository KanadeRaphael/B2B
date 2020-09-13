package com.myapp.dao;

import com.myapp.entity.Goods;

import java.util.List;

public interface GoodsDao extends BaseDao<Goods> {
    public Goods getGoodsByid(int id);

    public List<Goods> getHotGoods(int limited);

    public List<Goods> getRelatedGoods(int id, int limited);

    List<Goods> findByList(String hql, List<Integer> list);
}
