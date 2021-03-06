package com.myapp.model;

import java.math.BigDecimal;

public class SimpleGoodsDTO {
    private Integer id;
    private String name; //商品名
    private BigDecimal reduction; //商品降价幅度
    private BigDecimal price; //商品价格
    private short star; //评价星级别
    private boolean islike = false; //我是否喜欢

    public SimpleGoodsDTO() {
    }

    public SimpleGoodsDTO(String name, BigDecimal reduction, BigDecimal price, short star) {
        this.name = name;
        this.reduction = reduction;
        this.price = price;
        this.star = star;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getReduction() {
        return reduction;
    }

    public void setReduction(BigDecimal reduction) {
        this.reduction = reduction;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public short getStar() {
        return star;
    }

    public void setStar(short star) {
        this.star = star;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public boolean isIslike() {
        return islike;
    }

    public void setIslike(boolean islike) {
        this.islike = islike;
    }
}
