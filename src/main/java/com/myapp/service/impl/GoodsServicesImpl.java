package com.myapp.service.impl;

import com.myapp.dao.*;
import com.myapp.entity.Goods;
import com.myapp.entity.HomePage;
import com.myapp.entity.Reviews;
import com.myapp.model.GoodsDto;
import com.myapp.model.SimpleGoodsDTO;
import com.myapp.model.SingleGoodsDTO;
import com.myapp.service.GoodsService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class GoodsServicesImpl implements GoodsService {
    @Autowired
    private GoodsDao goodsDao;
    @Autowired
    private HomePageDao homePageDaoImpl;
    @Autowired
    private ReviewDao ReviewDao;
    @Autowired
    private FollowDao FollowDao;
    @Autowired
    private OrderDao OrderDao;

    @Override
    public SingleGoodsDTO getGoodsByid(int id, int myid) {
        Goods goods = goodsDao.getGoodsByid(id);
        SingleGoodsDTO gg = new SingleGoodsDTO();
        if (goods != null) {
            BeanUtils.copyProperties(goods, gg);
            gg.setStar(getStar(goods.getReviews()));
            gg.setReviewsNo(goods.getReviews().size());
            gg.setColor(goods.getColor().split(" "));
            if (myid != 0) {
                gg.setIsbuy((ReviewDao.getReview(id, myid) == null) && !(OrderDao.getOrder(id, myid) == null));
                gg.setIslike(FollowDao.getIfFollow(myid, id));
            }
        } else return null;
        return gg;
    }

    @Override
    public List<SimpleGoodsDTO> getRelatedGoods(int id, int myid, int limited) {
        List<Goods> goods = goodsDao.getRelatedGoods(id, limited);
        return getSimpleGoodsDTOS(goods, myid);
    }

    @Override
    public List<SimpleGoodsDTO> getHotGoods(int myid, int limited) {
        List<Goods> goods = goodsDao.getHotGoods(limited);
        return getSimpleGoodsDTOS(goods, myid);
    }

    private List<SimpleGoodsDTO> getSimpleGoodsDTOS(List<Goods> goods, int myid) {
        List<SimpleGoodsDTO> glist = new ArrayList<SimpleGoodsDTO>();
        if (goods != null) {
            for (Goods g : goods) {
                SimpleGoodsDTO gg = new SimpleGoodsDTO();
                BeanUtils.copyProperties(g, gg);
                gg.setStar(getStar(g.getReviews()));
                if (myid != 0)
                    gg.setIslike(FollowDao.getIfFollow(myid, g.getId()));
                glist.add(gg);
            }
        }
//        else return null;
        return glist;
    }

    private short getStar(Set<Reviews> reviews) {
        float sum = 0;
        int i = 0;
        if (!reviews.isEmpty())
            for (Reviews r : reviews) {
                if (i == 0)
                    sum = (r.getPrice() + r.getValue() + r.getQuality()) / 3;
                else sum = (sum + (r.getPrice() + r.getValue() + r.getQuality()) / 3) / 2;
                i++;
            }
        else
            sum = 10;
        sum += 0.5;  //四舍五入
        return (short) sum;
    }

    @Override
    public int getFollowGoodsCount(Integer uid) {
        Long count = FollowDao.count("SELECT COUNT(*) FROM Follow WHERE user.id=" + uid);
        int num = 0;
        if (count != null) {
            num = count.intValue();
        }
        return num;
    }

    @Override
    public List<GoodsDto> findGoods(String keyword, int mode) {
        List<Goods> goods;
        List<GoodsDto> list = new ArrayList<GoodsDto>(0);
        GoodsDto goodsDto;
        if (keyword == null) {
            keyword = "";
        }
        String hql = "from Goods g where g.name like '%%" + keyword + "%%' or g.intro like '%%" + keyword + "%%'";
        if (mode == 1) hql += " order by g.buynum desc";
        goods = goodsDao.find(hql);
        if (goods != null) {
            for (Goods g : goods
            ) {
                goodsDto = new GoodsDto();
                BeanUtils.copyProperties(g, goodsDto);
                //goodsDto.setSrc("img"+goodsDto.getId());
                list.add(goodsDto);
            }
        }
        return list;
    }

    @Override
    public List<GoodsDto> findIndexGoods() {
        GoodsDto goodsDto;
        List<GoodsDto> goods = new ArrayList<GoodsDto>(0);
        List<Integer> l = new ArrayList<Integer>(0);
        for (HomePage h : homePageDaoImpl.find("from HomePage")
        ) {
            l.add(h.getGoods().getId());
        }
        for (Goods g : goodsDao.findByList("from Goods g where g.id in (:list)", l)
        ) {
            goodsDto = new GoodsDto();
            BeanUtils.copyProperties(g, goodsDto);
            goods.add(goodsDto);
        }
        return goods;
    }
}
