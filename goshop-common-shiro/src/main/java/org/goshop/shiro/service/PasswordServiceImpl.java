package org.goshop.shiro.service;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PasswordServiceImpl implements PasswordService {

    @Autowired
    HashedCredentialsMatcher credentialsMatcher;

    @Override
    public String encryptPassword(String password, String salt) {
        int hashIterations=credentialsMatcher.getHashIterations();
        String hashAlgorithmName=credentialsMatcher.getHashAlgorithmName();
        return new SimpleHash(hashAlgorithmName, password, ByteSource.Util.bytes(salt), hashIterations).toHex();

    }
}
