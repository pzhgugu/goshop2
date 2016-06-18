package org.goshop.users.i;

import com.github.pagehelper.PageInfo;
import org.goshop.users.pojo.Member;

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
}
