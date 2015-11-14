package com.springapp.domain;


/**
 * Created by Helloworld
 * User : USER
 * Date : 2015-11-14
 * Time : 오후 5:52
 * To change this template use File | Settings | File and Code Templates.
 */
public class ImageInfoVo extends CommonVo {


    private String image_seq;   //image_info sequence
    private String category_seq;
    private String group_seq;
    private String shop_seq;
    private String image_type;  //default 1
    private String connection_type;  //default 1
    private String product_seq;
    private String product_code;
    private String product_name;
    private String urlinfo;

    //TODO : 우선 String으로 하고, 이후에 각 데이터 타입별로 변경


    public String getImage_seq() {
        return image_seq;
    }

    public void setImage_seq(String image_seq) {
        this.image_seq = image_seq;
    }

    public String getCategory_seq() {
        return category_seq;
    }

    public void setCategory_seq(String category_seq) {
        this.category_seq = category_seq;
    }

    public String getGroup_seq() {
        return group_seq;
    }

    public void setGroup_seq(String group_seq) {
        this.group_seq = group_seq;
    }

    public String getShop_seq() {
        return shop_seq;
    }

    public void setShop_seq(String shop_seq) {
        this.shop_seq = shop_seq;
    }

    public String getImage_type() {
        return image_type;
    }

    public void setImage_type(String image_type) {
        this.image_type = image_type;
    }

    public String getConnection_type() {
        return connection_type;
    }

    public void setConnection_type(String connection_type) {
        this.connection_type = connection_type;
    }

    public String getProduct_seq() {
        return product_seq;
    }

    public void setProduct_seq(String product_seq) {
        this.product_seq = product_seq;
    }

    public String getProduct_code() {
        return product_code;
    }

    public void setProduct_code(String product_code) {
        this.product_code = product_code;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getUrlinfo() {
        return urlinfo;
    }

    public void setUrlinfo(String urlinfo) {
        this.urlinfo = urlinfo;
    }
}
