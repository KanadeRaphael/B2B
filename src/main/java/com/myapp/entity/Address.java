package com.myapp.entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "address")
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "consignee", nullable = false)
    private String consignee;
    @Column(name = "province", nullable = false, length = 16)
    private String province;
    @Column(name = "city", nullable = false, length = 16)
    private String city;
    @Column(name = "detail", nullable = false, length = 100)
    private String detail;
    @Column(name = "mobile", nullable = false, length = 16)
    private String mobile;
    @Column(name = "type", nullable = false, length = 1)
    private Integer type;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "address")
    private Set<Order> order = new HashSet<>();

    public Address(String province, String city, String detail, User user) {
        this.province = province;
        this.city = city;
        this.detail = detail;
        this.user = user;
    }

    public Address() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<Order> getOrder() {
        return order;
    }

    public void setOrder(Set<Order> order) {
        this.order = order;
    }
    //    @Temporal(TemporalType.TIMESTAMP) 去掉具体时间
}
