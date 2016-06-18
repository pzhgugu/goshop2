<#assign S_URL=request.contextPath />
<#assign P_OP="list" />
<#if RequestParameters["type"]??&&RequestParameters["type"]=='1'>
    <#list P_CLASS_LIST as aClass>
        <#if RequestParameters['article_class_id']=='${aClass.classId}'>
            <#assign P_CURRENT_CLASS=aClass />
        </#if>
    </#list>
</#if>

<!DOCTYPE html>
<html>
<head>
    <meta content="IE=edge;chrome=1" http-equiv="X-UA-Compatible">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>文章管理</title>

    <script src="${S_COMMON_URL}/scripts/jquery/jquery.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/waypoints.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.validation.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js"></script>
    <script src="${S_COMMON_URL}/scripts/utils/area_array.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common.js"></script>
    <script src="${S_URL}/static/scripts/admincp.js"></script>
    <script src="${S_URL}/static/scripts/jquery.edit.js"></script>
    <link id="cssfile2" type="text/css" rel="stylesheet" href="${S_URL}/static/styles/skin_0.css">
    <script type="text/javascript">
        SITEURL = '${S_URL}';
        $(document).ready(function () {
            //行内ajax编辑
            $('span[nc_type="article_sort"]').inline_edit({act: 'article_lang', op: 'update_article_sort'});
            $('span[nc_type="article_click"]').inline_edit({act: 'article_lang', op: 'update_article_click'});

            //批量删除
            $("#btn_delete_batch").click(function () {
                var item = submit_batch(submit_delete);
                return false;
            });

            //审核
            $('input[name="verify_state"]').click(function () {
                if ($(this).val() == 1) {
                    $('tr[nctype="reason"]').hide();
                } else {
                    $('tr[nctype="reason"]').show();
                }
            });
            $('#btn_verify_submit').on('click', function () {
                $('#verify_form').submit();
            });

        });
        //批量操作
        function submit_batch(batch_op) {
            /* 获取选中的项 */
            var items = '';
            $('.checkitem:checked').each(function () {
                items += this.value + ',';
            });
            if (items != '') {
                items = items.substr(0, (items.length - 1));
                batch_op(items);
            } else {
                alert('请选择要操作的对象');
                return false;
            }
        }

        //删除
        function submit_delete(id) {
            if (confirm('您确定要删除吗?')) {
                $('#list_form').attr('action', 'delete');
                $('#article_id').val(id);
                $('#list_form').submit();
            }
        }

        function submit_verify(id) {
            $('#verify_article_id').val(id);
            $('#dialog_verify').nc_show_dialog({title: '审核'});
        }

    </script>
</head>
<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>

<div class="page">
    <div class="fixed-bar">
    <#include "article_lang_item_title.ftl" />
    </div>
    <div class="fixed-empty"></div>
    <form name="formSearch" method="get">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <th><label for="article_title">标题</label></th>
                <td><input type="text" class="txt" name="article_title" value="${RequestParameters['article_title']!}">
                </td>
                <th><label for="article_publisher_name">作者</label></th>
                <td><input type="text" class="txt" name="article_publisher_name"
                           value="${RequestParameters['article_publisher_name']!}"></td>
                <#if P_CURRENT_CLASS??>
                <input type="hidden" name="article_class_id" value="${P_CURRENT_CLASS.classId}" />
                    <input type="hidden" name="type" value="1" />
                    <input type="hidden" name="article_state" value="3" />

                    <#else>
                        <th><label for="article_state">状态</label></th>
                        <td><select name="article_state">
                            <option value="">请选择</option>
                            <option
                                <#if RequestParameters['article_state']??&&RequestParameters['article_state']=='1'>selected="selected"</#if>
                                value="1">草稿箱
                            </option>
                            <option
                                <#if RequestParameters['article_state']??&&RequestParameters['article_state']=='3'>selected="selected"</#if>
                                value="3">已发布
                            </option>
                            <option
                                <#if RequestParameters['article_state']??&&RequestParameters['article_state']=='4'>selected="selected"</#if>
                                value="4">回收站
                            </option>
                        </select></td>
                        <th><label for="article_publisher_name">文章分类</label></th>
                        <td><select name="article_class_id">
                            <option value="">请选择</option>
                            <#list P_CLASS_LIST as aClass>
                                <option
                                    <#if RequestParameters['article_class_id']??&&RequestParameters['article_class_id']=='${aClass.classId}'>selected="selected"</#if>
                                    value="${aClass.classId}">${aClass.className}</option>
                            </#list>
                        </select></td>
                </#if>


                <td><a title="查询" class="btn-search " href="javascript:document.formSearch.submit();">&nbsp;</a></td>
            </tr>
            </tbody>
        </table>
    </form>
    <!-- 操作说明 -->
    <table id="prompt" class="table tb-type2">
        <tbody>
        <tr class="space odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <th class="nobg" colspan="12">
                <div class="title">
                    <h5>操作提示</h5>
                    <span class="arrow"></span></div>
            </th>
        </tr>
        <tr class="odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <td>
                <ul>
                    <li>通过修改排序数字可以控制前台显示顺序，数字越小越靠前</li>
                    <li>可以直接在列表中修改文章对应的浏览数，开启关闭评论和心情功能</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>
    <form method="post" id="list_form">
        <input type="hidden" name="article_id" id="article_id">
