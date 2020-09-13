package com.myapp.service.impl;

import com.myapp.dao.ReviewDao;
import com.myapp.dao.GoodsDao;
import com.myapp.dao.UserDao;
import com.myapp.entity.Reviews;
import com.myapp.model.DataGrid;
import com.myapp.model.ReviewDTO;
import com.myapp.service.ReviewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {
    private static Logger logger = LoggerFactory.getLogger(ReviewService.class);
    @Autowired
    private UserDao UserDao;
    @Autowired
    private GoodsDao GoodsDao;
    @Autowired
    private ReviewDao ReviewDao;

    @Override
    public List<ReviewDTO> getReview(int goods_id) {
        List<Reviews> reviews = this.ReviewDao.getReview(goods_id);
        List<ReviewDTO> rlist = new ArrayList<ReviewDTO>();
        if (reviews != null) {
            for (Reviews r : reviews) {
                ReviewDTO rr = new ReviewDTO();
                BeanUtils.copyProperties(r, rr);
                rr.setFname(r.getFname().split(" "));
                rlist.add(rr);
            }
        } else return null;
        return rlist;
    }

    @Override
    public DataGrid<ReviewDTO> getReview(int goods_id, int page, int pageSize) {
        DataGrid<Reviews> reviews = this.ReviewDao.getReview(goods_id, page, pageSize);
        DataGrid<ReviewDTO> rdg = new DataGrid<ReviewDTO>();
        List<ReviewDTO> rlist = new ArrayList<ReviewDTO>();
        if (reviews != null) {
            for (Reviews r : reviews.getRows()) {
                ReviewDTO rr = new ReviewDTO();
                BeanUtils.copyProperties(r, rr);
                rr.setFname(r.getFname().split(" "));
                rlist.add(rr);
            }
        } else return null;
        rdg.setRows(rlist);
        rdg.setTotalpg(reviews.getTotalpg());
        rdg.setTotal(reviews.getTotal());
        return rdg;
    }

    @Override
    public void save(Reviews rv, int gid, int uid) {
        rv.setGoods(GoodsDao.getGoodsByid(gid));
        rv.setUser(UserDao.getById(uid));
        ReviewDao.save(rv);
    }
}
