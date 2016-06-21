package org.goshop.users.service;

import com.github.pagehelper.PageInfo;
import org.goshop.common.exception.MapperException;
import org.goshop.common.utils.PageUtils;
import org.goshop.common.utils.RandomUtils;
import org.goshop.common.utils.RegexValidateUtil;
import org.goshop.email.i.EMailService;
import org.goshop.shiro.service.PasswordService;
import org.goshop.users.i.AdminService;
import org.goshop.users.i.FindPasswordService;
import org.goshop.users.i.MemberService;
import org.goshop.users.i.UserService;
import org.goshop.users.mapper.master.MemberMapper;
import org.goshop.users.pojo.Member;
import org.goshop.users.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberMapper memberMapper;

    @Autowired
    UserService userService;

    @Autowired
    AdminService adminService;

    @Autowired
    FindPasswordService findPasswordService;

    @Autowired
    EMailService eMailService;

    @Autowired
    PasswordService passwordService;

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

    @Override
    public Boolean checkLoginNameByEmail(String loginName, String email) {
        int count=memberMapper.checkLoginNameByEmail(loginName, email);
        if(count>0){
            return false;
        }
        return true;
    }

    @Override
    public void sendEmailFindPassword(String username, String email) {
        String emailContent = findPasswordService.getContent(username);
        eMailService.send(email,"找回密码",emailContent);
    }


    @Override
    public void updatePassword(String key, String password) throws Exception {
        findPasswordService.deleteInvalid();
        String loginName=findPasswordService.findByKey(key);
        if(StringUtils.hasText(loginName)){
            User user=userService.findByLoginName(loginName);
            user.setPassword(password);
            userService.updateByPrimaryKey(passWordUser(user));
            findPasswordService.delete(key);
        }else{
            throw new Exception("此链接已过期!");
        }

    }

    @Override
    public void updatePassword(Long userId, String password) throws Exception {
        User user=userService.selectByPrimaryKey(userId);
        user.setPassword(password);
        userService.updateByPrimaryKey(passWordUser(user));
    }
    /**
     * 将密码加密
     * @param user
     * @return
     */
    private  User passWordUser(User user){

        if(StringUtils.hasText(user.getPassword())){
            String salt= RandomUtils.generateString(5);
            user.setPassword(passwordService.encryptPassword(user.getPassword(),salt));
            user.setSalt(salt);
        }
        return user;
    }

    @Override
    public Member findUserByUserId(Long userId) {
        return memberMapper.findUserByUserId(userId);
    }

    @Override
    public int updateByUserId(Member member) {
        return memberMapper.updateByUserId(member);
    }

    @Override
    public Boolean checkPassword(Long userId, String password) {
        User user=userService.selectByPrimaryKey(userId);
        Assert.notNull(user,"没有此用户！");
        String ciphertext=passwordService.encryptPassword(password,user.getSalt());
        if(ciphertext.equals(user.getPassword())){
            return true;
        }
        return false;
    }

    @Override
    public int updateEmail(Long userId, String email) {
        if(checkEmail(email)) {
            return memberMapper.updateEmail(userId,email);
        }else{
            throw new MapperException("邮件已被使用！");
        }
    }

    @Override
    public Boolean checkEmail(String memberEmail) {
        int count=memberMapper.findByMemberEmailCount(memberEmail);
        if(count>0){
            return false;
        }
        return true;
    }

    @Override
    public int saveAvatar(Long userId, String memberAvatar) {
        return memberMapper.saveAvatar(userId,memberAvatar);
    }

    @Override
    public int saveMember(Member member,User user) {
        //判断用户名是否符合规范
        Assert.isTrue(RegexValidateUtil.checkLoginUser(user.getLoginName())==false,"登录名不能为空，并且在字母开头2~9为数字或字母的组合！");
        //判断登录名是否重复
        Assert.isTrue(this.checkLoginName(user.getLoginName()), "登录名已经存在！");
        //判断邮件是否符合规范
        Assert.isTrue(RegexValidateUtil.checkEmail(member.getMemberEmail()),"邮件填写错误!");
        //判断邮件是否重复
        Assert.isTrue(this.checkEmail(member.getMemberEmail()), "此邮件已经注册！");
        //验证密码格式
        Assert.isTrue(RegexValidateUtil.checkPassword(user.getPassword()), "以字母开头,长度在6~18之间,只能包含字符、数字和下划线!");
        //密码加密、设置盐值
        user=this.passWordUser(user);
        user=this.setDefaultUser(user);
        userService.insert(user);
        member=this.setDefaultMember(member,user.getId());
        return memberMapper.insert(member);

    }

    public User setDefaultUser(User user) {
        user.setUpcreated(new Timestamp(System.currentTimeMillis()));
        user.setCreated(new Timestamp(System.currentTimeMillis()));
        user.setType(1);
        user.setEnable(1);
        return user;
    }

    public Member setDefaultMember(Member member,Long userId) {
        member.setUserId(userId);
        member.setMemberTime(new Timestamp(System.currentTimeMillis()));
        //是否允许举报(1可以/2不可以)
        member.setInformAllow(1);
        //会员是否有购买权限 1为开启 0为关闭
        member.setIsBuy(1);
        //会员是否有咨询和发送站内信的权限 1为开启 0为关闭
        member.setIsAllowtalk(1);
        //会员的开启状态 1为开启 0为关闭
        member.setMemberState(1);
        //会员积分
        member.setMemberPoints(0);
        //预存款可用金额
        member.setAvailablePredeposit(new BigDecimal(0));
        //预存款冻结金额
        member.setFreezePredeposit(new BigDecimal(0));
        //会员信用
        member.setMemberCredit(0);
        return member;
    }
}
