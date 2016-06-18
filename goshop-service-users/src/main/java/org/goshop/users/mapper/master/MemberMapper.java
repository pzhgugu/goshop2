package org.goshop.users.mapper.master;

import org.goshop.users.pojo.Member;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemberMapper {
    int deleteByPrimaryKey(Long memberId);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(Long memberId);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);

    int findByMemberEmailCount(String memberEmail);

    int checkLoginNameByEmail(@Param("loginName") String loginName, @Param("memberEmail") String memberEmail);

    List<Member> findAll();

    List<Member> findUserAll();

    Member findByMemberEmail(@Param("memberEmail") String memberEmail);

    /**
     *
     * @param loginName 登录名
     * @param memberEmail
     * @param memberTruename 真实姓名
     * @param informAllow 禁止举报
     * @param isBuy 禁止购买
     * @param isAllowtalk 禁止发送消息
     * @param memberState 禁止登录
     * @param sort 排序字段
     * @return
     */
    List<Member> query(@Param("loginName") String loginName, @Param("memberEmail") String memberEmail,
                       @Param("memberTruename") String memberTruename, @Param("informAllow") Integer informAllow,
                       @Param("isBuy") Integer isBuy, @Param("isAllowtalk") Integer isAllowtalk,
                       @Param("memberState") Integer memberState, @Param("sort") String sort);

    Member findUserByUserId(@Param("userId") Long userId);

    int updateByUserId(Member member);

    int updateEmail(@Param("userId") Long userId, @Param("memberEmail") String email);

    int saveAvatar(@Param("userId") Long userId, @Param("memberAvatar") String memberAvatar);
}