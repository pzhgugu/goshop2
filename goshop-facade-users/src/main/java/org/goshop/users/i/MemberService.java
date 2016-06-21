package org.goshop.users.i;

import com.github.pagehelper.PageInfo;
import org.goshop.users.pojo.Member;
import org.goshop.users.pojo.User;

/**
 * Created by Administrator on 2016/4/18.
 */
public interface MemberService {
    PageInfo<Member> findAll(Integer curPage, Integer pageSize);

    PageInfo<Member> findUserAll(Integer curPage, Integer pageSize);

    Member findOne(Long memberId);

    Boolean checkEmail(String memberEmail, Long memberId);

    int update(String password, Member member);

    PageInfo<Member> query(String searchFieldName, String searchFieldValue, String searchSort, String searchState, Integer curPage, Integer pageSize);

    Boolean checkLoginName(String loginName);

    int add(String loginName, String password, Member member);

    int addAndSetAdmin(String loginName, String password, Member member);

    /**
     * 检查用户下是否有此电子邮件
     * @param loginName
     * @param email
     * @return
     */
    Boolean checkLoginNameByEmail(String loginName, String email);
    /**
     * 发送邮件找回密码
     * @param username
     * @param email
     */
    void sendEmailFindPassword(String username, String email);

    void updatePassword(String key,String password) throws Exception;

    void updatePassword(Long userId,String password) throws Exception;

    Member findUserByUserId(Long userId);

    int updateByUserId(Member member);

    Boolean checkPassword(Long userId, String password);

    int updateEmail(Long userId, String email);
    /**
     * 检测邮件
     * @param memberEmail true为已存在这个邮件
     * @return
     */
    Boolean checkEmail(String memberEmail);

    int saveAvatar(Long userId, String memberAvatar);

    /**
     * 保存用户数据
     * @param member
     * @return
     */
    int saveMember(Member member,User user);
}
