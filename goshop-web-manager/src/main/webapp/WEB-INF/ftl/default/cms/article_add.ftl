<#assign S_URL=request.contextPath />
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
            <h3>文章管理</h3>
            <ul class="tab-base">
                <li><a href="${S_URL}/cms_article/cms_article_list"><span>管理</span></a></li>
                <#if P_CMS_ARTICLE??>
                    <li><a href="${S_URL}/cms_article/add"><span>新增</span></a></li>
                    <li><a class="current" href="JavaScript:void(0);"><span>修改</span></a></li>
                <#else>
                    <li><a class="current" href="JavaScript:void(0);"><span>新增</span></a></li>
                </#if>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form name="articleForm" method="post" id="article_form">
<#if P_CMS_ARTICLE??>
    <input type="hidden" id="articleId" name="articleId" value="${P_CMS_ARTICLE.articleId}">
</#if>
        <table class="table tb-type2 nobdb">
            <tbody>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label class="validation">标题:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" id="articleTitle" name="articleTitle" value="<#if P_CMS_ARTICLE??>${P_CMS_ARTICLE.articleTitle!}</#if>"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="cate_id" class="validation">所属分类:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><select id="articleClassId" name="articleClassId">
                    <option value="">请选择...</option>
                <#list P_CLASS_LIST as articleClass>
                    <option value="${articleClass.classId}" <#if (P_CMS_ARTICLE??)&&(articleClass.classId==P_CMS_ARTICLE.articleClassId) > selected="selected" </#if>>&nbsp;&nbsp;${articleClass.className}</option>
                    <#if (articleClass.children?size>0) >
                        <#list articleClass.children as cGc>
                            <option value="${cGc.classId}" <#if (P_CMS_ARTICLE??)&&(articleClass.classId==cGc.articleClassId) > selected="selected" </#if>>&nbsp;&nbsp;&nbsp;&nbsp;${cGc.className}</option>
                        </#list>
                    </#if>
                </#list>
                </select></td>
                <td class="vatop tips"></td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td colspan="2" class="required"><label>标题图片:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform">
			<span class="type-file-show">
			<img class="show_image" src="${S_COMMON_URL}/images/preview.png">
			<div class="type-file-preview" style="display: none;"><img id="view_img" src="<#if (P_CMS_ARTICLE??&&P_CMS_ARTICLE.articleImage!='')>${S_URL}/att?path=${P_CMS_ARTICLE.articleImage}<#else>${S_COMMON_URL}/images/cms/no_cover.png</#if>"> </div>
			</span>
            <span class="type-file-box">
              <input type="text" name="articleImage" id="articleImage" class="type-file-text">
              <input type="button" name="button" id="button" value="" class="type-file-button">
              <input type="file" name="_pic" class="type-file-file" id="_pic" size="30" hidefocus="true">
            </span>
                </td>
                <td class="vatop tips">支持格式gif,jpg,jpeg,png</td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="articleForm">链接:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" id="articleLink" name="articleLink" value="<#if P_CMS_ARTICLE??>${P_CMS_ARTICLE.articleLink!}</#if>"></td>
                <td class="vatop tips">当填写"链接"后点击文章标题将直接跳转至链接地址，不显示文章内容。链接格式请以http://开头</td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2">发布状态:</td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><ul>
                    <li>
                        <input type="radio" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleState==3>checked="checked"</#if><#else>checked="checked"</#if> value="3" name="articleState">
                        <label>已发布</label>
                    </li>
                    <li>
                        <input <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleState==1>checked="checked"</#if></#if> type="radio" value="1" name="articleState">
                        <label>草稿</label>
                    </li>
                    <li>
                        <input <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleState==2>checked="checked"</#if></#if> type="radio" value="2" name="articleState">
                        <label>待审核</label>
                    </li>
                    <li>
                        <input <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleState==4>checked="checked"</#if></#if> type="radio" value="4" name="articleState">
                        <label>回收站</label>
                    </li>
                </ul></td>
                <td class="vatop tips"></td>
            </tr>

            <tr>
                <td class="required" colspan="2"><label class="validation">文章内容:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform" colspan="2">
                    <textarea style="width: 700px; height: 300px; visibility: hidden; display: none;" name="articleContent" id="articleContent"><#if P_CMS_ARTICLE??>${P_CMS_ARTICLE.articleContent!}</#if></textarea>
                    <script charset="utf-8" src="${S_COMMON_URL}/scripts/kindeditor/kindeditor-min.js"></script>
                    <script charset="utf-8" src="${S_COMMON_URL}/scripts/kindeditor/lang/zh_CN.js"></script>
                    <script>
                        var KE;
                        KindEditor.ready(function(K) {
                            KE = K.create("textarea[name='articleContent']", {
                                items : ['source', '|', 'fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste',
                                    'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                                    'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                                    'superscript', '|', 'selectall', 'clearhtml','quickformat','|',
                                    'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                                    'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'table', 'hr', 'emoticons', 'link', 'unlink', '|', 'about'],
                                cssPath : "${S_COMMON_URL}/scripts/kindeditor/themes/default/default.css",
                                uploadJson: SITEURL + '/ke/upload',
                                allowImageUpload : true,
                                allowFlashUpload : false,
                                allowMediaUpload : false,
                                allowFileManager : false,
                                syncType:"form",
                                afterCreate : function() {
                                    var self = this;
                                    self.sync();
                                },
                                afterChange : function() {
                                    var self = this;
                                    self.sync();
                                },
                                afterBlur : function() {
                                    var self = this;
                                    self.sync();
                                }
                            });
                            KE.appendHtml = function(id,val) {
                                this.html(this.html() + val);
                                if (this.isCreated) {
                                    var cmd = this.cmd;
                                    cmd.range.selectNodeContents(cmd.doc.body).collapse(false);
                                    cmd.select();
                                }
                                return this;
                            }
                        });
                    </script>
                </td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2">图片上传:</td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td id="divComUploadContainer" colspan="3"><input type="file" name="fileupload" id="fileupload" multiple="multiple"></td>
            </tr>
            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2">已传图片:</td>
            </tr><tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td colspan="2"><ul class="thumblists" id="thumbnails">
                </ul><div class="tdare">

                </div></td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2">文章摘要:
                </td></tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td colspan="2">
                    <textarea name="articleAbstract" cols="100" rows="3" style="height:56px;"><#if P_CMS_ARTICLE??>${P_CMS_ARTICLE.articleAbstract!}</#if></textarea>
                </td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="articleForm">文章来源:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" id="articleOrigin" name="articleOrigin" value="<#if P_CMS_ARTICLE??>${P_CMS_ARTICLE.articleOrigin!}</#if>"></td>
                <td class="vatop tips"></td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="articleForm">文章来源链接:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" id="articleOriginAddress" name="articleOriginAddress" value="<#if P_CMS_ARTICLE??>${P_CMS_ARTICLE.articleOriginAddress!}</#if>"></td>
                <td class="vatop tips"></td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label for="articleForm">文章作者:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" id="articleAuthor" name="articleAuthor" value="<#if P_CMS_ARTICLE??>${P_CMS_ARTICLE.articleAuthor!}</#if>"></td>
                <td class="vatop tips"></td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>推荐:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform onoff">
                    <label class="cb-enable <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleCommendFlag==1>selected</#if><#else>selected</#if> " for="articleCommendFlag1"><span>是</span></label>
                    <label class="cb-disable <#if P_CMS_ARTICLE??&&P_CMS_ARTICLE.articleCommendFlag==0>selected</#if>"  for="articleCommendFlag0"><span>否</span></label>
                    <input type="radio" value="1" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleCommendFlag==1>checked="checked"</#if><#else>checked="checked"</#if> name="articleCommendFlag" id="articleCommendFlag1">
                    <input type="radio" value="0" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleCommendFlag==0>checked="checked"</#if></#if> name="articleCommendFlag" id="articleCommendFlag0"></td>
                <td class="vatop tips"></td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2">精华等级:</td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><ul>
                    <li>
                        <input type="radio" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleDigest==0>checked="checked"</#if><#else>checked="checked"</#if> value="0" name="articleDigest">
                        <label>非精华</label>
                    </li>
                    <li>
                        <input type="radio" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleDigest==1>checked="checked"</#if></#if> value="1" name="articleDigest">
                        <label>精华I</label>
                    </li>
                    <li>
                        <input type="radio" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleDigest==2>checked="checked"</#if></#if> value="2" name="articleDigest">
                        <label>精华II</label>
                    </li>
                    <li>
                        <input type="radio" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleDigest==3>checked="checked"</#if></#if> value="3" name="articleDigest">
                        <label>精华III</label>
                    </li>
                </ul></td>
                <td class="vatop tips"></td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>评论:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform onoff">
                    <label class="cb-enable <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleCommentFlag==1>selected</#if><#else>selected</#if>" for="articleCommentFlag1"><span>是</span></label>
                    <label class="cb-disable <#if P_CMS_ARTICLE??&&P_CMS_ARTICLE.articleCommentFlag==0>selected</#if>" for="articleCommentFlag0"><span>否</span></label>
                    <input type="radio" value="1" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleCommentFlag==1>checked="checked"</#if><#else>checked="checked"</#if> name="articleCommentFlag" id="articleCommentFlag1">
                    <input type="radio" value="0" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleCommentFlag==0>checked="checked"</#if></#if> name="articleCommentFlag" id="articleCommentFlag0"></td>
                <td class="vatop tips"></td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>态度:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform onoff">
                    <label class="cb-enable <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleAttitudeFlag==1>selected</#if><#else>selected</#if>" for="articleAttitudeFlag1"><span>是</span></label>
                    <label class="cb-disable <#if P_CMS_ARTICLE??&&P_CMS_ARTICLE.articleAttitudeFlag==0>selected</#if>"  for="articleAttitudeFlag0"><span>否</span></label>
                    <input type="radio" value="1" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleAttitudeFlag==1>checked="checked"</#if><#else>checked="checked"</#if> name="articleAttitudeFlag" id="articleAttitudeFlag1">
                    <input type="radio" value="0" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleAttitudeFlag==0>checked="checked"</#if></#if> name="articleAttitudeFlag" id="articleAttitudeFlag0"></td>
                <td class="vatop tips"></td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2"><label>图文推荐:</label></td>
            </tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform onoff">
                    <label class="cb-enable <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleCommendImageFlag==1>selected</#if><#else>selected</#if>" for="articleCommendImageFlag1"><span>是</span></label>
                    <label class="cb-disable <#if P_CMS_ARTICLE??&&P_CMS_ARTICLE.articleCommendImageFlag==0>selected</#if>"  for="articleCommendImageFlag0"><span>否</span></label>
                    <input type="radio" value="1" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleCommendImageFlag==1>checked="checked"</#if><#else>checked="checked"</#if> name="articleCommendImageFlag" id="articleCommendImageFlag1">
                    <input type="radio" value="0" <#if P_CMS_ARTICLE??><#if P_CMS_ARTICLE.articleCommendImageFlag==0>checked="checked"</#if></#if> name="articleCommendImageFlag" id="articleCommendImageFlag0"></td>
                <td class="vatop tips"></td>
            </tr>

            <tr style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="required" colspan="2">排序:
                </td></tr>
            <tr class="noborder" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                <td class="vatop rowform"><input type="text" class="txt" id="articleSort" name="articleSort" value="<#if P_CMS_ARTICLE??>${P_CMS_ARTICLE.articleSort!255}</#if>"></td>
                <td class="vatop tips"></td>
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
<script charset="utf-8" src="${S_COMMON_URL}/scripts/fileupload/jquery.iframe-transport.js" type="text/javascript"></script>
<script charset="utf-8" src="${S_COMMON_URL}/scripts/fileupload/jquery.ui.widget.js" type="text/javascript"></script>
<script charset="utf-8" src="${S_COMMON_URL}/scripts/fileupload/jquery.fileupload.js" type="text/javascript"></script>

