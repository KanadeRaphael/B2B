package com.myapp.service;

import com.myapp.model.CartDTO;
import com.myapp.model.OrderDto;

import java.math.BigDecimal;
import java.util.List;

public interface OrderService {
    public BigDecimal save(CartDTO cd, int AddressNo, short type, short Status, BigDecimal transportCost, int uid, BigDecimal totalprice);
    public BigDecimal save(List<CartDTO> lcd, int AddressNo, short type, short Status, BigDecimal transportCost, int uid, BigDecimal totalprice);

    //--------------------------------------------------

    List<OrderDto> findOrdersByStatus(Integer userId, Integer status);
    List<OrderDto> findOrders(Integer uid,Integer page,Integer row);
    Integer countOrdersOfUser(Integer id);

    //--------------------------------------------------

    BigDecimal pay(int id,BigDecimal oldBalance);
    void takeOver(int id);
    void cancelOver(int id);
    void delete(int id);
    List<OrderDto> findByUserId(int userId, int mark);
    List<OrderDto> findRecent(int userId);
}
