<#assign S_URL=request.contextPath />
<!DOCTYPE html>
<html>
<head>
    <meta content="IE=edge;chrome=1" http-equiv="X-UA-Compatible">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>会员管理</title>

    <script src="${S_COMMON_URL}/scripts/jquery/jquery.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/waypoints.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.validation.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js"></script>
    <script src="${S_COMMON_URL}/scripts/utils/area_array.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common.js"></script>
    <script src="${S_URL}/static/scripts/admincp.js"></script>
    <link id="cssfile2" type="text/css" rel="stylesheet" href="${S_URL}/static/styles/skin_0.css">
    <script type="text/javascript">
        SITEURL = '${S_URL}';
    </script>
</head>

<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>

<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>会员管理</h3>
            <ul class="tab-base">
                <li><a href="${S_URL}/member/member"><span>管理</span></a></li>
                <li><a href="${S_URL}/member/add"><span>新增</span></a></li>
                <li><a class="current" href="JavaScript:void(0);"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" enctype="multipart/form-data" id="user_form">
        <input type="hidden" value="${P_MEMBER.memberId}" name="memberId">
        <input type="hidden" value="${P_MEMBER.userId}" name="userId">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>会员:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">${P_MEMBER.loginName!}</td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="member_passwd">密码:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" name="member_passwd" id="member_passwd"></td>
                <td class="vatop tips">留空表示不修改密码</td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="memberEmail" class="validation">电子邮箱:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">
                    <input type="text" class="txt" name="memberEmail" id="memberEmail" value="${P_MEMBER.memberEmail}"></td>
                <td class="vatop tips">电子邮箱</td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="memberTruename">真实姓名:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">
                    <input type="text" class="txt" name="memberTruename" id="memberTruename" value="${P_MEMBER.memberTruename!}"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>性别:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><ul>
                    <li>
                        <input type="radio" id="member_sex0" name="memberSex" value="0" <#if P_MEMBER.memberSex==0>checked="checked"</#if>  >
                        <label for="member_sex0">保密</label>
                    </li>
                    <li>
                        <input type="radio" id="member_sex1" name="memberSex" value="1" <#if P_MEMBER.memberSex==1>checked="checked"</#if>>
                        <label for="member_sex1">男</label>
                    </li>
                    <li>
                        <input type="radio" id="member_sex2" name="memberSex" value="2" <#if P_MEMBER.memberSex==2>checked="checked"</#if>>
                        <label for="member_sex2">女</label>
                    </li>
                </ul></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label class="memberQq">QQ:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="memberQq" id="memberQq" value="${P_MEMBER.memberQq!}"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label class="memberWw">阿里旺旺:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="memberWw" id="memberWw" value="${P_MEMBER.memberWw!}"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label>头像:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
			<span class="type-file-show">
			<img src="${S_COMMON_URL}/images/preview.png" class="show_image">
			<div style="display: none;" class="type-file-preview"><img id="view_img" src="<#if (P_MEMBER.memberAvatar??&&P_MEMBER.memberAvatar!='')>${S_URL}/att?path=${P_MEMBER.memberAvatar}<#else>${S_COMMON_URL}/images/default_user_portrait.gif</#if>"> </div>
			</span>
            <span class="type-file-box">
              <input type="text" class="type-file-text" id="memberAvatar" name="memberAvatar">
              <input type="button" class="type-file-button" value="" id="button" name="button">
              <input type="file" hidefocus="true" size="30" id="_pic" class="type-file-file" name="_pic">
            </span>
                </td>
                <td class="vatop tips">支持格式gif,jpg,jpeg,png</td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label>设置管理员:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label class="cb-enable <#if P_MEMBER.isAdmin==1>selected</#if>" for="is_admin1"><span>设置</span></label>
                    <label class="cb-disable <#if P_MEMBER.isAdmin!=1>selected</#if>" for="is_admin2"><span>取消</span></label>
                    <input type="radio" value="1" <#if P_MEMBER.isAdmin==1>checked="checked"</#if>  name="isAdmin" id="is_admin1">
                    <input type="radio" value="0" <#if P_MEMBER.isAdmin!=1>checked="checked"</#if>   name="isAdmin" id="is_admin2"></td>
                <td class="vatop tips"></td>
            </tr>

            <tr>
                <td class="required" colspan="2"><label>举报商品:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label class="cb-enable <#if P_MEMBER.informAllow==1>selected</#if>" for="inform_allow1"><span>允许</span></label>
                    <label class="cb-disable <#if P_MEMBER.informAllow==2>selected</#if>" for="inform_allow2"><span>禁止</span></label>
                    <input type="radio" value="1" <#if P_MEMBER.informAllow==1>checked="checked"</#if>  name="informAllow" id="inform_allow1">
                    <input type="radio" value="2" <#if P_MEMBER.informAllow==2>checked="checked"</#if>  name="informAllow" id="inform_allow2"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label>允许购买商品:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform onoff">
                    <label class="cb-enable <#if P_MEMBER.isBuy==1>selected</#if>" for="isbuy_1"><span>允许</span></label>
                    <label class="cb-disable <#if P_MEMBER.isBuy==0>selected</#if>" for="isbuy_2"><span>禁止</span></label>
                    <input type="radio" value="1" <#if P_MEMBER.isBuy==1>checked="checked"</#if> name="isBuy" id="isbuy_1">
                    <input type="radio" value="0" <#if P_MEMBER.isBuy==0>checked="checked"</#if> name="isBuy" id="isbuy_2"></td>
                <td class="vatop tips">如果禁止该项则会员不能在前台进行下单操作</td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label>允许发表言论:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform onoff">
                    <label class="cb-enable <#if P_MEMBER.isAllowtalk==1>selected</#if>" for="allowtalk_1"><span>允许</span></label>
                    <label class="cb-disable <#if P_MEMBER.isAllowtalk==0>selected</#if>" for="allowtalk_2"><span>禁止</span></label>
                    <input type="radio" value="1" <#if P_MEMBER.isAllowtalk==1>checked="checked"</#if> name="isAllowtalk" id="allowtalk_1">
                    <input type="radio" value="0" <#if P_MEMBER.isAllowtalk==0>checked="checked"</#if> name="isAllowtalk" id="allowtalk_2"></td>
                <td class="vatop tips">如果禁止该项则会员不能发表咨询和发送站内信</td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>允许登录:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff">
                    <label class="cb-enable <#if P_MEMBER.memberState==1>selected</#if>" for="memberstate_1"><span>允许</span></label>
                    <label class="cb-disable <#if P_MEMBER.memberState==0>selected</#if>" for="memberstate_2"><span>禁止</span></label>
                    <input type="radio" value="1" <#if P_MEMBER.memberState==1>checked="checked"</#if> name="memberState" id="memberstate_1">
                    <input type="radio" value="0" <#if P_MEMBER.memberState==0>checked="checked"</#if> name="memberState" id="memberstate_2"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label>积分:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">积分&nbsp;<strong class="red">${P_MEMBER.memberPoints}</strong>&nbsp;</td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>可用预存款:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">可用&nbsp;<strong class="red">${P_MEMBER.availablePredeposit}</strong>&nbsp;元</td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>冻结预存款:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">冻结&nbsp;<strong class="red">${P_MEMBER.freezePredeposit}</strong>&nbsp;元</td>
                <td class="vatop tips"></td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a id="submitBtn" class="btn" href="JavaScript:void(0);"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script charset="utf-8" id="dialog_js" src="${S_COMMON_URL}/scripts/dialog/dialog.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/dialog/dialog.css">
