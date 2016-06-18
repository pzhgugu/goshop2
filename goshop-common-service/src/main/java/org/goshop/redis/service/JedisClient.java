package org.goshop.redis.service;

import java.util.Set;

/**
 * Created by Administrator on 2016/3/13.
 */
public interface JedisClient {
    /**
     * 获取缓存
     * @param key
     * @return
     */
    String get(String key);

    byte[] get(byte[] key);

    /**
     * 设置缓存
     * @param key
     * @param value
     * @return
     */
    String set(String key, String value);

    /**
     * 设置缓存
     * @param key
     * @param value
     * @param expire 过去时间
     * @return
     */
    String set(String key, String value, int expire);

    String set(byte[] key, byte[] value);

    String set(byte[] key, byte[] value, int expire);

    /**
     * 哈希 获取缓存
     * @param hkey
     * @param key
     * @return
     */
    String hget(String hkey, String key);

    /**
     * 哈希 设置缓存
     * @param hkey
     * @param key
     * @param value
     * @return
     */
    long hset(String hkey, String key, String value);

    /**
     *获取自增值
     * @param key
     * @return
     */
    long incr(String key);

    /**
     *设置有效期
     * @param key
     * @param second
     * @return
     */
    long expire(String key, int second);

    /**
     *获取有效期
     * @param key
     * @return
     */
    long ttl(String key);

    /**
     * 删除缓存
     * @param key
     * @return
     */
    long del(String key);

    long del(byte[] key);

    /**
     * 删除哈希 缓存
     * @param hkey
     * @param key
     * @return
     */
    long hdel(String hkey, String key);

    Set<byte[]> keys(String pattern);

    /**
     * 刷新数据
     */
    void flushDB();

    Long dbSize();
}
