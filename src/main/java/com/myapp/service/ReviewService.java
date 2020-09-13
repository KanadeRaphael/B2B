package com.myapp.service;

import com.myapp.entity.Reviews;
import com.myapp.model.DataGrid;
import com.myapp.model.ReviewDTO;

import java.util.List;

public interface ReviewService {
    public List<ReviewDTO> getReview(int goods_id);

    public DataGrid<ReviewDTO> getReview(int goods_id, int page, int pageSize);

    public void save(Reviews rv, int gid, int uid);
}
