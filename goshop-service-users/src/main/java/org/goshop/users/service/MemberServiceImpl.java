package org.goshop.users.service;

import com.github.pagehelper.PageInfo;
import org.goshop.common.exception.MapperException;
import org.goshop.common.utils.PageUtils;
import org.goshop.users.i.AdminService;
import org.goshop.users.i.MemberService;
import org.goshop.users.i.UserService;
import org.goshop.users.mapper.master.MemberMapper;
import org.goshop.users.pojo.Member;
import org.goshop.users.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberMapper memberMapper;

    @Autowired
    UserService userService;

    @Autowired
    AdminService adminService;

    @Override
    public PageInfo<Member> findAll(Integer curPage, Integer pageSize) {
        PageUtils.startPage(curPage,pageSize);
        List<Member> list = memberMapper.findAll();
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<Member> findUserAll(Integer curPage, Integer pageSize) {
        PageUtils.startPage(curPage,pageSize);
        List<Member> list = memberMapper.findUserAll();
        return new PageInfo<>(list);
    }

    @Override
    public Member findOne(Long memberId) {
        return memberMapper.selectByPrimaryKey(memberId);
    }

    @Override
    public Boolean checkEmail(String memberEmail, Long memberId) {
        Member member=memberMapper.findByMemberEmail(memberEmail);
        if(member==null){
            return true;
        }else if(member.getMemberId()==memberId){
            return true;
        }
        return false;
    }

    @Override
    public Boolean checkLoginName(String loginName) {
        User user=userService.findByLoginName(loginName);
        if(user==null) {
            return true;
        }
        return false;
    }

    @Override
    public int add(String loginName, String password, Member member) {
        if(!checkEmail(member.getMemberEmail(),null)){
            throw new MapperException("电子邮件重复");
        }
        User user = new User();
        user.setLoginName(loginName);
        user.setPassword(password);
        userService.save(user);
        member.setUserId(user.getId());
        return memberMapper.insertSelective(member);
    }

    @Override
    public int addAndSetAdmin(String loginName, String password, Member member) {
        this.add(loginName,password,member);
        adminService.setAdmin(member.getUserId(),member.getIsAdmin());
        return 1;
    }

    @Override
    public int update(String password, Member member) {
        if(StringUtils.hasText(password)){
            User user = new User();
            user.setId(member.getUserId());
            user.setPassword(password);
            userService.updateByPrimaryKeySelective(user);
        }
        return memberMapper.updateByPrimaryKeySelective(member);
    }

    @Override
    public PageInfo<Member> query(String searchFieldName, String searchFieldValue, String searchSort, String searchState, Integer curPage, Integer pageSize) {
        PageUtils.startPage(curPage,pageSize);
        //登录名
        String loginName=null;
        //email
        String memberEmail=null;
        //真实姓名
        String memberTruename=null;
        //禁止举报
        Integer informAllow=null;
        //禁止购买
        Integer isBuy=null;
        //禁止发送消息
        Integer isAllowtalk=null;
        //禁止登录
        Integer memberState=null;
        //排序字段
        String sort=null;
        if(StringUtils.hasText(searchFieldName)&&StringUtils.hasText(searchFieldValue)) {
            switch (searchFieldName){
                case "member_name":
                    loginName = searchFieldValue;
                    break;
                case "member_email":
                    memberEmail=searchFieldValue;
                    break;
                case "member_truename":
                    memberTruename=searchFieldValue;
                    break;
            }
        }
        if(StringUtils.hasText(searchState)){
            switch (searchState){
                case "no_informallow":
                    informAllow = 2;
                    break;
                case "no_isbuy":
                    isBuy=0;
                    break;
                case "no_isallowtalk":
                    isAllowtalk=0;
                    break;
                case "no_memberstate":
                    memberState=0;
                    break;
            }
        }
        List<Member> list = memberMapper.query(loginName, memberEmail, memberTruename, informAllow, isBuy, isAllowtalk, memberState, sort);
        return new PageInfo<>(list);
    }
}
