package org.goshop.common.context;

/**
 * Created by Administrator on 2016/4/11.
 */
public interface MessageService {

    void set(String key, MessageInfo value);

    MessageInfo get(String key);
}
