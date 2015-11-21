package com.springapp.persistence;

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
    //ID 중복 카운트 가져오기
    public int selectIDCount(UserVo userVo) throws DataAccessException;



    //단일 제품 가져오기
    public UserVo selectInfo(UserVo userVo) throws DataAccessException;
    //등록 하기
    public int insert(UserVo userVo) throws DataAccessException;
    //수정 하기
    public int update(UserVo userVo) throws DataAccessException;
    //삭제 하기
    public int delete(UserVo userVo) throws DataAccessException;

    //Role만 별도로 넣어주자
    public int insertUserRole(UserVo userVo) throws DataAccessException;
    public int insertAdminRole(UserVo userVo) throws DataAccessException;
    public int insertSuperAdminRole(UserVo userVo) throws DataAccessException;

    public int roleDelete(UserVo userVo) throws DataAccessException;


}
