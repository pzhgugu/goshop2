<#assign S_URL=request.contextPath />
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <script src="${S_URL}/static/scripts/jquery/jquery.js"></script>
    <script src="${S_URL}/static/scripts/swiper/swiper-3.3.1.jquery.min.js"></script>
    <script src="${S_URL}/static/scripts/ajaxfileupload/ajaxfileupload.js"></script>
    <link href="${S_URL}/static/scripts/swiper/swiper-3.3.1.min.css" rel="stylesheet" type="text/css"/>
    <link href="${S_URL}/static/scripts/swiper/style.css" rel="stylesheet" type="text/css"/>
    <link id="cssfile2" type="text/css" rel="stylesheet" href="${S_URL}/static/styles/skin_0.css">
    <link id="cssfile2" type="text/css" rel="stylesheet" href="${S_URL}/static/styles/seller_center.css">
    <link rel="stylesheet" href="${S_URL}/static/styles/font-awesome/css/font-awesome.min.css">
    <!--[if IE 7]>
    <link rel="stylesheet" href="${S_URL}/static/styles/font-awesome/css/font-awesome-ie7.min.css">
    <![endif]-->
    <script src="${S_URL}/static/scripts/shop/common.js"></script>
    <script src="${S_URL}/static/scripts/admincp.js"></script>
    <script src="${S_URL}/static/scripts/jquery.edit.js"></script>
    <script src="${S_URL}/static/scripts/store_slide.js"></script>
    <script>
        SITEURL="${S_URL}";
    </script>
</head>
<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>

<div class="page">

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
                <li>1. 最多可上传5张幻灯片图片。</li>
                <li>2. 支持jpg、jpeg、gif、png格式上传，建议图片宽度790px、高度在300px到400px之间、大小1.00M以内的图片。提交2~5张图片可以进行幻灯片播放，一张图片没有幻灯片播放效果。</li>
                <li>3. 操作完成以后，按“提交”按钮，可以在当前页面进行幻灯片展示。</li>
                <li>4. 跳转链接必须带有“http://”</li>


            </ul></td>
        </tr>
        </tbody>
    </table>

    <div class="content">
        <div class="zoomSpace"></div>
        <div class="swiper-container">
            <ul class="swiper-wrapper">
<#if (P_CSM_SLIDE_LIST?size>1)>
    <#list P_CSM_SLIDE_LIST as slide>
        <li class="swiper-slide"><img src="${S_URL}/att?path=${slide.slidePath}"></li>
    </#list>
    <#else>
                <li class="swiper-slide"><img src="${S_URL}/static/images/swiper/swiper1.png"></li>
                <li class="swiper-slide"><img src="${S_URL}/static/images/swiper/swiper2.png"></li>
</#if>
            </ul>
        </div>
        <div class="swiper-pagination"></div>
        <script>
            var mySwiper = new Swiper('.swiper-container', {
                autoplay: 5000,
                pagination: '.swiper-pagination',
                paginationClickable: true
            })
        </script>
    </div>
    <div class="ncsc-form-default" style="margin-top: 420px;">
    <form method="post" id="store_slide_form" action="save">
        <input type="hidden" value="ok" name="form_submit">
        <!-- 图片上传部分 -->
        <ul id="goods_images" class="ncsc-store-slider">
        <#list 1..5 as index>
            <span>${index}</span>
            <li id="thumbnail_${index}" nc_type="handle_pic">
                <div nctype="${index}" class="picture">
                    <#if (P_CSM_SLIDE_LIST[index-1]??)>
                        <img nctype="${index}"
                             src="${S_URL}/att?path=${P_CSM_SLIDE_LIST[index-1].slidePath}"/>
                        <#else>
                            <i class="icon-picture"></i>
                    </#if>

                    <input type="hidden" value="<#if (P_CSM_SLIDE_LIST[index-1]??)>${P_CSM_SLIDE_LIST[index-1].slideId}</#if>" nctype="${index}" name="ids"><a title="移除" class="del" nctype="del" href="javascript:void(0)">X</a></div>

                <div class="url">
                    <label>跳转URL...</label>
                    <input type="text" value="<#if (P_CSM_SLIDE_LIST[index-1]??)>${P_CSM_SLIDE_LIST[index-1].slideUrl!'http://'}<#else>http://</#if>" name="image_url" class="text w150">
                </div>
                <div class="url">
                    <label>排序</label>
                    <input type="text" value="<#if (P_CSM_SLIDE_LIST[index-1]??)>${P_CSM_SLIDE_LIST[index-1].slideSort!}</#if>" name="slide_sort" class="text w150">
                </div>
                <div class="ncsc-upload-btn"> <a href="javascript:void(0);"><span>

                    <#if (P_CSM_SLIDE_LIST[index-1]??)>
                        <input type="file" id="${index}" name="file" class="input-file" size="1" hidefocus="true" file_id="${P_CSM_SLIDE_LIST[index-1].slideId}">
                    <#else>
                        <input type="file" id="${index}" name="file" class="input-file" size="1" hidefocus="true" file_id="">
                    </#if>
          </span>
                    <p><i class="icon-upload-alt"></i>图片上传</p>
                </a></div></li>
        </#list>
        </ul>
        <div class="bottom"><label class="submit-border"><input type="submit" value="提交" class="submit"></label></div>
    </form>
</div>

</div>
</body>
</html>
