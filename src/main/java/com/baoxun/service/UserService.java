package com.baoxun.service;

import com.baoxun.mapper.IUserMapper;
import com.baoxun.po.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService implements IUserService{
    @Resource
    private IUserMapper userMapper;

    @Override
    /*用户注册*/
    public void userSign(User user) {
        userMapper.userSign(user);
    }
    /*登陆验证*/
    @Override
    public User userLogin(User user) {
        return userMapper.userLogin(user);
    }

    @Override
    public void updataUser(User user) {
        userMapper.updataUser(user);
    }
    /*获得用户列表*/
    @Override
    public List<User> getUserlist(User user) {
        int pageNow = (user.getPagenow() - 1) * user.getPagesize();
        String pname = "%"+user.getUsername();
        user.setUsername(pname);
        user.setPagenow(pageNow);
        return userMapper.getUserlist(user);
    }
    /*获得用户数量用于分页*/
    @Override
    public int getUserTotal(User user) {
        String pname = "%"+user.getUsername();
        user.setUsername(pname);
        return userMapper.getUserTotal(user);
    }

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public int checkUsername(String username) {
        return userMapper.checkUsername(username);
    }

    @Override
    public void updateuserall(User user) {
        userMapper.updateuserall(user);
    }

    @Override
    public void deluser(int id) {
        userMapper.deluser(id);
    }

    @Override
    public void delmoreuser(Integer[] del) {
        userMapper.delmoreuser(del);
    }
}
