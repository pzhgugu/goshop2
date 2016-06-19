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
                <li><a class="current" href="JavaScript:void(0);"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" enctype="multipart/form-data" id="user_form">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="loginName" class="validation">会员:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" id="loginName" name="loginName" value=""></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="password" class="validation">密码:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" name="password" id="password"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="memberEmail" class="validation">电子邮箱:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" name="memberEmail" id="memberEmail" value=""></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="memberTruename">真实姓名:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" name="memberTruename" id="memberTruename" value=""></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label> 性别:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><ul>
                    <li>
                        <label>
                            <input type="radio" name="memberSex" value="0" checked="checked">
                            保密</label>
                    </li>
                    <li>
                        <label>
                            <input type="radio" name="memberSex" value="1">
                            男</label>
                    </li>
                    <li>
                        <label>
                            <input type="radio" name="memberSex" value="2">
                            女</label>
                    </li>
                </ul></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="memberQq">QQ:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="memberQq" id="memberQq" value=""></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label class="memberWw">阿里旺旺:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="memberWw" id="memberWw" value=""></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td class="required" colspan="2"><label>头像:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
			<span class="type-file-show">
			<img src="${S_COMMON_URL}/images/preview.png" class="show_image">
			<div style="display: none;" class="type-file-preview"><img id="view_img"></div>
			</span>
            <span class="type-file-box">
              <input type="text" class="type-file-text" id="memberAvatar" name="memberAvatar">
              <input type="button" class="type-file-button" value="" id="button" name="button">
              <input type="file" hidefocus="true" size="30" id="_pic" class="type-file-file" name="_pic">
            </span>
                </td>
                <td class="vatop tips">支持格式gif,jpg,jpeg,png</td>
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
        //按钮先执行验证再提交表单
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
                loginName: {
                    required : true,
                    minlength: 3,
                    maxlength: 20,
                    remote   : {
                        url :'check_user_name',
                        type:'get',
                        data:{
                            user_name : function(){
                                return $('#loginName').val();
                            },
                            member_id : ''
                        }
                    }
                },
                password: {
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
                            user_name : function(){
                                return $('#memberEmail').val();
                            },
                            member_id : ''
                        }
                    }
                },
                memberQq : {
                    digits: true,
                    minlength: 5,
                    maxlength: 11
                }
            },
            messages : {
                loginName: {
                    required : '会员名不能为空',
                    maxlength: '用户名必须在3-20字符之间',
                    minlength: '用户名必须在3-20字符之间',
                    remote   : '会员名有重复，请您换一个'
                },
                password : {
                    maxlength: '密码长度应在6-20个字符之间',
                    minlength: '密码长度应在6-20个字符之间'
                },
                memberEmail  : {
                    required : '电子邮箱不能为空',
                    email   : '请您填写有效的电子邮箱',
                    remote : '邮件地址有重复，请您换一个'
                },
                memberQq : {
                    digits: '请输入正确的QQ号码',
                    minlength: '请输入正确的QQ号码',
                    maxlength: '请输入正确的QQ号码'
                }
            }
        });
    });
</script>

</body>

</html>