<script charset="utf-8" id="dialog_js" src="${S_COMMON_URL}/scripts/dialog/dialog.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/dialog/dialog.css">
<script src="${S_COMMON_URL}/scripts/ajaxfileupload/ajaxfileupload.js" type="text/javascript"></script>
<script src="${S_COMMON_URL}/scripts/jquery.Jcrop/jquery.Jcrop.js" type="text/javascript"></script>
<link id="cssfile2" type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/jquery.Jcrop/jquery.Jcrop.min.css">
<script>

    //裁剪图片后返回接收函数
    function call_back(picname){
        $('#articleImage').val(picname);
        $('#view_img').attr('src','${S_URL}/att?path='+picname+'&'+Math.random());
    }
    $(function() {
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
                                ajax_form('cutpic', '裁剪', '../pic/pic_cut?x=60&y=50&resize=0&ratio=0&url=' + data.url, 690);
                            } else {
                                alert(data.msg);
                            }
                            $('input[class="type-file-file"]').bind('change', uploadChange);
                        },
                        error: function (data, status, e) {
                            alert('图片上传失败！'+e);
                            $('input[class="type-file-file"]').bind('change', uploadChange);
                        }
                    }
            )
        };
    });
    //按钮先执行验证再提交表单
    $(function(){$("#submitBtn").click(function(){
        if($("#article_form").valid()){
            $("#article_form").submit();
        }
    });
    });
    //
    $(document).ready(function(){
        $('#article_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
                articleTitle : {
                    required   : true
                },
                articleClassId : {
                    required   : true
                },
                articleLink : {
                    url : true
                },
                articleContent : {
                    required   : true
                },
                articleSort : {
                    number   : true
                }
            },
            messages : {
                articleTitle : {
                    required   : '文章标题不能为空'
                },
                articleClassId : {
                    required   : '文章分类不能为空'
                },
                articleLink : {
                    url : '链接格式不正确'
                },
                articleContent : {
                    required   : '文章内容不能为空'
                },
                articleSort  : {
                    number   : '文章排序仅能为数字'
                }
            }
        });
        // 图片上传
        $('#fileupload').each(function(){
            $(this).fileupload({
                dataType: 'json',
                url: 'article_pic_upload',
                done: function (e,data) {
                    if(data != 'error'){
                        add_uploadedfile(data.result);
                    }
                }
            });
        });
    });


    function add_uploadedfile(file_data)
    {
        var newImg = '<li id="' + file_data.file_id + '" class="picture"><input type="hidden" name="file_id" value="' + file_data.file_id + '" /><div class="size-64x64"><span class="thumb"><i></i><img src="${S_URL}/att?path=' + file_data.file_name + '" alt="' + file_data.file_name + '" width="64px" height="64px"/></span></div><p><span><a href="javascript:insert_editor(\'${S_URL}/att?path=' + file_data.file_name + '\');">插入</a></span><span><a href="javascript:del_file_upload(' + file_data.file_id + ');">删除</a></span></p></li>';
        $('#thumbnails').prepend(newImg);
    }
    function insert_editor(file_path){
        KE.appendHtml('articleContent', '<img src="'+ file_path + '" alt="'+ file_path + '">');
    }
    function del_file_upload(file_id)
    {
        if(!window.confirm('您确定要删除吗?')){
            return;
        }
        $.getJSON('index.php?act=article&amp;op=ajax&amp;branch=del_file_upload&amp;file_id=' + file_id, function(result){
            if(result){
                $('#' + file_id).remove();
            }else{
                alert('删除失败');
            }
        });
    }


</script>
</body>
</html>