<script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js" type="text/javascript"></script>
<script src="${S_COMMON_URL}/scripts/ajaxfileupload/ajaxfileupload.js" type="text/javascript"></script>
<script src="${S_COMMON_URL}/scripts/jquery.Jcrop/jquery.Jcrop.js" type="text/javascript"></script>
<link id="cssfile2" type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/jquery.Jcrop/jquery.Jcrop.min.css">
<script type="text/javascript">
    //裁剪图片后返回接收函数
    function call_back(picname){
        $('#memberAvatar').val(picname);
        $('#view_img').attr('src','${S_URL}/att?path='+picname+'&'+Math.random());
    }
    $(function(){
        $('input[class="type-file-file"]').change(uploadChange);
        function uploadChange(){
            var filepatd=$(this).val();
            var extStart=filepatd.lastIndexOf(".");
            var ext=filepatd.substring(extStart,filepatd.lengtd).toUpperCase();
            if(ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"&&ext!=".JPEG"){
                alert("file type error");
                $(this).attr('value','');
                return false;
            }
            if ($(this).val() == '') return false;
            ajaxFileUpload();
        }
        function ajaxFileUpload()
        {
            $.ajaxFileUpload
            (
                    {
                        url:'../pic/avatar_save',
                        secureuri:false,
                        fileElementId:'_pic',
                        dataType: 'json',
                        success: function (data, status)
                        {
                            if (data.status == 1){
                                ajax_form('cutpic','裁剪','../pic/pic_cut?x=120&y=120&resize=1&ratio=1&url='+data.url,690);
                            }else{
                                alert(data.msg);
                            }
                            $('input[class="type-file-file"]').bind('change',uploadChange);
                        },
                        error: function (data, status, e)
                        {
                            alert('upload failed');$('input[class="type-file-file"]').bind('change',uploadChange);
                        }
                    }
            )
        };
        $("#submitBtn").click(function(){
            if($("#user_form").valid()){
                $("#user_form").submit();
            }
        });
        $('#user_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
                member_passwd: {
                    maxlength: 20,
                    minlength: 6
                },
                memberEmail   : {
                    required : true,
                    email : true,
                    remote   : {
                        url :'check_email',
                        type:'get',
                        data:{
                            memberEmail : function(){
                                return $('#memberEmail').val();
                            },
                            memberId : '${P_MEMBER.memberId}'
                        }
                    }
                }
            },
            messages : {
                member_passwd : {
                    maxlength: '密码长度应在6-20个字符之间',
                    minlength: '密码长度应在6-20个字符之间'
                },
                memberEmail  : {
                    required : '电子邮箱不能为空',
                    email   : '请您填写有效的电子邮箱',
                    remote : '邮件地址有重复，请您换一个'
                }
            }
        });
    });
</script>

</body>
</html>