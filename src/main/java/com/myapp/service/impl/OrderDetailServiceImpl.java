package com.myapp.service.impl;

import com.myapp.dao.OrderDetailDao;
import com.myapp.entity.OrderDetail;
import com.myapp.model.OrderDetailDto;
import com.myapp.service.OrderDetailService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {
    @Autowired
    private OrderDetailDao orderDetailDaoImpl;

    @Override
    public List<OrderDetailDto> findByOrder(Integer orderId) {
        OrderDetailDto orderDetailDto;
        List<OrderDetailDto> list=new ArrayList<OrderDetailDto>(0);
        for (OrderDetail od:orderDetailDaoImpl.find("from OrderDetail od where od.order.id="+orderId)
             ) {
            orderDetailDto=new OrderDetailDto();
            BeanUtils.copyProperties(od,orderDetailDto);
            orderDetailDto.setGoodsId(od.getGoods().getId());
            orderDetailDto.setGoodsName(od.getGoods().getName());
            list.add(orderDetailDto);
        }
        return list;
    }
}
