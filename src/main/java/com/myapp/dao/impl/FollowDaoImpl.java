package com.myapp.dao.impl;

import com.myapp.dao.FollowDao;
import com.myapp.entity.Follow;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

@Repository
public class FollowDaoImpl extends BaseDaoImpl<Follow> implements FollowDao {
    @Override
    public boolean getIfFollow(int uid, int gid) {
        Query q = getCurrentSession().createQuery("FROM Follow f WHERE f.user.id=:uid and f.goods.id=:gid");
        q.setParameter("uid", uid);
        q.setParameter("gid", gid);
        return q.uniqueResult() != null;
    }

    @Override
    public Follow getFollow(int uid, int gid) {
        Query q = getCurrentSession().createQuery("FROM Follow f WHERE f.user.id=:uid and f.goods.id=:gid");
        q.setParameter("uid", uid);
        q.setParameter("gid", gid);
        return (Follow)q.uniqueResult();
    }
}
