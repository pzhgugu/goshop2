package org.goshop.shiro.service;

/**
 * Created by Administrator on 2016/3/12.
 */
public interface PasswordService {
    String encryptPassword(String password, String salt);
}
