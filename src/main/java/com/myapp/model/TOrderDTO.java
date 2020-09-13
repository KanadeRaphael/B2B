package com.myapp.model;

public class TOrderDTO {
    private int address;
    private int[] goods_id;
    private String[] color;
    private int[] number;
    private int type;

    public int getAddress() {
        return address;
    }

    public void setAddress(int address) {
        this.address = address;
    }

    public int[] getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int[] goods_id) {
        this.goods_id = goods_id;
    }

    public String[] getColor() {
        return color;
    }

    public void setColor(String[] color) {
        this.color = color;
    }

    public int[] getNumber() {
        return number;
    }

    public void setNumber(int[] number) {
        this.number = number;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
