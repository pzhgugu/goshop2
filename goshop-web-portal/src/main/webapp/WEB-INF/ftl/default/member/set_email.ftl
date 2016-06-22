<#assign P_OP="email" />
<@override name="main">
<div class="ncu-form-style">
    <form action="member/email.html?for=xml" id="email_form" method="post">
        <dl>
            <dt class="required"><em class="pngFix"></em>您的密码：</dt>
            <dd>
                <input type="password" id="orig_password" name="orig_password" maxlength="40"
                       class="password">
                <label class="error" generated="true" for="orig_password"></label>
            </dd>
        </dl>
        <dl>
            <dt class="required"><em class="pngFix"></em>电子邮件：</dt>
            <dd>
                <input type="text" id="email" name="email" maxlength="40" class="text">
                <label class="error" generated="true" for="email"></label>
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
        $('#email_form').validate({
            submitHandler: function (form) {
                ajaxpost('email_form', '', '', 'onerror')
            },
            rules: {
                orig_password: {
                    required: true
                },
                email: {
                    required: true,
                    email: true,
                    remote: {
                        url: '${SHOP_REST_URL}/register/check/email',
                        type: 'get',
                        dataType: "jsonp",
                        data: {
                            email: function () {
                                return $('#email').val();
                            }
                        }
                    }
                }
            },
            messages: {
                orig_password: {
                    required: '密码不能为空'
                },
                email: {
                    required: '电子邮件不能为空',
                    email: '电子邮件格式不正确',
                    remote: '该电子邮箱已经存在'
                }
            }
        });
    });
</script>
</@override>
<@extends name="framework.ftl"/>