package com.myapp.service.impl;

import com.myapp.dao.*;
import com.myapp.entity.*;
import com.myapp.model.CartDTO;
import com.myapp.model.OrderDetailDto;
import com.myapp.model.OrderDto;
import com.myapp.service.GoodsService;
import com.myapp.service.OrderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private UserDao UserDao;
    @Autowired
    private GoodsDao GoodsDao;
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private AddressDao AddressDao;
    @Autowired
    private OrderDetailDao orderDetailDao;
    @Autowired
    private ShoppingCartDao shoppingcartDao;

    @Override
    public BigDecimal save(CartDTO cd, int AddressNo, short type, short Status, BigDecimal transportCost, int uid, BigDecimal totalprice) {
        ShoppingCart sc = new ShoppingCart();
        if(cd.getId()!=0) {
            sc.setId(cd.getId());
            shoppingcartDao.delete(sc);
        }
        Order o = new Order();
        OrderDetail od = new OrderDetail();
        Set<OrderDetail> sod = new HashSet<>();
        Address a = AddressDao.getAddressById(AddressNo);
        o.setAddress(a);
        o.setDate(new Date());
        o.setStatus(Status);
        o.setType(type);
        o.setTransportCost(transportCost);
        o.setTotalGoodsPrice(cd.getPrice());
        o.setUser(UserDao.getById(uid));

        Goods g = new Goods();
        g = GoodsDao.getGoodsByid(cd.getGoods_id());
        g.setNumber(g.getNumber()-cd.getNumber());
        GoodsDao.save(g);

        od.setColor(cd.getColor());
        od.setPrice(cd.getPrice());
        od.setGoodsNum(cd.getNumber());
        od.setGoods(GoodsDao.getGoodsByid(cd.getGoods_id()));
        sod.add(od);
        o.setOrderDetail(sod);
        orderDao.save(o);

        User u = UserDao.getById(uid);
        if(u.getBalance().compareTo(totalprice)>=0) {
            u.setBalance(u.getBalance().subtract(totalprice).subtract(transportCost));
            UserDao.save(u);
        }
        return u.getBalance();
    }

    @Override
    public BigDecimal save(List<CartDTO> lcd, int AddressNo, short type, short Status, BigDecimal transportCost, int uid, BigDecimal totalprice) {
        ShoppingCart sc = new ShoppingCart();
        Order o = new Order();
//        Set<OrderDetail> sod = new HashSet<OrderDetail>();
        Address a = AddressDao.getAddressById(AddressNo);
        o.setAddress(a);
        o.setDate(new Date());
        o.setStatus(Status);
        o.setType(type);
        o.setTransportCost(transportCost);
        o.setTotalGoodsPrice(totalprice);
        o.setUser(UserDao.getById(uid));
//        o.setOrderDetail(sod);
        orderDao.save(o);
        for (CartDTO cd:lcd) {
            if(cd.getId()!=0) {
                sc = shoppingcartDao.get("from ShoppingCart s where s.id="+cd.getId());
//                sc.setId(cd.getId());
                shoppingcartDao.delete(sc);
            }
            OrderDetail od = new OrderDetail();
            Goods g = new Goods();
            g = GoodsDao.getGoodsByid(cd.getGoods_id());
            g.setNumber(g.getNumber()-cd.getNumber());
            GoodsDao.save(g);
            od.setColor(cd.getColor());
            od.setPrice(cd.getPrice());
            od.setGoodsNum(cd.getNumber());
            od.setColor(cd.getColor());
            od.setGoods(g);
            od.setOrder(o);
//            sod.add(od);
            orderDetailDao.save(od);
        }
        User u = UserDao.getById(uid);
        if(u.getBalance().compareTo(totalprice)>=0) {
            u.setBalance(u.getBalance().subtract(totalprice).subtract(transportCost));
            UserDao.save(u);
        }
        return u.getBalance();
    }

    @Override
    public List<OrderDto> findOrdersByStatus(Integer userId, Integer status) {
        List<OrderDto> list=new ArrayList<OrderDto>(0);
        OrderDto orderDto;
        Map<String,Object> params=new HashMap<String,Object>(0);
        String hql="from Order o where 1=1";
        if(userId==null||status==null){
            return null;
        }else{
            if(userId!=0){
                hql+=" and o.user.id=:userId";
                params.put("userId",userId);
            }
            if(status!=0){
                hql+=" and o.status=:status";
                params.put("status",status.shortValue());
            }
            for (Order o:orderDao.find(hql,params)
                 ) {
                orderDto=new OrderDto();
                BeanUtils.copyProperties(o,orderDto);
                orderDto.setAddress(o.getAddress().getProvince()+o.getAddress().getCity()+o.getAddress().getDetail());
                orderDto.setReciver(o.getAddress().getConsignee());
                list.add(orderDto);
            }
        }
        return list;
    }

    @Override
    public List<OrderDto> findOrders(Integer uid, Integer page, Integer row) {
        Map<String,Object> params=new HashMap<String,Object>(0);
        List<OrderDto> list=new ArrayList<OrderDto>(0);
        OrderDto orderDto;
        String hql="from Order o where o.user.id=:uid";
        if(uid!=null&&page!=null&&row!=null){
            params.put("uid",uid);
            for (Order o:orderDao.find(hql,params,page,row)
            ) {
                orderDto=new OrderDto();
                BeanUtils.copyProperties(o,orderDto);
                orderDto.setAddress(o.getAddress().getProvince()+o.getAddress().getCity()+o.getAddress().getDetail());
                orderDto.setReciver(o.getAddress().getConsignee());
                list.add(orderDto);
            }
        }
        return list;
    }

    @Override
    public Integer countOrdersOfUser(Integer id) {
        return orderDao.count("select count(*) from Order o where o.user.id="+id).intValue();
    }

    //-----------------------------------------------------

    @Override
    public BigDecimal pay(int id,BigDecimal oldBalance) {
        Order order = orderDao.get(Order.class,id);
        BigDecimal newBalance = oldBalance.subtract(order.getTotalGoodsPrice()).subtract(order.getTransportCost());
        if(newBalance.compareTo(new BigDecimal(0))<0){
            return null;
        }
        User user = order.getUser();
        user.setBalance(newBalance);
        UserDao.update(user);
        order.setStatus((short) 2);
        orderDao.update(order);
        return newBalance;
    }

    @Override
    public void takeOver(int id) {
        Order order = orderDao.get(Order.class,id);
        order.setStatus((short) 3);
        order.setReciveDate(new Date());
        orderDao.update(order);
    }

    @Override
    public void cancelOver(int id) {
        Order order = orderDao.get(Order.class,id);
        order.setStatus((short) 0);
        List<OrderDetail> orderDetails = orderDetailDao.find("FROM OrderDetail WHERE order_id="+id);
        for(OrderDetail od : orderDetails){
            Goods goods = od.getGoods();
            goods.setNumber(goods.getNumber()+od.getGoodsNum());
            GoodsDao.save(goods);
        }
        orderDao.update(order);
    }

    @Override
    public void delete(int id) {
        orderDao.delete(orderDao.get(Order.class,id));
    }

    @Override
    public List<OrderDto> findByUserId(int userId, int mark) {
        String hql = null;
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        if(mark==0){
            hql = "FROM Order WHERE user.id=:userId ORDER BY date DESC";
        }
        else if(mark==1){
            hql = "FROM Order WHERE user.id=:userId AND status=1 ORDER BY date DESC";
        }
        else if(mark==2){
            hql = "FROM Order WHERE user.id=:userId AND status=2 ORDER BY date DESC";
        }
        else if(mark==3){
            hql = "FROM Order WHERE user.id=:userId AND status=4 ORDER BY date DESC";
        }
        List<Order> orders = orderDao.find(hql, params);
        return e2dList(orders);
    }

    @Override
    public List<OrderDto> findRecent(int userId) {
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        String hql = "FROM Order WHERE user.id=:userId AND status IN (1,2) ORDER BY date DESC";
        List<Order> orders = orderDao.find(hql, params);
        return e2dList(orders);
    }

    private OrderDto e2d(Order order) {
        OrderDto orderDto = new OrderDto();
        BeanUtils.copyProperties(order, orderDto);
        orderDto.setUserId(order.getUser().getId());
        //寻找订单详情
        String hql = "FROM OrderDetail WHERE order.id=:orderId";
        Map<String, Object> params = new HashMap<>();
        params.put("orderId", order.getId());
        List<OrderDetail> orderDetails = orderDetailDao.find(hql, params);
        orderDto.setDetailNum(orderDetails.size());
        //转化
        List<OrderDetailDto> orderDetailDtos = new ArrayList<>();
        for (OrderDetail od : orderDetails) {
            OrderDetailDto orderDetailDto = new OrderDetailDto();
            BeanUtils.copyProperties(od,orderDetailDto);
            orderDetailDto.setOrderId(order.getId());
            orderDetailDto.setGoodsId(od.getGoods().getId());
            orderDetailDto.setGoodsName(od.getGoods().getName());
            orderDetailDtos.add(orderDetailDto);
        }
        orderDto.setOrderDetailDtos(orderDetailDtos);
        return orderDto;
    }

    private List<OrderDto> e2dList(List<Order> orders) {
        List<OrderDto> orderDtos = new ArrayList<>();
        if (orders != null && orders.size() > 0) {
            for (Order o : orders) {
                OrderDto orderDto = e2d(o);
                orderDtos.add(orderDto);
            }
        }
        return orderDtos;
    }
}
