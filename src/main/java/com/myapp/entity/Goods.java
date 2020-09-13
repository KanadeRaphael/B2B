package com.myapp.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "goods")
public class Goods {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "name", nullable = false, length = 50)
    private String name; //商品名
    @Column(name = "intro", nullable = false, length = 200)
    private String intro; //商品介绍
    @Column(name = "price", nullable = false)
    private BigDecimal price; //商品价格
    @Column(name = "reduction")
    private BigDecimal reduction; //商品降价幅度
    @Column(name = "type", nullable = false, length = 20)
    private String type; //商品类型
    @Column(name = "number")
    private Integer number; //商品库存
    @Column(name = "buynum")
    private String buynum; //购买数量
    @Column(name = "color")
    private String color; //颜色

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "goods")
    private Set<ShoppingCart> shoppingCarts = new HashSet<>();
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "goods")
    private Set<Follow> follow = new HashSet<>();
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "goods")
    private Set<OrderDetail> orderdetail = new HashSet<>();
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "goods")
    private Set<Reviews> reviews = new HashSet<>();
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "goods")  //从Goods加载的继续加载tags
    private Set<GoodsTag> goodsTags = new HashSet<>();

    public Goods(String name, String intro, BigDecimal price, BigDecimal reduction, String type, int number) {
        this.name = name;
        this.intro = intro;
        this.price = price;
        this.reduction = reduction;
        this.type = type;
        this.number = number;
    }

    public Goods() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getReduction() {
        return reduction;
    }

    public void setReduction(BigDecimal reduction) {
        this.reduction = reduction;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Set<ShoppingCart> getShoppingCarts() {
        return shoppingCarts;
    }

    public void setShoppingCarts(Set<ShoppingCart> shoppingCarts) {
        this.shoppingCarts = shoppingCarts;
    }

    public Set<Follow> getFollow() {
        return follow;
    }

    public void setFollow(Set<Follow> follow) {
        this.follow = follow;
    }

    public Set<OrderDetail> getOrderdetail() {
        return orderdetail;
    }

    public void setOrderdetail(Set<OrderDetail> orderdetail) {
        this.orderdetail = orderdetail;
    }

    public Set<Reviews> getReviews() {
        return reviews;
    }

    public void setReviews(Set<Reviews> reviews) {
        this.reviews = reviews;
    }

    public String getBuynum() {
        return buynum;
    }

    public void setBuynum(String buynum) {
        this.buynum = buynum;
    }

    public Set<GoodsTag> getGoodsTags() {
        return goodsTags;
    }

    public void setGoodsTags(Set<GoodsTag> goodsTags) {
        this.goodsTags = goodsTags;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
