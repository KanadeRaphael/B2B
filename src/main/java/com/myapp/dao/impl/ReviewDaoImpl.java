package com.myapp.dao.impl;

import com.myapp.dao.ReviewDao;
import com.myapp.entity.Reviews;
import com.myapp.model.DataGrid;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReviewDaoImpl extends BaseDaoImpl<Reviews> implements ReviewDao {

    @Override
    public List<Reviews> getReview(int goods_id) {
        return find("from Reviews r where r.goods.id='" + goods_id + "' order by r.date desc ");
    }

    @Override
    public DataGrid<Reviews> getReview(int goods_id, int page, int pageSize) {
        DataGrid<Reviews> d = new DataGrid<Reviews>();
        Query q = getCurrentSession().createQuery("from Reviews r where r.goods.id=:goods_id order by r.date desc ");
        q.setParameter("goods_id", goods_id);
        d.setTotalpg(q.list().size() / pageSize + 1);
        d.setTotal(q.list().size());
        q.setFirstResult((page - 1) * pageSize);
        q.setMaxResults(pageSize);
        d.setRows(q.list());
        return d;
    }

    @Override
    public Reviews getReview(int goods_id, int user_id) {
        Query q = getCurrentSession().createQuery("from Reviews r where r.goods.id=:goods_id and r.user.id=:user_id");
        q.setParameter("goods_id", goods_id);
        q.setParameter("user_id", user_id);
        return (Reviews) q.uniqueResult();
    }
}
