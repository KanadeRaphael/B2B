package com.myapp.model;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadRVDTO {
    private CommonsMultipartFile[] imgUp;
    private int goods_id;
    private short quality = (short)10;
    private short price = (short)10;
    private short value = (short)10;
    private String content = "";
    private String tag = "";

    public UploadRVDTO() {
    }

    public UploadRVDTO(CommonsMultipartFile[] imgUp, int goods_id, short quality, short price, short value, String content, String tag) {
        this.imgUp = imgUp;
        this.goods_id = goods_id;
        this.quality = quality;
        this.price = price;
        this.value = value;
        this.content = content;
        this.tag = tag;
    }

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }

    public short getQuality() {
        return quality;
    }

    public void setQuality(short quality) {
        this.quality = quality;
    }

    public short getPrice() {
        return price;
    }

    public void setPrice(short price) {
        this.price = price;
    }

    public short getValue() {
        return value;
    }

    public void setValue(short value) {
        this.value = value;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public CommonsMultipartFile[] getImgUp() {
        return imgUp;
    }

    public void setImgUp(CommonsMultipartFile[] imgUp) {
        this.imgUp = imgUp;
    }
}
