package com.myapp.dao.impl;

import com.myapp.dao.GoodsDao;
import com.myapp.entity.Goods;
import com.myapp.entity.GoodsTag;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Repository
public class GoodsDaoImpl extends BaseDaoImpl<Goods> implements GoodsDao {
    @Override
    public List<Goods> getHotGoods(int limited) {
        Query q = getCurrentSession().createQuery("FROM Goods g where g.reduction!=0 order by g.buynum DESC"); //'%"+str+"%'
        q.setMaxResults(limited);
        return q.list();
    }

    @Override
    public List<Goods> getRelatedGoods(int id, int limited) {
        List<Goods> goods = new ArrayList<Goods>();
        Query q = getCurrentSession().createQuery("FROM GoodsTag t WHERE t.goods.id=:id order by t.count DESC"); //'%"+str+"%'
        q.setParameter("id", id);
        List<GoodsTag> tags = q.list();
        for (GoodsTag gt : tags) {
            Query q2 = getCurrentSession().createQuery("SELECT t.goods FROM GoodsTag t WHERE t.tag=:tag and t.goods.id != :id order by t.count DESC ");
            q2.setParameter("tag", gt.getTag());
            q2.setParameter("id", id);
            for (Goods g : (List<Goods>) q2.list()) {
                if (!goods.contains(g)) goods.add(g);
            }
        }
        Collections.shuffle(goods);  //打乱顺序
        return goods.subList(0, goods.size() > limited ? limited : goods.size());
    }

    @Override
    public Goods getGoodsByid(int id) {
        return (Goods) getCurrentSession().get(Goods.class, id);
    }

    @Override
    public List<Goods> findByList(String hql, List<Integer> list) {
        Query q=getCurrentSession().createQuery(hql);
        q.setParameterList("list",list);
        return q.list();
    }
}
