package com.myapp.dao;

import com.myapp.entity.Reviews;
import com.myapp.model.DataGrid;

import java.util.List;

public interface ReviewDao extends BaseDao<Reviews> {
    public List<Reviews> getReview(int goods_id);
    public DataGrid<Reviews> getReview(int goods_id, int page, int pageSize);
    public Reviews getReview(int goods_id, int user_id);
}
