package com.myapp.model;

import com.myapp.entity.GoodsTag;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

public class SingleGoodsDTO {
    private Integer id;
    private String name; //商品名
    private String intro; //商品介绍
    private BigDecimal price; //商品价格
    private BigDecimal reduction; //商品降价幅度
    private String type; //商品类型
    private Integer number; //商品库存
    private String[] color; //颜色

    private boolean isbuy; //我是否曾经购买过或评价过
    private boolean islike = false; //我是否喜欢
    private short star; //评价星级别
    private int reviewsNo;  //评价总数

    private Set<GoodsTag> goodsTags = new HashSet<>(); //标签信息

    public SingleGoodsDTO(String name, String intro, BigDecimal price, String type, Integer number) {
        this.name = name;
        this.intro = intro;
        this.price = price;
        this.type = type;
        this.number = number;
    }

    public SingleGoodsDTO() {
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

    public short getStar() {
        return star;
    }

    public void setStar(short star) {
        this.star = star;
    }

    public boolean isIsbuy() {
        return isbuy;
    }

    public void setIsbuy(boolean isbuy) {
        this.isbuy = isbuy;
    }

    public Set<GoodsTag> getGoodsTags() {
        return goodsTags;
    }

    public void setGoodsTags(Set<GoodsTag> goodsTags) {
        this.goodsTags = goodsTags;
    }

    public String[] getColor() {
        return color;
    }

    public void setColor(String[] color) {
        this.color = color;
    }

    public int getReviewsNo() {
        return reviewsNo;
    }

    public void setReviewsNo(int reviewsNo) {
        this.reviewsNo = reviewsNo;
    }

    public boolean isIslike() {
        return islike;
    }

    public void setIslike(boolean islike) {
        this.islike = islike;
    }
}