<#if P_CURRENT_CLASS??>
    <input type="hidden" name="article_class_id" value="${P_CURRENT_CLASS.classId}" />
    <input type="hidden" name="type" value="1" />
</#if>
        <table class="table tb-type2">
            <thead>
            <tr class="space">
                <th class="nobg" colspan="15">列表</th>
            </tr>
            <tr class="thead">
                <th></th>
                <th class="align-left">排序</th>
                <th>标题</th>
                <th class="align-left"></th>
                <th class="align-left">文章标题</th>
                <th class="align-left">文章分类</th>
                <th class="align-center">状态</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>

            <#if (P_PAGE.size>0) >
                <#list P_PAGE.list as o>
                <tr class="hover edit" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                    <td class="w24"><input type="checkbox" class="checkitem" value="${o.articleId}"></td>
                    <td class="w48 sort"><span class="editable " title="可编辑" column_id="${o.articleId}"
                                               nc_type="article_sort">${o.articleSort!}</span>
                    </td>
                    <td class="w60 picture">
                        <div class="size-56x56"><span class="thumb size-56x56">
                <i></i>
                <img width="56" height="43"
                     src="<#if ((o.articleImage??)&&(o.articleImage!=''))>${S_URL}/att?path=${o.articleImage}<#else>${S_COMMON_URL}/images/cms/no_cover.png</#if>"
                     onload="javascript:DrawImage(this,56,56);">
            </span></div>
                    </td>
                    <td><p>作者： <#list o.articleLangInfoList as info>${info.articleAuthor}&nbsp</#list>
                    </p>

                        <p>发布日期：${o.articlePublishTime?string("yyyy-MM-dd")}</p>
                    </td>

                    <td class="w400">
                        <#list o.articleLangInfoList as info>
                            <p>${info.langType}：${info.articleTitle}</p>
                        </#list>
                    </td>
                    <td class="w84"> <#list P_CLASS_LIST as aClass>
                    <#if o.articleClassId==aClass.classId>${aClass.className}</#if>
                </#list></td>
                    <td class="w60 align-center"><#if o.articleState==1>草稿<#elseif o.articleState==2>
                        待审核<#elseif o.articleState==3>已发布<#else>回收站</#if></td>
                    <td class="w108 align-center">
                        <a href="edit?article_id=${o.articleId}<#if P_CURRENT_CLASS??>&type=1&article_class_id=${P_CURRENT_CLASS.classId}</#if>">编辑</a>
                        <a href="javascript:submit_delete(${o.articleId})">删除</a></td>
                </tr>
                </#list>
                <#if (P_PAGE.pages>1)>
                    <#import "../pagination.ftl" as pagination />
                    <@pagination.page  pageInfo=P_PAGE pageNumName="p" />
                </#if>
            <#else>
            <tr class="no_data" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td colspan="15">没有符合条件的记录</td>
            </tr>
            </#if>
            </tbody>
        </table>
    </form>
</div>
</body>
</html>