package com.springapp.persistence;

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
public interface ImageInfoMapper {
    //리스트 가져오기
    public List<ImageInfoVo> selectList(ImageInfoVo imageInfoVo) throws DataAccessException;
    //리스트 카운트 가져오기
    public int selectListCount(ImageInfoVo imageInfoVo) throws DataAccessException;

    //리스트 가져오기
    public List<ImageInfoVo> selectGrantList(ImageInfoVo imageInfoVo) throws DataAccessException;
    //리스트 카운트 가져오기
    public int selectGrantListCount(ImageInfoVo imageInfoVo) throws DataAccessException;

    //단일 제품 가져오기
    public ImageInfoVo selectInfo(ImageInfoVo imageInfoVo) throws DataAccessException;
    //등록 하기
    public int insert(ImageInfoVo imageInfoVo) throws DataAccessException;
    //수정 하기
    public int update(ImageInfoVo imageInfoVo) throws DataAccessException;
    //삭제 하기
    public int delete(ImageInfoVo imageInfoVo) throws DataAccessException;
}
