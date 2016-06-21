package org.goshop.users.i;

/**
 * Created by Administrator on 2016/3/21.
 */
public interface FindPasswordService {
    String getContent(String username);

    int saveFindPassword(String username, String key);

    void deleteInvalid();

    String findByKey(String key);

    void delete(String key);
}
