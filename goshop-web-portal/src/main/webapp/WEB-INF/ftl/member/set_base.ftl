<#assign P_OP="base" />
<@override name="main">
<div class="ncu-form-style">
    <form action="member/base_save.html?for=xml" id="profile_form" method="post">
        <input type="hidden" value="ok" name="form_submit">
        <input type="hidden" value="" name="old_member_avatar">
        <dl>
            <dt>用户名称：</dt>
            <dd><span class="w340">${P_MEMBER.loginName}</span><span>&nbsp;&nbsp;隐私设置</span></dd>
        </dl>
        <dl>
            <dt>电子邮件：</dt>
            <dd><span class="w340">${P_MEMBER.memberEmail}</span><span>
          <select name="privacyModel.email">
              <option <#if (P_PRIVACY.email??&&P_PRIVACY.email==0)||(!P_PRIVACY.email??)>selected="selected"</#if>
                      value="0">公开
              </option>
              <option <#if P_PRIVACY.email??&&P_PRIVACY.email==1>selected="selected"</#if> value="1">好友可见</option>
              <option <#if P_PRIVACY.email??&&P_PRIVACY.email==2>selected="selected"</#if> value="2">保密</option>
          </select>
          </span></dd>
        </dl>
        <dl>
            <dt>真实姓名：</dt>
            <dd><span class="w340">
          <input type="text" value="${P_MEMBER.memberTruename}" name="memberTruename" maxlength="20" class="text">
          </span><span>
          <select name="privacyModel.truename">
              <option
              <#if (P_PRIVACY.truename??&&P_PRIVACY.truename==0)||(!P_PRIVACY.truename??)>selected="selected"</#if>
              value="0">公开
              </option>
              <option <#if P_PRIVACY.truename??&&P_PRIVACY.truename==1>selected="selected"</#if> value="1">好友可见</option>
              <option <#if P_PRIVACY.truename??&&P_PRIVACY.truename==2>selected="selected"</#if> value="2">保密</option>
          </select>
          </span></dd>
        </dl>
        <dl>
            <dt>性别：</dt>
            <dd><span class="w340">
          <label>
              <input type="radio" <#if P_MEMBER.memberSex==0>checked="checked"</#if> value="0" name="memberSex"/>
              保密</label>
          &nbsp;&nbsp;
          <label>
              <input type="radio" <#if P_MEMBER.memberSex==2>checked="checked"</#if> value="2" name="memberSex"/>
              女</label>
          &nbsp;&nbsp;
          <label>
              <input type="radio" <#if P_MEMBER.memberSex==1>checked="checked"</#if> value="1" name="memberSex"/>
              男</label>
          </span><span>
          <select name="privacyModel.sex">
              <option <#if (P_PRIVACY.sex??&&P_PRIVACY.sex==0)||(!P_PRIVACY.sex??)>selected="selected"</#if> value="0">
                  公开
              </option>
              <option <#if P_PRIVACY.sex??&&P_PRIVACY.sex==1>selected="selected"</#if> value="1">好友可见</option>
              <option <#if P_PRIVACY.sex??&&P_PRIVACY.sex==2>selected="selected"</#if> value="2">保密</option>
          </select>
          </span></dd>
        </dl>
        <dl>
            <dt>生日：</dt>
            <dd><span class="w340">
          <input type="text" value="${(P_MEMBER.memberBirthday?string("yyyy-MM-dd"))!}" id="memberBirthday"
                 maxlength="10" name="memberBirthday" class="text " readonly="readonly">
          </span><span>
          <select name="privacyModel.birthday">
              <option
              <#if (P_PRIVACY.memberBirthday??&&P_PRIVACY.memberBirthday==0)||(!P_PRIVACY.memberBirthday??)>selected="selected"</#if>
              value="0">公开
              </option>
              <option <#if P_PRIVACY.memberBirthday??&&P_PRIVACY.memberBirthday==1>selected="selected"</#if> value="1">
                  好友可见
              </option>
              <option <#if P_PRIVACY.memberBirthday??&&P_PRIVACY.memberBirthday==2>selected="selected"</#if> value="2">
                  保密
              </option>
          </select>
          </span></dd>
        </dl>
        <dl>
            <dt class="required">所在地区：</dt>
            <dd><span class="w340" id="region">
          <input type="hidden" id="province_id" name="memberProvinceid" value="${P_MEMBER.memberProvinceId!}">
          <input type="hidden" id="city_id" name="memberCityid" value="${P_MEMBER.memberCityId!}">
          <input type="hidden" class="area_ids" id="area_id" name="memberAreaid" value="${P_MEMBER.memberAreaId!}">
          <input type="hidden" class="area_names" id="area_info" name="memberAreainfo"
                 value="${P_MEMBER.memberAreaInfo!}">
            <#if P_MEMBER.memberAreaid??>
                <span>${P_MEMBER.memberAreainfo!}</span>
                  <input type="button" value="编辑" class="edit_region"/>
                  <select style="display:none;">
                  </select>
            <#else>
                <select></select>
            </#if>

                    </span><span>
          <select name="privacyModel.area">
              <option <#if (P_PRIVACY.area??&&P_PRIVACY.area==0)||(!P_PRIVACY.area??)>selected="selected"</#if>
                      value="0">公开
              </option>
              <option <#if P_PRIVACY.area??&&P_PRIVACY.area==1>selected="selected"</#if> value="1">好友可见</option>
              <option <#if P_PRIVACY.area??&&P_PRIVACY.area==2>selected="selected"</#if> value="2">保密</option>
          </select>
          </span></dd>
        </dl>
        <dl>
            <dt>QQ：</dt>
            <dd><span class="w340">
          <input type="text" value="${P_MEMBER.memberQq}" name="memberQq" maxlength="30" class="text">
          </span><span>
          <select name="privacyModel.qq">
              <option <#if (P_PRIVACY.qq??&&P_PRIVACY.qq==0)||(!P_PRIVACY.qq??)>selected="selected"</#if> value="0">公开
              </option>
              <option <#if P_PRIVACY.qq??&&P_PRIVACY.qq==1>selected="selected"</#if> value="1">好友可见</option>
              <option <#if P_PRIVACY.qq??&&P_PRIVACY.qq==2>selected="selected"</#if> value="2">保密</option>
          </select>
          </span></dd>
        </dl>
        <dl>
            <dt>阿里旺旺：</dt>
            <dd><span class="w340">
          <input type="text" value="${P_MEMBER.memberWw}" id="memberWw" maxlength="50" class="text" name="memberWw">
          </span><span>
          <select name="privacyModel.ww">
              <option <#if (P_PRIVACY.ww??&&P_PRIVACY.ww==0)||(!P_PRIVACY.ww??)>selected="selected"</#if> value="0">公开
              </option>
              <option <#if P_PRIVACY.ww??&&P_PRIVACY.ww==1>selected="selected"</#if> value="1">好友可见</option>
              <option <#if P_PRIVACY.ww??&&P_PRIVACY.ww==1>selected="selected"</#if> value="2">保密</option>
          </select>
          </span></dd>
        </dl>
        <dl class="bottom">
            <dt>&nbsp;</dt>
            <dd>
                <input type="submit" value="保存修改" class="submit">
            </dd>
        </dl>
    </form>
</div>
<script type="text/javascript">
    //注册表单验证
    $(function () {
        regionInit("region");
        $('#memberBirthday').datepicker({dateFormat: 'yy-mm-dd'});
        $('#profile_form').validate({
            submitHandler: function (form) {
                if ($('select[class="valid"]').eq(0).val() > 0) $('#province_id').val($('select[class="valid"]').eq(0).val());
                if ($('select[class="valid"]').eq(1).val() > 0) $('#city_id').val($('select[class="valid"]').eq(1).val());
                ajaxpost('profile_form', '', '', 'onerror')
            },
            rules: {
                memberTruename: {
                    minlength: 2,
                    maxlength: 20
                },
                memberQq: {
                    digits: true,
                    minlength: 5,
                    maxlength: 12
                }
            },
            messages: {
                memberTruename: {
                    minlength: '姓名长度大于等于2位小于等于20位',
                    maxlength: '姓名长度大于等于2位小于等于20位'
                },
                memberQq: {
                    digits: '请填入正确的QQ号码',
                    minlength: '请填入正确的QQ号码',
                    maxlength: '请填入正确的QQ号码'
                }
            }
        });
    });
</script>
</@override>

<@extends name="framework.ftl"/>
