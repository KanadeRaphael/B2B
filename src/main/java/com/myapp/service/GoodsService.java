package com.myapp.service;

import com.myapp.model.GoodsDto;
import com.myapp.model.SimpleGoodsDTO;
import com.myapp.model.SingleGoodsDTO;

import java.util.List;

public interface GoodsService {
    public SingleGoodsDTO getGoodsByid(int gid, int uid);

    public List<SimpleGoodsDTO> getRelatedGoods(int id, int myid, int limited);

    public List<SimpleGoodsDTO> getHotGoods(int myid, int limited);

    //-----------------------------------------------------------

    int getFollowGoodsCount(Integer uid);
    List<GoodsDto> findGoods(String keyword, int mode);
    List<GoodsDto> findIndexGoods();
}
