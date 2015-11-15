package com.springapp.domain;

/**
 * Created by Helloworld
 * User : USER
 * Date : 2015-11-15
 * Time : 오후 5:57
 * To change this template use File | Settings | File and Code Templates.
 */
public class ImageFileInfoVo {
    private int image_files_seq ;   //image_file_info sequence
    private int image_seq;   //image_info sequence
    private String image_name;  //파일명이죠.

    public int getImage_files_seq() {
        return image_files_seq;
    }

    public void setImage_files_seq(int image_files_seq) {
        this.image_files_seq = image_files_seq;
    }

    public int getImage_seq() {
        return image_seq;
    }

    public void setImage_seq(int image_seq) {
        this.image_seq = image_seq;
    }

    public String getImage_name() {
        return image_name;
    }

    public void setImage_name(String image_name) {
        this.image_name = image_name;
    }
}
