<#if P_CURRENT_CLASS??>


<div class="item-title">
    <h3>${P_CURRENT_CLASS.className}管理</h3>
    <ul class="tab-base">
        <li><a <#if P_OP=="list"&&RequestParameters['article_state']=='3'>class="current"</#if> href="${S_URL}/article_lang/article_list?article_state=3&type=1&article_class_id=${P_CURRENT_CLASS.classId}"><span>发布列表</span></a></li>
        <li><a <#if P_OP=="list"&&RequestParameters['article_state']=='1'>class="current"</#if> href="${S_URL}/article_lang/article_list?article_state=1&type=1&article_class_id=${P_CURRENT_CLASS.classId}"><span>草稿箱</span></a></li>
        <li><a <#if P_OP=="list"&&RequestParameters['article_state']=='4'>class="current"</#if> href="${S_URL}/article_lang/article_list?article_state=4&type=1&article_class_id=${P_CURRENT_CLASS.classId}"><span>回收站</span></a></li>

        <#if P_CMS_ARTICLE??>
            <li><a href="${S_URL}/article_lang/add?type=1&article_class_id=${P_CURRENT_CLASS.classId}"><span>发布文章</span></a></li>
            <li><a <#if P_OP=="edit">class="current"</#if> href="JavaScript:void(0);"><span>修改文章</span></a></li>
        <#else>
            <li><a <#if P_OP=="edit">class="current"</#if> href="${S_URL}/article_lang/add?type=1&article_class_id=${P_CURRENT_CLASS.classId}"><span>发布文章</span></a></li>
        </#if>
    </ul>
</div>

<#else>
<div class="item-title">
    <h3>文章管理</h3>
    <ul class="tab-base">
        <li><a <#if P_OP=="list">class="current"</#if> href="${S_URL}/article_lang/article_list"><span>列表</span></a></li>
        <#if P_CMS_ARTICLE??>
            <li><a href="${S_URL}/article_lang/add"><span>发布文章</span></a></li>
            <li><a <#if P_OP=="edit">class="current"</#if> href="JavaScript:void(0);"><span>修改文章</span></a></li>
        <#else>
            <li><a <#if P_OP=="edit">class="current"</#if> href="${S_URL}/article_lang/add"><span>发布文章</span></a></li>
        </#if>
    </ul>
</div>
</#if>

