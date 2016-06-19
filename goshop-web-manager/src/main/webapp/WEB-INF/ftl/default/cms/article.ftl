<#assign S_URL=request.contextPath />
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
        $(document).ready(function(){
            //行内ajax编辑
            $('span[nc_type="article_sort"]').inline_edit({act: 'cms_article',op: 'update_article_sort'});
            $('span[nc_type="article_click"]').inline_edit({act: 'cms_article',op: 'update_article_click'});

            //批量删除
            $("#btn_delete_batch").click(function() {
                var item = submit_batch(submit_delete);
                return false;
            });

            //审核
            $('input[name="verify_state"]').click(function(){
                if ($(this).val() == 1) {
                    $('tr[nctype="reason"]').hide();
                } else {
                    $('tr[nctype="reason"]').show();
                }
            });
            $('#btn_verify_submit').on('click', function() {
                $('#verify_form').submit();
            });

        });
        //批量操作
        function submit_batch(batch_op){
            /* 获取选中的项 */
            var items = '';
            $('.checkitem:checked').each(function(){
                items += this.value + ',';
            });
            if(items != '') {
                items = items.substr(0, (items.length - 1));
                batch_op(items);
            } else {
                alert('请选择要操作的对象');
                return false;
            }
        }

        //删除
        function submit_delete(id){
            if(confirm('您确定要删除吗?')) {
                $('#list_form').attr('action','delete');
                $('#article_id').val(id);
                $('#list_form').submit();
            }
        }

        function submit_verify(id) {
            $('#verify_article_id').val(id);
            $('#dialog_verify').nc_show_dialog({title:'审核'});
        }

        //收回
        function submit_callback(id){
            if(confirm('您确认收回？')) {
                $('#list_form').attr('action','index.php?act=cms_article&amp;op=cms_article_callback');
                $('#article_id').val(id);
                $('#list_form').submit();
            }
        }
    </script>
</head>
<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>

<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>文章管理</h3>
            <ul class="tab-base">
                <li><a <#if RequestParameters['article_state']??><#if RequestParameters['article_state']=='3'>class="current"</#if><#else>class="current"</#if> href="${S_URL}/cms_article/cms_article_list?article_state=3"><span>已发布列表</span></a></li>
                <li><a <#if RequestParameters['article_state']??&&RequestParameters['article_state']=='1'>class="current"</#if> href="${S_URL}/cms_article/cms_article_list?article_state=1"><span>草稿列表</span></a></li>
                <li><a <#if RequestParameters['article_state']??&&RequestParameters['article_state']=='2'>class="current"</#if> href="${S_URL}/cms_article/cms_article_list?article_state=2"><span>待审核列表</span></a></li>
                <li><a <#if RequestParameters['article_state']??&&RequestParameters['article_state']=='4'>class="current"</#if> href="${S_URL}/cms_article/cms_article_list?article_state=4"><span>回收站列表</span></a></li>
                <li><a href="${S_URL}/cms_article/add"><span>发布信息</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form name="formSearch" method="get">
        <input type="hidden" name="act" value="cms_article">
        <input type="hidden" name="op" value="cms_article_list">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <th><label for="article_title">标题</label></th>
                <td><input type="text" class="txt" name="article_title" value="${RequestParameters['article_title']!}"></td>
                <th><label for="article_publisher_name">作者</label></th>
                <td><input type="text" class="txt" name="article_publisher_name" value="${RequestParameters['article_publisher_name']!}"></td>

                <td><a title="查询" class="btn-search " href="javascript:document.formSearch.submit();">&nbsp;</a></td>
            </tr>
            </tbody>
        </table>
    </form>
    <!-- 操作说明 -->
    <table id="prompt" class="table tb-type2">
        <tbody>
        <tr class="space odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <th class="nobg" colspan="12"> <div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span> </div>
            </th>
        </tr>
        <tr class="odd" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
            <td><ul>
                <li>通过修改排序数字可以控制前台显示顺序，数字越小越靠前</li>
                <li>可以直接在列表中修改文章对应的浏览数，开启关闭评论和心情功能</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form method="post" id="list_form">
        <input type="hidden" name="article_id" id="article_id">
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
                <th class="align-left">类型</th>
                <th>点击数</th>
                <th class="align-center">推荐文章</th>
                <th class="align-center">推荐图文</th>
                <th class="align-center">评论</th>
                <th class="align-center">心情</th>
                <th class="align-center">状态</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>

            <#if (P_PAGE.size>0) >
                <#list P_PAGE.list as o>
            <tr class="hover edit" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="w24"><input type="checkbox" class="checkitem" value="${o.articleId}"></td>
                <td class="w48 sort"><span class="editable " title="可编辑" column_id="${o.articleId}" nc_type="article_sort">${o.articleSort!}</span>
                </td><td class="w60 picture"><div class="size-56x56"><span class="thumb size-56x56">
                <i></i>
                <img width="56" height="43" src="<#if ((o.articleImage??)&&(o.articleImage!=''))>${S_URL}/att?path=${o.articleImage}<#else>${S_COMMON_URL}/images/cms/no_cover.png</#if>" onload="javascript:DrawImage(this,56,56);">
            </span></div></td>
                <td><p>${o.articleTitle}</p>
                    <p>作者：${o.articleAuthor}</p></td>
                <td class="w84"><#if (o.articleType==1)>管理员发布<#else>用户投稿</#if></td>
                <td class="w48 sort"><span class="editable" title="可编辑" column_id="${o.articleId}" nc_type="article_click" style="display: inline-block;">${o.articleClick}</span>
                </td><td class="w60 align-center yes-onoff"><a title="" fieldvalue="${o.articleCommendFlag}" fieldid="${o.articleId}" fieldname="article_commend_flag" nc_type="inline_edit" ajax_branch="article_commend" class="<#if o.articleCommendFlag==1>enabled<#else>disabled</#if>" href="JavaScript:void(0);"><img src="${S_COMMON_URL}/images/transparent.gif"></a></td>
                <td class="w60 align-center yes-onoff"><a title="" fieldvalue="${o.articleCommendImageFlag}" fieldid="${o.articleId}" fieldname="article_commend_image_flag" nc_type="inline_edit" ajax_branch="article_commend_image" class="<#if o.articleCommendImageFlag==1>enabled<#else>disabled</#if>" href="JavaScript:void(0);"><img src="${S_COMMON_URL}/images/transparent.gif"></a></td>
                <td class="w60 align-center yes-onoff"><a title="" fieldvalue="${o.articleCommentFlag}" fieldid="${o.articleId}" fieldname="article_comment_flag" nc_type="inline_edit" ajax_branch="article_comment" class="<#if o.articleCommentFlag==1>enabled<#else>disabled</#if>" href="JavaScript:void(0);"><img src="${S_COMMON_URL}/images/transparent.gif"></a></td>
                <td class="w60 align-center yes-onoff"><a title="" fieldvalue="${o.articleAttitudeFlag}" fieldid="${o.articleId}" fieldname="article_attitude_flag" nc_type="inline_edit" ajax_branch="article_attitude" class="<#if o.articleAttitudeFlag==1>enabled<#else>disabled</#if>" href="JavaScript:void(0);"><img src="${S_COMMON_URL}/images/transparent.gif"></a></td>
                <td class="w60 align-center"><#if o.articleState==1>草稿<#elseif o.articleState==2>待审核<#elseif o.articleState==3>已发布<#else>回收站</#if></td>
                <td class="w108 align-center">
                    <a href="edit?article_id=${o.articleId}">编辑</a>
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
</body></html>