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
                <li><a class="current" href="JavaScript:void(0);"><span>管理</span></a></li>
                <li><a href="${S_URL}/member/add"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="formSearch" name="formSearch" method="get">
        <input type="hidden" name="act" value="member">
        <input type="hidden" name="op" value="member">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <td><select name="search_field_name">
                    <option value="member_name">会员</option>
                    <option value="member_email">电子邮箱</option>
                    <option value="member_truename">真实姓名</option>
                </select></td>
                <td><input type="text" class="txt" name="search_field_value" value=""></td>
                <td><select name="search_sort">
                    <option value="">排序</option>
                    <option value="login_time desc">最后登录</option>
                    <option value="login_num desc">登录次数</option>
                </select></td>
                <td><select name="search_state">
                    <option value="" selected="selected">会员状态</option>
                    <option value="no_informallow">禁止举报</option>
                    <option value="no_isbuy">禁止购买</option>
                    <option value="no_isallowtalk">禁止发表言论</option>
                    <option value="no_memberstate">禁止登录</option>
                </select></td>
                <td><a title="查询" class="btn-search " id="ncsubmit" href="javascript:void(0);">&nbsp;</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <table id="prompt" class="table tb-type2">
        <tbody>
        <tr class="space odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        <tr class="odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <td><ul>
                <li>通过会员管理，你可以进行查看、编辑会员资料以及删除会员等操作</li>
                <li>你可以根据条件搜索会员，然后选择相应的操作</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form id="form_member" method="post">
        <input type="hidden" value="ok" name="form_submit">
        <table class="table tb-type2 nobdb">
            <thead>
            <tr class="thead">
                <th>&nbsp;</th>
                <th colspan="2">会员</th>
                <th class="align-center"><span nc_type="order_by" fieldname="logins">登录次数</span></th>
                <th class="align-center"><span nc_type="order_by" fieldname="last_login">最后登录</span></th>
                <th class="align-center">积分</th>
                <th class="align-center">预存款</th>
                <th class="align-center">登录</th>
                <th class="align-center">操作</th>
            </tr>
            </thead><tbody>
<#list P_PAGE.list as o>
        <tr class="hover member" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <td class="w24"></td>
            <td class="w48 picture"><div class="size-44x44"><span class="thumb size-44x44"><i></i><img width="44" height="44" onload="javascript:DrawImage(this,44,44);" src="${S_COMMON_URL}/images/default_user_portrait.gif"></span></div></td>
            <td><p class="name"><strong>${o.loginName}</strong>(真实姓名: ${o.memberTruename!})</p>
                <p class="smallfont">注册时间:&nbsp;${o.memberTime?string("yyyy-MM-dd HH:mm:ss")}</p>

                <div class="im"><span class="email">
                                <a title="电子邮箱:${o.memberEmail}" class=" yes" href="mailto:${o.memberEmail}">${o.memberEmail}</a></span>
                </div></td>
            <td class="align-center">${o.loginNum}</td>
            <td class="w150 align-center"><p>${(o.loginTime?string("yyyy-MM-dd HH:mm:ss"))!}</p>
                <p>${o.loginIp!}</p></td>
            <td class="align-center">${o.memberPoints}</td>
            <td class="align-center"><p>可用:&nbsp;<strong class="red">${o.availablePredeposit}</strong>&nbsp;元</p>
                <p>冻结:&nbsp;<strong class="red">${o.freezePredeposit}</strong>&nbsp;元</p></td>
            <td class="align-center"><#if o.memberState==1>允许<#else>禁止</#if></td>
            <td class="align-center"><a href="edit?member_id=${o.memberId}">编辑</a> | <a href="#">通知</a></td>
        </tr>
</#list>
        </tbody>
            <tfoot class="tfoot">
            <tr>
                <td colspan="16">
                <#if (P_PAGE.pages>1)>
                    <#import "../pagination.ftl" as pagination />
                    <@pagination.page  pageInfo=P_PAGE pageNumName="p" />
                </#if>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script>
    $(function(){
        $('#ncsubmit').click(function(){
            $('input[name="op"]').val('member');$('#formSearch').submit();
        });
    });
</script>

</body>
</html>