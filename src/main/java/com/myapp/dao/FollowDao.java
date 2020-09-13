package com.myapp.dao;

import com.myapp.entity.Follow;

public interface FollowDao extends BaseDao<Follow> {
    public boolean getIfFollow(int uid, int gid);

    public Follow getFollow(int uid, int gid);
}
