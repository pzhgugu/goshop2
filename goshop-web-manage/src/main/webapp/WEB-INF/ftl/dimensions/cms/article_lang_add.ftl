<#assign S_URL=request.contextPath />
<#assign P_OP="edit" />
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
    <title>添加文章</title>

    <script src="${S_COMMON_URL}/scripts/jquery/jquery.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery-browser.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/waypoints.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery/jquery.validation.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery-ui/jquery.ui.js"></script>
    <script src="${S_COMMON_URL}/scripts/jquery-ui/i18n/zh-CN.js"></script>
    <script src="${S_COMMON_URL}/scripts/utils/area_array.js"></script>
    <script src="${S_COMMON_URL}/scripts/shop/common.js"></script>
    <script src="${S_URL}/static/scripts/admincp.js"></script>
    <link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/jquery-ui/themes/smoothness/jquery.ui.css">
    <link id="cssfile2" type="text/css" rel="stylesheet" href="${S_URL}/static/styles/skin_0.css">
    <script charset="utf-8" src="${S_COMMON_URL}/scripts/kindeditor/kindeditor-min.js"></script>
    <script charset="utf-8" src="${S_COMMON_URL}/scripts/kindeditor/lang/zh_CN.js"></script>
    <script type="text/javascript">
        SITEURL = '${S_URL}';
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
    <form name="articleForm" method="post" id="article_form">
    <#if P_CMS_ARTICLE??>
        <input type="hidden" id="articleId" name="articleId" value="${P_CMS_ARTICLE.articleId}">
    </#if>
        <table class="table tb-type2 nobdb">
            <tbody>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="articleClassId" class="validation">所属分类:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">
                <#if P_CURRENT_CLASS??&&(!P_CMS_ARTICLE??)>
                ${P_CURRENT_CLASS.className}<input type="hidden" name="articleClassId"
                                                   value="${P_CURRENT_CLASS.classId}"/>
                <#else>
                    <select id="articleClassId" name="articleClassId">
                        <option value="">请选择...</option>
                        <#list P_CLASS_LIST as articleClass>
                            <option value="${articleClass.classId}" <#if (P_CMS_ARTICLE??)&&(articleClass.classId==P_CMS_ARTICLE.articleClassId) >
                                    selected="selected" </#if>>&nbsp;&nbsp;${articleClass.className}</option>
                            <#if (articleClass.children?size>0) >
                                <#list articleClass.children as cGc>
                                    <option value="${cGc.classId}" <#if (P_CMS_ARTICLE??)&&(articleClass.classId==cGc.articleClassId) >
                                            selected="selected" </#if>>&nbsp;&nbsp;&nbsp;&nbsp;${cGc.className}</option>
                                </#list>
                            </#if>
                        </#list>
                    </select>
                </#if>
                </td>
                <td class="vatop tips"></td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td colspan="2" class="required"><label>标题图片:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">
			<span class="type-file-show">
			<img class="show_image" src="${S_COMMON_URL}/images/preview.png">
			<div class="type-file-preview" style="display: none;"><img id="view_img"
                                                                       src="<#if (P_CMS_ARTICLE??&&P_CMS_ARTICLE.articleImage!='')>${S_URL}/att?path=${P_CMS_ARTICLE.articleImage}<#else>${S_COMMON_URL}/images/cms/no_cover.png</#if>">
            </div>
			</span>
            <span class="type-file-box">
              <input type="text" name="articleImage" id="articleImage" class="type-file-text"
                     value="<#if (P_CMS_ARTICLE??)>${P_CMS_ARTICLE.articleImage!}</#if>">
              <input type="button" name="button" id="button" value="" class="type-file-button">
              <input type="file" name="_pic" class="type-file-file" id="_pic" size="30" hidefocus="true">
            </span>
                </td>
                <td class="vatop tips">支持格式gif,jpg,jpeg,png</td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="articleLink">链接:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" id="articleLink" name="articleLink"
                                                 value="<#if P_CMS_ARTICLE??>${P_CMS_ARTICLE.articleLink!}</#if>"></td>
                <td class="vatop tips">当填写"链接"后点击文章标题将直接跳转至链接地址，不显示文章内容。链接格式请以http://开头</td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2">发布状态:</td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">
                    <ul>
                        <li>
                            <input type="radio" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleState==3>checked="checked"</#if><#else>checked="checked"</#if>
                                   value="3" name="articleState">
                            <label>已发布</label>
                        </li>
                        <li>
                            <input <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleState==1>checked="checked"</#if></#if>
                                    type="radio" value="1" name="articleState">
                            <label>草稿</label>
                        </li>
                        <li>
                            <input <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleState==4>checked="checked"</#if></#if>
                                    type="radio" value="4" name="articleState">
                            <label>回收站</label>
                        </li>
                    </ul>
                </td>
                <td class="vatop tips"></td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>发布日期:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt date" name="articlePublishTime"
                                                 id="articlePublishTime"
                                                 value="<#if P_CMS_ARTICLE??>${P_CMS_ARTICLE.articlePublishTime?string('yyyy-MM-dd')}</#if>"
                                                 readonly="readonly"></td>
                <td class="vatop tips">格式：2009-4-30，留空表示当前时间</td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>结束日期:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt date" name="articleEndTime"
                                                 id="articleEndTime"
                                                 value="<#if (P_CMS_ARTICLE??)>${(P_CMS_ARTICLE.articleEndTime?string('yyyy-MM-dd'))!}</#if>"
                                                 readonly="readonly"></td>
                <td class="vatop tips">格式：2009-4-30，留空表示为空</td>
            </tr>

           <!-- <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2">排序:
                </td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" id="articleSort" name="articleSort"
                                                 value="<#if P_CMS_ARTICLE??>${P_CMS_ARTICLE.articleSort!255}<#else>255</#if>">
                </td>
                <td class="vatop tips"></td>
            </tr>-->
            <#if P_CMS_ARTICLE??>
                <#list P_CMS_ARTICLE.articleLangInfoList as infoList>
                    <#if (infoList.langType=="zh")>
                        <#assign P_ZH=infoList />
                    <input type="hidden" name="articleInfoId_zh" value="${P_ZH.articleInfoId}">
                    <#else>
                        <#assign P_EN=infoList />
                    <input type="hidden" name="articleInfoId_en" value="${P_EN.articleInfoId}">
                    </#if>

                </#list>
            </#if>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2">文章详细信息:
                </td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform" colspan="2">
                    <div id="tabs">
                        <ul>
                            <li><a href="#tabs-1">中文</a></li>
                            <li><a href="#tabs-2">英文</a></li>
                        </ul>
                        <div id="tabs-1">
                            <table class="table tb-type2 nobdb">
                                <tbody>
                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td class="required" colspan="2"><label class="validation">中文标题:</label></td>
                                </tr>
                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop rowform">
                                        <input type="text" style="width:600px" id="articleTitle_zh" name="articleTitle_zh" value="<#if P_ZH??>${P_ZH.articleTitle}</#if>">
                                    </td>
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop tips"></td>
                                </tr>

                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td class="required" colspan="2"><label>中文摘要:</label></td>
                                </tr>
                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop rowform">
                                        <textarea rows="5" cols="20" style="width: 600px; height: 63px;" id="articleAbstract_zh" name="articleAbstract_zh" ><#if P_ZH??>${P_ZH.articleAbstract}</#if></textarea>
                                    </td>
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop tips"></td>
                                </tr>

                                <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td class="required"  style="border-top: 1px dotted #cbe9f3;" colspan="2"><label>文章作者(中文):</label>
                                    </td>
                                </tr>
                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop rowform"><input type="text"
                                                                                                             class="txt"
                                                                                                             id="articleAuthor_zh"
                                                                                                             name="articleAuthor_zh"
                                                                                                             value="<#if P_ZH??>${P_ZH.articleAuthor}</#if>">
                                    </td>
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop tips"></td>
                                </tr>

                                <tr>
                                    <td style="border-top: 1px dotted #cbe9f3;" class="required" colspan="2"><label
                                            class="validation">中文内容:</label></td>
                                </tr>
                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop rowform" colspan="2">
                                        <textarea
                                                style="width: 700px; height: 300px; visibility: hidden; display: none;"
                                                name="articleContent_zh"
                                                id="articleContent_zh"><#if P_ZH??>${P_ZH.articleContent!}</#if></textarea>

                                    </td>
                                </tr>
                                <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" class="required" colspan="2">图片上传:</td>
                                </tr>
                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" id="divComUploadContainer_zh"
                                        colspan="3"><input type="file" name="fileupload" id="fileupload_zh"
                                                           multiple="multiple"></td>
                                </tr>
                                <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" class="required" colspan="2">已传图片:</td>
                                </tr>
                                <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" colspan="2">
                                        <ul class="thumblists" id="thumbnails_zh">
                                            <ul>
                                            <#if P_IMAGES??>
                                                <#list P_IMAGES as image>
                                                    <li class="picture" id="zh_${image.id}">
                                                        <input type="hidden" value="${image.id}" name="file_id">

                                                        <div class="size-64x64"><span class="thumb"><i></i>
                                            <img width="64px" height="64px"
                                                 src="${S_URL}/att?path=${image.path}"></span></div>
                                                        <p><span><a
                                                                href="javascript:insert_editor('${S_URL}/att?path=${image.path}');">插入</a></span>
                                                            <span><a
                                                                    href="javascript:del_file_upload('${image.path}','${image.id}');">删除</a></span>
                                                        </p></li>
                                                </#list>
                                            </#if>
                                            </ul>
                                        </ul>
                                        <div class="tdare">

                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>

                        </div>
                        <div id="tabs-2">
                            <table class="table tb-type2 nobdb">
                                <tbody>
                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td class="required" colspan="2"><label class="validation">英文标题:</label></td>
                                </tr>
                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop rowform"><input type="text"
                                                                                                             style="width:600px"
                                                                                                             id="articleTitle_en"
                                                                                                             name="articleTitle_en"
                                                                                                             value="<#if P_EN??>${P_EN.articleTitle}</#if>">
                                    </td>
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop tips"></td>
                                </tr>

                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td class="required"  colspan="2"><label >英文摘要:</label></td>
                                </tr>
                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop rowform">
                                        <textarea rows="5" cols="20" style="width: 600px; height: 63px;" id="articleAbstract_en" name="articleAbstract_en"><#if P_ZH??>${P_EN.articleAbstract}</#if></textarea>
                                    </td>
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop tips"></td>
                                </tr>

                                <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td class="required"  style="border-top: 1px dotted #cbe9f3;" colspan="2"><label for="articleForm">文章作者（英文）:</label>
                                    </td>
                                </tr>
                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop rowform"><input type="text"
                                                                                                             class="txt"
                                                                                                             id="articleAuthor_en"
                                                                                                             name="articleAuthor_en"
                                                                                                             value="<#if P_EN??>${P_EN.articleAuthor}</#if>">
                                    </td>
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop tips"></td>
                                </tr>

                                <tr>
                                    <td style="border-top: 1px dotted #cbe9f3;" class="required" colspan="2"><label
                                            class="validation">英文内容:</label></td>
                                </tr>
                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" class="vatop rowform" colspan="2">
                                        <textarea
                                                style="width: 700px; height: 300px; visibility: hidden; display: none;"
                                                name="articleContent_en"
                                                id="articleContent_en"><#if P_EN??>${P_EN.articleContent!}</#if></textarea>

                                    </td>
                                </tr>
                                <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" class="required" colspan="2">图片上传:</td>
                                </tr>
                                <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" id="divComUploadContainer_en"
                                        colspan="3"><input type="file" name="fileupload" id="fileupload_en"
                                                           multiple="multiple"></td>
                                </tr>
                                <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" class="required" colspan="2">已传图片:</td>
                                </tr>
                                <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                    <td style="border-top: 1px dotted #cbe9f3;" colspan="2">
                                        <ul class="thumblists" id="thumbnails_en">
                                            <ul>
                                            <#if P_IMAGES??>
                                                <#list P_IMAGES as image>
                                                    <li class="picture" id="en_${image.id}">
                                                        <input type="hidden" value="${image.path}" name="file_path">

                                                        <div class="size-64x64"><span class="thumb"><i></i>
                                            <img width="64px" height="64px"
                                                 src="${S_URL}/att?path=${image.path}"></span></div>
                                                        <p><span><a
                                                                href="javascript:insert_editor('${S_URL}/att?path=${image.path}');">插入</a></span>
                                                            <span><a
                                                                    href="javascript:del_file_upload('${image.path}','${image.id}');">删除</a></span>
                                                        </p></li>
                                                </#list>
                                            </#if>
                                            </ul>
                                            <div class="tdare">

                                            </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </td>
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
<script charset="utf-8" src="${S_COMMON_URL}/scripts/fileupload/jquery.iframe-transport.js"
        type="text/javascript"></script>
