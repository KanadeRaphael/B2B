package com.myapp.service;

import com.myapp.entity.Follow;
import com.myapp.model.FollowDto;

import java.util.List;

public interface FollowService {
    public void changeFollow(Follow fl, int uid, int gid);

    //-----------------------------------------

    List<FollowDto> findByUserId(int userId);
    void delete(FollowDto followDto);
}
