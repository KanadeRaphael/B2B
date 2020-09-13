package com.myapp.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class OrderDto {
    private Integer id;
    //状态，1待付款，2待收货，3待评价
    private short status;
    //发票开头0个人，1企业
    private short type;
    private Date date;
    private BigDecimal totalGoodsPrice;
    private BigDecimal transportCost;
    private Date reciveDate;
    private String reciver;
    private String address;
    private Integer userId;
    private List<OrderDetailDto> orderDetailDtos;
    private Integer detailNum;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReciver() {
        return reciver;
    }

    public void setReciver(String reciver) {
        this.reciver = reciver;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    public short getType() {
        return type;
    }

    public void setType(short type) {
        this.type = type;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public BigDecimal getTotalGoodsPrice() {
        return totalGoodsPrice;
    }

    public void setTotalGoodsPrice(BigDecimal totalGoodsPrice) {
        this.totalGoodsPrice = totalGoodsPrice;
    }

    public BigDecimal getTransportCost() {
        return transportCost;
    }

    public void setTransportCost(BigDecimal transportCost) {
        this.transportCost = transportCost;
    }

    public Date getReciveDate() {
        return reciveDate;
    }

    public void setReciveDate(Date reciveDate) {
        this.reciveDate = reciveDate;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public List<OrderDetailDto> getOrderDetailDtos() {
        return orderDetailDtos;
    }

    public void setOrderDetailDtos(List<OrderDetailDto> orderDetailDtos) {
        this.orderDetailDtos = orderDetailDtos;
    }

    public Integer getDetailNum() {
        return detailNum;
    }

    public void setDetailNum(Integer detailNum) {
        this.detailNum = detailNum;
    }
}
