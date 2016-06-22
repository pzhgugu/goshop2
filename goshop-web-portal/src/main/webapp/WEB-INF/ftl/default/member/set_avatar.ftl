<#assign P_OP="avatar" />
<@override name="main">
<form method="post" id="form_avaster" enctype="multipart/form-data" action="upload.html">
    <div class="ncu-form-style">
        <dl>
            <dt>头像预览：</dt>
            <dd>
                <div class="member-avatar-thumb"><img nc_type="avatar" alt=""
                                                      src="<#if P_MEMBER.memberAvatar??>${S_URL}/att.html?path=${P_MEMBER.memberAvatar}<#else>${S_COMMON_URL}/images/default_user_portrait.gif</#if>">
                </div>
                <p class="hint mt5">完善个人信息资料，上传头像图片有助于您结识更多的朋友。<br><span style="color:orange;">头像默认尺寸为120x120像素，请根据系统操作提示进行裁剪并生效。</span>
                </p>
            </dd>
        </dl>
        <dl>
            <dt>更换头像：</dt>
            <dd>
                <div class="upload-btn"><a href="javascript:void(0);"> <span>
            <input type="file" maxlength="0" hidefocus="true" size="1" class="file" file_id="0" multiple="" id="pic"
                   name="pic">
            </span>

                    <div class="upload-button">图片上传</div>
                    <input type="button" onclick="submit_form($(this))" value="&nbsp;" style="display:none"
                           id="submit_button">
                </a></div>
            </dd>
        </dl>
    </div>
</form>
<script type="text/javascript">
    $(function () {
        $('#pic').change(function () {
            var filepatd = $(this).val();
            var extStart = filepatd.lastIndexOf(".");
            var ext = filepatd.substring(extStart, filepatd.lengtd).toUpperCase();
            if (ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG") {
                alert("file type error");
                $(this).attr('value', '');
                return false;
            }
            if ($(this).val() == '') return false;
            $("#form_avaster").submit();
        });
    });
</script>
</@override>
<@extends name="framework.ftl"/>