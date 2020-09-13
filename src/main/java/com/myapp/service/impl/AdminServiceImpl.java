package com.myapp.service.impl;

import com.myapp.dao.GoodsDao;
import com.myapp.dao.HomePageDao;
import com.myapp.entity.Goods;
import com.myapp.entity.HomePage;
import com.myapp.model.GoodsDto;
import com.myapp.model.HomePageDto;
import com.myapp.service.AdminService;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private GoodsDao goodsDao;
    @Autowired
    private HomePageDao homePageDao;

    @Override
    public List<GoodsDto> addToadGoodsInfo() {
        List<GoodsDto> goodsDtos = new ArrayList<>();
        List<Goods> goods = goodsDao.find("from Goods g");
        if (goods.size()>0 && goods!=null){
            for (Goods goods1 :goods){
                GoodsDto goodsDto = new GoodsDto();
                BeanUtils.copyProperties(goods1, goodsDto);
                goodsDtos.add(goodsDto);
            }
        }
        return goodsDtos;
    }
    @Override
    public List<HomePageDto> appendPageManage() {
        List<HomePageDto>homePageDtos = new ArrayList<>();
        List<HomePage> homePages = homePageDao.find("from HomePage h");
        if (homePages.size()>0 && homePages!=null){
            for (HomePage homePage:homePages){
                HomePageDto homePageDto = new HomePageDto();
                BeanUtils.copyProperties(homePage, homePageDto);
                homePageDto.setGoodsId(homePage.getGoods().getId());
                homePageDto.setName(homePage.getGoods().getName());
                homePageDto.setBuynum(homePage.getGoods().getBuynum());
                homePageDto.setPrice(homePage.getGoods().getPrice());
                homePageDto.setType(homePage.getGoods().getType());
                homePageDto.setIntro(homePage.getGoods().getIntro());
                homePageDtos.add(homePageDto);
            }
        }
        return homePageDtos;
    }
    @Override
    public List<GoodsDto> appendNoPageManage(List<HomePageDto> homePageDtos) {
        int fg =1;
        List<GoodsDto> goodsDtos = new ArrayList<>();
        List<Goods> goods = goodsDao.find("from Goods g");
        if (homePageDtos.size()>0 && homePageDtos!=null) {
            if (goods.size() > 0 && goods != null) {
                for (Goods goods1 : goods) {
                    for (HomePageDto homePageDto : homePageDtos) {
                        if (goods1.getId().equals(homePageDto.getGoodsId())) {
                            fg = 0;
                        }
                    }
                    if (fg==1){
                        GoodsDto goodsDto = new GoodsDto();
                        BeanUtils.copyProperties(goods1, goodsDto);
                        goodsDtos.add(goodsDto);
                    }
                    fg=1;
                }
            }
        }

        return goodsDtos;
    }
    @Override
    public void deleteGoodsInfo(GoodsDto goodsDto) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id",goodsDto.getId());
        Goods goods = goodsDao.get("from Goods g where g.id = :id",params);
        if (goods!=null){
            goodsDao.delete(goods);
        }
    }
    @Override
    public void updateGoodsInfo(GoodsDto goodsDto) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id",goodsDto.getId());
        Goods goods = goodsDao.get("from Goods g where g.id = :id",params);
        if (goods!=null){
            if (goodsDto.getReduction()!=null){
                goods.setReduction(goodsDto.getReduction());
            }
            if (goodsDto.getIntro()!=null && !goodsDto.getIntro().equals("")){
                goods.setIntro(goodsDto.getIntro());
            }
            if (goodsDto.getPrice()!=null){
                goods.setPrice(goodsDto.getPrice());
            }
            if (goodsDto.getNumber()!=null){
                goods.setNumber(goodsDto.getNumber());
            }
            goodsDao.update(goods);
        }
    }
    @Override
    public int addGoods(GoodsDto goodsDto) {
        int fg = 0,fg1=1;
        int id = 0;
        List<Goods> goods = goodsDao.find("from Goods g");
        if (goods.size()>0 && goods!=null){
            for (Goods goods1 :goods){
                if (goods1.getName().equals(goodsDto.getName()) && goods1.getType().equals(goodsDto.getType())){
                    fg=1;
                    id=goods1.getId();
                    if (goodsDto.getIntro()!=null&&!goodsDto.getIntro().equals("")) {
                        if (!goods1.getIntro().equals(goodsDto.getIntro())) {
                            goods1.setIntro(goods1.getIntro() + goodsDto.getIntro());
                        }
                    }
                    if(goodsDto.getPrice()!=null && !goodsDto.getPrice().equals("")) {
                        if (!goods1.getPrice().equals(goodsDto.getPrice()) || goods1.getPrice() == null || goods1.getPrice().equals("")) {
                            goods1.setPrice(goodsDto.getPrice());
                        }
                    }
                    if (goodsDto.getReduction()!=null && !goodsDto.getReduction().equals("")) {
                        if (!goods1.getReduction().equals(goodsDto.getReduction()) || goods1.getReduction() == null || goods1.getReduction().equals("")) {
                            goods1.setReduction(goodsDto.getReduction());
                        }
                    }
                    if (goodsDto.getColor()!=null && !goodsDto.getColor().equals("")) {
                        String [] c = goods1.getColor().split(" ");
                        for (int i=0;i<c.length;i++){
                            if (goodsDto.getColor().equals(c[i])){
                                fg1=0;
                            }
                        }
                        if (fg1==1){
                            goods1.setColor(goods1.getColor()+" "+ goodsDto.getColor());
                            fg1=0;
                        }
                    }
                    if (goodsDto.getNumber()!=null && !goodsDto.getNumber().equals("") ) {
                        goods1.setNumber(goods1.getNumber() + goodsDto.getNumber());
                    }
                    goodsDao.update(goods1);
                }

            }
        }
        if (fg==0){
            Goods goods2 = new Goods();
            BeanUtils.copyProperties(goodsDto, goods2);
            goodsDao.save(goods2);
            id = goods2.getId();
        }

        return id;
    }
    @Override
    public void deletePageManage(HomePageDto homePageDto) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id",homePageDto.getId());
        HomePage homePage = homePageDao.get("from HomePage h where h.id = :id",params);
        if (homePage!=null){
            homePageDao.delete(homePage);
        }
    }

    @Override
    public void addPageManageAdd(GoodsDto goodsDto) {
        Goods goods = goodsDao.get("from Goods g where g.id = "+goodsDto.getId());
        HomePage homePage = new HomePage();
        homePage.setGoods(goods);
        homePage.setUptime(new Date());
        homePageDao.save(homePage);
    }

    @Override
    public List<GoodsDto> addGoodsInfoSeach(String type) {
        List<Goods> goods = goodsDao.find("from Goods g where g.type = "+type);
        List<GoodsDto> goodsDtos = new ArrayList<>();
        if (goods.size()>0 && goods!=null){
            for (Goods goods1 :goods){
                GoodsDto goodsDto1 = new GoodsDto();
                BeanUtils.copyProperties(goods1, goodsDto1);
                goodsDtos.add(goodsDto1);
            }
        }
        return goodsDtos;
    }
}
