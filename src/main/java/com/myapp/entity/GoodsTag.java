package com.myapp.entity;

import javax.persistence.*;

@Entity
@Table(name = "goodstag")
public class GoodsTag implements Comparable<GoodsTag>{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "tag", nullable = false, length = 50)
    private String tag; //商品名
    @Column(name = "count", nullable = false, length = 50)
    private int count; //商品名
    @ManyToOne(fetch = FetchType.LAZY)  //一个商品多个tag
    @JoinColumn(name = "goods_id", referencedColumnName = "id")
    private Goods goods;

    public GoodsTag() {
    }

    public GoodsTag(String tag, int count, Goods goods) {
        this.tag = tag;
        this.count = count;
        this.goods = goods;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    @Override
    public int compareTo(GoodsTag t) {
        if (this.count >= t.getCount()) {
            return 1;
        }
        return -1;
    }
}
