<#assign P_OP="passwd" />
<@override name="main">
<div class="ncu-form-style">
    <form action="member/password.html?for=xml" name="password_form" id="password_form" method="post">
        <input type="hidden" value="ok" name="form_submit">
        <dl>
            <dt class="required"><em class="pngFix"></em>您的密码：</dt>
            <dd>
                <input type="password" id="orig_password" name="orig_password" class="text" maxlength="40">
                <label class="error" generated="true" for="orig_password"></label>
            </dd>
        </dl>
        <dl>
            <dt class="required"><em class="pngFix"></em>新密码：</dt>
            <dd>
                <input type="password" id="new_password" name="new_password" class="password" maxlength="40">
                <label class="error" generated="true" for="new_password"></label>
            </dd>
        </dl>
        <dl>
            <dt class="required"><em class="pngFix"></em>确认密码：</dt>
            <dd>
                <input type="password" id="confirm_password" name="confirm_password" class="password" maxlength="40">
                <label class="error" generated="true" for="confirm_password"></label>
            </dd>
        </dl>
        <dl class="bottom">
            <dt>&nbsp;</dt>
            <dd>
                <input type="submit" value="确认提交" class="submit">
            </dd>
        </dl>
    </form>
</div>
<script type="text/javascript">
    $(function () {
        $('#password_form').validate({
            submitHandler: function (form) {
                ajaxpost('password_form', '', '', 'onerror')
            },
            rules: {
                orig_password: {
                    required: true
                },
                new_password: {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                },
                confirm_password: {
                    required: true,
                    equalTo: '#new_password'
                }
            },
            messages: {
                orig_password: {
                    required: '原始密码不能为空'
                },
                new_password: {
                    required: '新密码不能为空',
                    minlength: '密码长度大于等于6位小于等于20位'
                },
                confirm_password: {
                    required: '确认密码不能为空',
                    equalTo: '新密码与确认密码不相同'
                }
            }
        });
    });
</script>
</@override>
<@extends name="framework.ftl"/>
