package org.goshop.users.i;

/**
 * Created by Administrator on 2016/5/8.
 */
public interface AdminService {
    /**
     * 获取该用户是否为管理员，1为是
     * @param userId
     * @return
     */
    Integer getIsAdmin(Long userId);

    /**
     * 设置、取消管理员
     * @param isAdmin
     * @return
     */
    void setAdmin(Long userId, Integer isAdmin);
}
