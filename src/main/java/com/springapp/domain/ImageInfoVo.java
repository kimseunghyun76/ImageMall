package com.springapp.domain;


import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by Helloworld
 * User : USER
 * Date : 2015-11-14
 * Time : 오후 5:52
 * To change this template use File | Settings | File and Code Templates.
 */
public class ImageInfoVo extends CommonVo {

    private List<MultipartFile> imageFiles;
    private List<String> fileNames;

    private int image_seq;   //image_info sequence
    private String category_seq;
    private String group_seq;
    private String shop_seq;
    private String image_type;  //default 1
    private String product_code;
    private String product_name;
    private String urlinfo;

    private String category_name;
    private String group_name;
    private String shop_name;
    private String user_id;
    private String user_role;

    //TODO : 우선 String으로 하고, 이후에 각 데이터 타입별로 변경


    public List<MultipartFile> getImageFiles() {
        return imageFiles;
    }

    public void setImageFiles(List<MultipartFile> imageFiles) {
        this.imageFiles = imageFiles;
    }

    public List<String> getFileNames() {
        return fileNames;
    }

    public void setFileNames(List<String> fileNames) {
        this.fileNames = fileNames;
    }

    public int getImage_seq() {
        return image_seq;
    }

    public void setImage_seq(int image_seq) {
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

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getGroup_name() {
        return group_name;
    }

    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }

    public String getShop_name() {
        return shop_name;
    }

    public void setShop_name(String shop_name) {
        this.shop_name = shop_name;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_role() {
        return user_role;
    }

    public void setUser_role(String user_role) {
        this.user_role = user_role;
    }
}
