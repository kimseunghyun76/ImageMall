package com.springapp2.others;

import com.springapp2.others.ProductVo;
import com.springapp2.others.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jooyoung on 2015-11-25.
 */
@Service("ProductService")
public class ProductService {

    @Autowired
    private ProductMapper productMapper;

    public List<ProductVo> selectList(ProductVo productVo) throws Exception{
        return productMapper.selectList(productVo);
    }

    public int selectListCount(ProductVo productVo) throws Exception{
        return productMapper.selectListCount(productVo);
    }
}
