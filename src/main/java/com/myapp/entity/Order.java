package com.myapp.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "orders")
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Integer id;
    @Column
    private short status;
    @Column
    private short type;
    @Column
    private Date date;
    @Column
    private BigDecimal totalGoodsPrice;
    @Column
    private BigDecimal transportCost;
    @Column
    private Date reciveDate;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "add_id")
    private Address address;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "order", targetEntity = OrderDetail.class,cascade = CascadeType.REMOVE)
    private Set<OrderDetail> OrderDetail = new HashSet<OrderDetail>(0);

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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<com.myapp.entity.OrderDetail> getOrderDetail() {
        return OrderDetail;
    }

    public void setOrderDetail(Set<com.myapp.entity.OrderDetail> orderDetail) {
        OrderDetail = orderDetail;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
}
