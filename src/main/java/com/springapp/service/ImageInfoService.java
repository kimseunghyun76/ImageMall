package com.springapp.service;

import com.springapp.domain.ImageInfoVo;
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
@Service("ImageInfoService")
public class ImageInfoService {

    @Autowired
    private ImageInfoMapper imageInfoMapper;

    public List<ImageInfoVo> selectList(ImageInfoVo imageInfoVo) throws Exception{
        return imageInfoMapper.selectList(imageInfoVo);
    }

    public int selectListCount(ImageInfoVo imageInfoVo) throws Exception{
        return imageInfoMapper.selectListCount(imageInfoVo);
    }

    public List<ImageInfoVo> selectGrantList(ImageInfoVo imageInfoVo) throws Exception{
        return imageInfoMapper.selectGrantList(imageInfoVo);
    }

    public int selectGrantListCount(ImageInfoVo imageInfoVo) throws Exception{
        return imageInfoMapper.selectGrantListCount(imageInfoVo);
    }

    public ImageInfoVo selectInfo(ImageInfoVo imageInfoVo) throws Exception{
        return imageInfoMapper.selectInfo(imageInfoVo);
    }

    public int insert(ImageInfoVo imageInfoVo) throws Exception{
        int chk = imageInfoMapper.insert(imageInfoVo);
        return chk;
    }

    public int update(ImageInfoVo imageInfoVo) throws Exception{
        int chk = imageInfoMapper.update(imageInfoVo);
        return chk;
    }

    public int delete(ImageInfoVo imageInfoVo) throws Exception{
        int chk = imageInfoMapper.delete(imageInfoVo);
        return chk;
    }


}


