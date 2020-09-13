package com.myapp.service;

import com.myapp.model.OrderDetailDto;

import java.util.List;

public interface OrderDetailService {
    List<OrderDetailDto> findByOrder(Integer orderId);
}
