package com.springapp.persistence2;

import com.springapp.domain.ImageInfoVo;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * Created by jooyoung on 2015-11-25.
 */
public interface ProductMapper {
    //리스트 가져오기
    public List<ImageInfoVo> selectList(ImageInfoVo imageInfoVo) throws DataAccessException;
    //리스트 카운트 가져오기
    public int selectListCount(ImageInfoVo imageInfoVo) throws DataAccessException;
}
