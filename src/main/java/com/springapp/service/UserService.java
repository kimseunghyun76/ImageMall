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


    public int selectIDCount(UserVo userVo) throws Exception{
        return userMapper.selectIDCount(userVo);
    }

    public int insert(UserVo userVo) throws Exception{



        int chk = userMapper.insert(userVo);

        userMapper.insertUserRole(userVo);

        if(userVo.getUser_role().equals("2")){
            //관리자 (USER, ADMIN)
            userMapper.insertAdminRole(userVo);
        }

        if(userVo.getUser_role().equals("3")){
            //슈퍼 관리자 (USER, ADMIN, SUPERADMIN)
            userMapper.insertAdminRole(userVo);
            userMapper.insertSuperAdminRole(userVo);
        }

        return chk;
    }

    public int update(UserVo userVo) throws Exception{
        int chk = userMapper.update(userVo);

        userMapper.roleDelete(userVo);

        userMapper.insertUserRole(userVo);


        if(userVo.getUser_role().equals("2")){
            //관리자 (USER, ADMIN)
            userMapper.insertAdminRole(userVo);
        }

        if(userVo.getUser_role().equals("3")){
            //슈퍼 관리자 (USER, ADMIN, SUPERADMIN)
            userMapper.insertAdminRole(userVo);
            userMapper.insertSuperAdminRole(userVo);
        }


        return chk;
    }

    public int delete(UserVo userVo) throws Exception{
        userMapper.roleDelete(userVo);
        int chk = userMapper.delete(userVo);
        return chk;
    }
}
