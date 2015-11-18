package com.springapp.persistence;

import com.springapp.domain.ImageInfoVo;
import com.springapp.domain.UserVo;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * Created by jooyoung on 2015-11-19.
 */
public interface UserMapper {
    //리스트 가져오기
    public List<UserVo> selectList(UserVo userVo) throws DataAccessException;
    //리스트 카운트 가져오기
    public int selectListCount(UserVo userVo) throws DataAccessException;

    //단일 제품 가져오기
    public ImageInfoVo selectInfo(UserVo userVo) throws DataAccessException;
    //등록 하기
    public int insert(UserVo userVo) throws DataAccessException;
    //수정 하기
    public int update(UserVo userVo) throws DataAccessException;
    //삭제 하기
    public int delete(UserVo userVo) throws DataAccessException;
}
