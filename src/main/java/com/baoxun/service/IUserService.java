package com.baoxun.service;


import com.baoxun.po.User;

import java.util.List;

public interface IUserService {
    /*注册*/
    void userSign(User user);
    /*登陆验证*/
    User userLogin(User user);
    /*主页用户信息修改*/
    void updataUser(User user);
    /*查询用户列表*/
    List<User> getUserlist(User user);
    /*查询用户数量*/
    int getUserTotal(User user);
    /*添加用户*/
    void addUser(User user);
    /*用户名注册添加重复判断*/
    int checkUsername(String username);
    /*修改用户信息*/
    void updateuserall(User user);
    /*删除用户信息*/
    void deluser(int id);
    /*批量删除*/
    void delmoreuser(Integer[] del);

}
