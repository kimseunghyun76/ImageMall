package com.springapp.service;

import com.springapp.domain.ImageFileInfoVo;
import com.springapp.domain.ImageInfoVo;
import com.springapp.persistence.ImageFileInfoMapper;
import com.springapp.persistence.ImageInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Helloworld
 * User : USER
 * Date : 2015-11-14
 * Time : 오후 6:30
 * To change this template use File | Settings | File and Code Templates.
 */
@Service("ImageFileInfoService")
public class ImageFileInfoService {

    @Autowired
    private ImageFileInfoMapper imageFileInfoMapper;

    public List<ImageFileInfoVo> selectList(ImageFileInfoVo imageFileInfoVo) throws Exception{
        return imageFileInfoMapper.selectList(imageFileInfoVo);
    }

    public int insert(ImageFileInfoVo imageFileInfoVo) throws Exception{
        int chk = imageFileInfoMapper.insert(imageFileInfoVo);
        return chk;
    }

    public int deleteAll(ImageFileInfoVo imageFileInfoVo) throws Exception{
        int chk = imageFileInfoMapper.deleteAll(imageFileInfoVo);
        return chk;
    }


    public int delete(ImageFileInfoVo imageFileInfoVo) throws Exception{
        int chk = imageFileInfoMapper.delete(imageFileInfoVo);
        return chk;
    }

}


