package com.myapp.service;

import com.myapp.entity.Goods;
import com.myapp.entity.HomePage;
import com.myapp.model.GoodsDto;
import com.myapp.model.HomePageDto;

import java.util.List;

public interface AdminService {
    List<GoodsDto> addToadGoodsInfo();
    List<HomePageDto> appendPageManage();
    List<GoodsDto> appendNoPageManage(List<HomePageDto> homePageDtos);
    void deleteGoodsInfo(GoodsDto goodsDto);
    void updateGoodsInfo(GoodsDto goodsDto);
    int addGoods(GoodsDto goodsDto);
    void deletePageManage(HomePageDto homePageDto);
    void addPageManageAdd(GoodsDto goodsDto);
    List<GoodsDto> addGoodsInfoSeach(String type);
}
