<#assign requestUtils= "com.goshop.common.tag.RequestTag"?new()>
<#macro page pageInfo pageNumName>
<#assign url= requestUtils(Request,pageNumName) />

<div class="pagination">
    <ul>
        <#if pageInfo.hasPreviousPage>
            <li><a href="${url}1" class="demo"> <span>首页</span></a></li>
            <li><a href="${url}${pageInfo.pageNum-1}" class="demo"><span>上一页</span></a></li>
        <#else>
            <li><span>首页</span></li>
            <li><span>上一页</span></li>
        </#if>
        <#list 0..pageInfo.pages-1 as p>
            <#if p_index+1==pageInfo.pageNum>
                <li><span class="currentpage">${p_index+1}</span></li>
            <#else>
                <li><a href="${url}${p_index+1}" class="demo"><span>${p_index+1}</span></a></li>
            </#if>
        </#list>
        <#if pageInfo.hasNextPage>
        <li><a href="${url}${pageInfo.pageNum+1}"  class="demo"><span>下一页</span></a></li>
        <li><a href="${url}${pageInfo.pages}" class="demo"><span>尾页</span></a></li>
        <#else>
        <li><span>下一页</span></li>
        <li><span>尾页</span></li>
        </#if>

    </ul>
</div>
</#macro>
