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
public class ImageInfoVo extends UserVo {

    private List<MultipartFile> imageFiles;
    private List<String> fileNames;

    private int image_seq;   //image_info sequence
    private String image_seqs;
    private String image_type;  //default 1
    private String product_code;
    private String product_name;
    private String urlinfo;
    private String status;
    //싱글로만
    private String image_name;

    public String getImage_seqs() {
        return image_seqs;
    }

    public void setImage_seqs(String image_seqs) {
        this.image_seqs = image_seqs;
    }

//TODO : 우선 String으로 하고, 이후에 각 데이터 타입별로 변경

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

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

    public String getImage_name() {
        return image_name;
    }

    public void setImage_name(String image_name) {
        this.image_name = image_name;
    }
}
