package com.springapp.persistence;

import com.springapp.domain.ImageFileInfoVo;
import com.springapp.domain.ImageInfoVo;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * Created by Helloworld
 * User : USER
 * Date : 2015-11-14
 * Time : 오후 7:48
 * To change this template use File | Settings | File and Code Templates.
 */
public interface ImageFileInfoMapper {
    //리스트 가져오기
    public List<ImageFileInfoVo> selectList(ImageFileInfoVo imageFileInfoVo) throws DataAccessException;
    //등록 하기
    public int insert(ImageFileInfoVo imageFileInfoVo) throws DataAccessException;
    //삭제 하기
    public int deleteAll(ImageFileInfoVo imageFileInfoVo) throws DataAccessException;

    //삭제 하기
    public int delete(ImageFileInfoVo imageFileInfoVo) throws DataAccessException;

}
