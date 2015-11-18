package com.springapp.service;

import com.springapp.domain.UserVo;
import com.springapp.persistence.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by jooyoung on 2015-11-19.
 */
@Service("UserService")
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public List<UserVo> selectList(UserVo userVo) throws Exception{
        return userMapper.selectList(userVo);
    }

    public int selectListCount(UserVo userVo) throws Exception{
        return userMapper.selectListCount(userVo);
    }

    public UserVo selectInfo(UserVo userVo) throws Exception{
        return userMapper.selectInfo(userVo);
    }

    public int insert(UserVo userVo) throws Exception{
        int chk = userMapper.insert(userVo);
        return chk;
    }

    public int update(UserVo userVo) throws Exception{
        int chk = userMapper.update(userVo);
        return chk;
    }

    public int delete(UserVo userVo) throws Exception{
        int chk = userMapper.delete(userVo);
        return chk;
    }
}