<script charset="utf-8" src="${S_COMMON_URL}/scripts/fileupload/jquery.ui.widget.js" type="text/javascript"></script>
<script charset="utf-8" src="${S_COMMON_URL}/scripts/fileupload/jquery.fileupload.js" type="text/javascript"></script>

<script charset="utf-8" id="dialog_js" src="${S_COMMON_URL}/scripts/dialog/dialog.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/dialog/dialog.css">
<script src="${S_COMMON_URL}/scripts/ajaxfileupload/ajaxfileupload.js" type="text/javascript"></script>
<script src="${S_COMMON_URL}/scripts/jquery.Jcrop/jquery.Jcrop.js" type="text/javascript"></script>
<link id="cssfile2" type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/jquery.Jcrop/jquery.Jcrop.min.css">
<script>
    $(function () {
        $("#tabs").tabs();
    });

    $('#articlePublishTime').datepicker();
    $('#articleEndTime').datepicker();

    //KindEditor.htmlTags=null;
    var KE;
    KindEditor.ready(function (K) {
        KE = K.create("textarea[name='articleContent_zh']", {
            items: ['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
                'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                'superscript', '|', 'selectall', 'clearhtml', 'quickformat', '|',
                'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'insertfile', 'table', 'hr', 'emoticons', 'link', 'unlink', '|', 'about'],
            cssPath: "${S_COMMON_URL}/scripts/kindeditor/themes/default/default.css",
            uploadJson: SITEURL + '/ke/upload',
            allowImageUpload: true,
            allowFlashUpload: false,
            allowMediaUpload: false,
            allowFileManager: false,
            syncType: "form",
            filterMode : false,
            afterCreate: function () {
                var self = this;
                self.sync();
            },
            afterChange: function () {
                var self = this;
                self.sync();
            },
            afterBlur: function () {
                var self = this;
                self.sync();
            }
        });
        KE.appendHtml = function (id, val) {
            this.html(this.html() + val);
            if (this.isCreated) {
                var cmd = this.cmd;
                cmd.range.selectNodeContents(cmd.doc.body).collapse(false);
                cmd.select();
            }
            return this;
        }
    });

    var KE2;
    KindEditor.ready(function (K) {
        KE2 = K.create("textarea[name='articleContent_en']", {
            items: ['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
                'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                'superscript', '|', 'selectall', 'clearhtml', 'quickformat', '|',
                'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'insertfile', 'table', 'hr', 'emoticons', 'link', 'unlink', '|', 'about'],
            cssPath: "${S_COMMON_URL}/scripts/kindeditor/themes/default/default.css",
            uploadJson: SITEURL + '/ke/upload',
            allowImageUpload: true,
            allowFlashUpload: false,
            allowMediaUpload: false,
            allowFileManager: false,
            filterMode : false,
            syncType: "form",
            afterCreate: function () {
                var self = this;
                self.sync();
            },
            afterChange: function () {
                var self = this;
                self.sync();
            },
            afterBlur: function () {
                var self = this;
                self.sync();
            }
        });
        KE2.appendHtml = function (id, val) {
            this.html(this.html() + val);
            if (this.isCreated) {
                var cmd = this.cmd;
                cmd.range.selectNodeContents(cmd.doc.body).collapse(false);
                cmd.select();
            }
            return this;
        }
    });

    //裁剪图片后返回接收函数
    function call_back(picname) {
        $('#articleImage').val(picname);
        $('#view_img').attr('src', '${S_URL}/att?path=' + picname + '&' + Math.random());
    }
    $(function () {
        $('input[class="type-file-file"]').change(uploadChange);
        function uploadChange() {
            var filepatd = $(this).val();
            var extStart = filepatd.lastIndexOf(".");
            var ext = filepatd.substring(extStart, filepatd.lengtd).toUpperCase();
            if (ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG") {
                alert("file type error");
                $(this).attr('value', '');
                return false;
            }
            if ($(this).val() == '') return false;
            ajaxFileUpload();
        }

        function ajaxFileUpload() {
            $.ajaxFileUpload
            (
                    {
                        url: '../pic/avatar_save',
                        secureuri: false,
                        fileElementId: '_pic',
                        dataType: 'json',
                        success: function (data, status) {
                            if (data.status == 1) {
                                //ajax_form('cutpic', '裁剪', '../pic/pic_cut?x=256&y=141&resize=0&ratio=0&url=' + data.url, 690);
                                call_back(data.url);
                            } else {
                                alert(data.message);
                            }
                            $('input[class="type-file-file"]').bind('change', uploadChange);
                        },
                        error: function (data, status, e) {
                            if(!!data&&data.code==-1){
                                alert(data.message);
                            }else{
                                alert('图片上传失败！' + e);
                            }

                            $('input[class="type-file-file"]').bind('change', uploadChange);
                        }
                    }
            )
        };
    });
    //按钮先执行验证再提交表单
    $(function () {
        $("#submitBtn").click(function () {
            if ($("#article_form").valid()) {
                $("#article_form").submit();
            }
        });
    });
    //
    $(document).ready(function () {
        $('#article_form').validate({
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules: {
                articleTitle_zh: {
                    required: true
                },
                articleTitle_en: {
                    required: true
                },
                articleClassId: {
                    required: true
                },
                articleLink: {
                    url: true
                },
                articleContent_zh: {
                    required: true
                },
                articleContent_en: {
                    required: true
                },
                articleSort: {
                    number: true
                }
            },
            messages: {
                articleTitle_zh: {
                    required: '文章中文标题不能为空'
                },
                articleTitle_en: {
                    required: '文章英文标题不能为空'
                },
                articleClassId: {
                    required: '文章分类不能为空'
                },
                articleLink: {
                    url: '链接格式不正确'
                },
                articleContent_zh: {
                    required: '文章中文内容不能为空'
                },
                articleContent_en: {
                    required: '文章英文内容不能为空'
                },
                articleSort: {
                    number: '文章排序仅能为数字'
                }
            }
        });
        // 图片上传
        $('#fileupload_zh').each(function () {
            $(this).fileupload({
                dataType: 'json',
                url: 'article_pic_upload',
                done: function (e, data) {
                    if (data != 'error') {
                        add_uploadedfile(data.result);
                    }
                }
            });
        });
        $('#fileupload_en').each(function () {
            $(this).fileupload({
                dataType: 'json',
                url: 'article_pic_upload',
                done: function (e, data) {
                    if (data != 'error') {
                        add_uploadedfile(data.result);
                    }
                }
            });
        });
    });


    function add_uploadedfile(file_data) {
        var newImg_zh = '<li id="zh_' + file_data.file_id + '" class="picture"><input type="hidden" name="file_id" value="' + file_data.file_id + '" /><div class="size-64x64"><span class="thumb"><i></i><img src="${S_URL}/att?path=' + file_data.file_name + '" alt="' + file_data.file_name + '" width="64px" height="64px"/></span></div><p><span><a href="javascript:insert_editor_zh(\'${S_URL}/att?path=' + file_data.file_name + '\');">插入</a></span><span><a href="javascript:del_file_upload(\' ' + file_data.file_name + '\',\'' + file_data.file_id + '\');">删除</a></span></p></li>';
        var newImg_en = '<li id="en_' + file_data.file_id + '" class="picture"><input type="hidden" name="file_path" value="' + file_data.file_path + '" /><div class="size-64x64"><span class="thumb"><i></i><img src="${S_URL}/att?path=' + file_data.file_name + '" alt="' + file_data.file_name + '" width="64px" height="64px"/></span></div><p><span><a href="javascript:insert_editor_en(\'${S_URL}/att?path=' + file_data.file_name + '\');">插入</a></span><span><a href="javascript:del_file_upload(\' ' + file_data.file_name + '\',\'' + file_data.file_id + '\');">删除</a></span></p></li>';

        $('#thumbnails_zh').prepend(newImg_zh);
        $('#thumbnails_en').prepend(newImg_en);
    }
    function insert_editor_zh(file_path) {
        KE.appendHtml('articleContent_zh', '<img src="' + file_path + '" alt="' + file_path + '">');
    }
    function insert_editor_en(file_path) {
        KE2.appendHtml('articleContent_en', '<img src="' + file_path + '" alt="' + file_path + '">');
    }
    function del_file_upload(file_name, file_id) {
        if (!window.confirm('您确定要删除吗?')) {
            return;
        }
        $.getJSON('delete_image?<#if P_CMS_ARTICLE??>article_id=${P_CMS_ARTICLE.articleId}&</#if>file_id=' + file_id + '&file_name=' + file_name, function (result) {
            if (result) {
                $('#zh_' + file_id).remove();
                $('#en_' + file_id).remove();
            } else {
                alert('删除失败');
            }
        });
    }


</script>
</body>
</html>