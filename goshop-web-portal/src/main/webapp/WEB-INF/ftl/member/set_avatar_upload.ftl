<#assign P_OP="avatar" />
<@override name="main">
<script src="${S_COMMON_URL}/scripts/jquery.Jcrop/jquery.Jcrop.js" type="text/javascript"></script>
<link id="cssfile2" type="text/css" rel="stylesheet" href="${S_COMMON_URL}/scripts/jquery.Jcrop/jquery.Jcrop.min.css">
<form method="post" id="form_cut" action="avatar.html">
    <input type="hidden" value="ok" name="form_submit">
    <input type="hidden" name="x1" id="x1">
    <input type="hidden" name="x2" id="x2">
    <input type="hidden" name="w" id="w">
    <input type="hidden" name="y1" id="y1">
    <input type="hidden" name="y2" id="y2">
    <input type="hidden" name="h" id="h">
    <input type="hidden" value="${P_USER_IMAGE}" name="newfile" id="newfile">

    <div class="pic-cut-120">
        <div class="work-title">工作区域</div>
        <div class="work-layer">
            <p><img src="${S_URL}/att.html?path=${P_USER_IMAGE}" id="nccropbox"/></p>
        </div>
        <div class="thumb-title">裁切预览</div>
        <div class="thumb-layer">
            <p><img src="${S_URL}/att.html?path=${P_USER_IMAGE}" id="preview"></p>
        </div>
        <div class="cut-help">
            <h4>操作帮助</h4>

            <p>请在工作区域放大缩小及移动选取框，选择要裁剪的范围，裁切宽高比例固定；裁切后的效果为右侧预览图所显示；保存提交后生效。</p>
        </div>
        <div class="cut-btn">
            <input type="button" value="提交" class="submit" id="ncsubmit">
        </div>
    </div>
</form>
<script type="text/javascript">
    $(function () {
        function showPreview(coords) {
            if (parseInt(coords.w) > 0) {
                var rx = 120 / coords.w;
                var ry = 120 / coords.h;
                $('#preview').css({
                    width: Math.round(rx * ${P_IMAGE_WIDTH}) + 'px',
                    height: Math.round(ry * ${P_IMAGE_HEIGHT}) + 'px',
                    marginLeft: '-' + Math.round(rx * coords.x) + 'px',
                    marginTop: '-' + Math.round(ry * coords.y) + 'px'
                });
            }
            $('#x1').val(coords.x);
            $('#y1').val(coords.y);
            $('#x2').val(coords.x2);
            $('#y2').val(coords.y2);
            $('#w').val(coords.w);
            $('#h').val(coords.h);
        }

        $('#nccropbox').Jcrop({
            aspectRatio: 1,
            setSelect: [0, 0, 120, 120],
            minSize: [50, 50],
            allowSelect: 0,
            onChange: showPreview,
            onSelect: showPreview
        });
        $('#ncsubmit').click(function () {
            var x1 = $('#x1').val();
            var y1 = $('#y1').val();
            var x2 = $('#x2').val();
            var y2 = $('#y2').val();
            var w = $('#w').val();
            var h = $('#h').val();
            if (x1 == "" || y1 == "" || x2 == "" || y2 == "" || w == "" || h == "") {
                alert("You must make a selection first");
                return false;
            } else {
                $('#form_cut').submit();
            }
        });
    });
</script>
</@override>
<@extends name="framework.ftl"/>