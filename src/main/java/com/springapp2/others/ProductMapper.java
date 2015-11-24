package com.springapp2.others;

import com.springapp2.others.ProductVo;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * Created by jooyoung on 2015-11-25.
 */
public interface ProductMapper {
    //리스트 가져오기
    public List<ProductVo> selectList(ProductVo productVo) throws DataAccessException;
    //리스트 카운트 가져오기
    public int selectListCount(ProductVo productVo) throws DataAccessException;
}
