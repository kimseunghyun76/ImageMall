package com.springapp.service;

import com.springapp.domain.ImageInfoVo;
import com.springapp.persistence2.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jooyoung on 2015-11-28.
 */
@Service("ProductService")
public class ProductService {

    @Autowired
    private ProductMapper productMapper;

    public List<ImageInfoVo> selectList(ImageInfoVo imageInfoVo) throws Exception{
        return productMapper.selectList(imageInfoVo);
    }

    public int selectListCount(ImageInfoVo imageInfoVo) throws Exception{
        return productMapper.selectListCount(imageInfoVo);
    }
}
