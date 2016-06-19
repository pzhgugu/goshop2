<#assign S_URL=request.contextPath />

<div class="page">
    <form action="../pic/pic_cut" id="form_cut" method="post">
        <input type="hidden" id="x" name="x" value="${x}" />
        <input type="hidden" id="x1" name="x1" />
        <input type="hidden" id="y1" name="y1" />
        <input type="hidden" id="x2" name="x2" />
        <input type="hidden" id="y2" name="y2" />
        <input type="hidden" id="w" name="w" />
        <input type="hidden" id="h" name="h" />
        <input type="hidden" id="url" name="url" value="${url}" />
        <input type="hidden" id="filename" name="filename" />
        <div class="pic-cut-120member">
            <div class="work-title">工作区域</div>
            <div class="work-layer">
                <p><img id="nccropbox" src="${S_URL}/att?path=${url}"/></p>
            </div>
            <div class="thumb-title">裁切预览</div>
            <div class="thumb-layer">
                <p><img id="preview" src="${S_URL}/att?path=${url}"/></p>
            </div>
            <div class="cut-help">
                <h4>操作帮助</h4>
                <p>请在工作区域放大缩小及移动选取框，选择要裁剪的范围，裁切宽高比例固定；裁切后的效果为右侧预览图所显示；保存提交后生效。</p>
            </div>
            <div class="cut-btn"> <a href="JavaScript:void(0);" class="btn" id="pic_submit"><span>提交</span
                    ></a> </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    function showPreview(coords)
    {
        if (parseInt(coords.w) > 0){
            var rx = 120 / coords.w;
            var ry = 120 / coords.h;
            $('#preview').css({
                width: Math.round(rx * ${width}) + 'px',
                height: Math.round(ry * ${height}) + 'px',
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
    function submitCoords(c){
        $('#pic_submit').click();
    }
    $(function(){
        $('.dialog_head').css('margin-top','0px');
        $('.page').css('padding-top','0px');
        $('.dialog_close_button').remove();
        $('#nccropbox').Jcrop({
            aspectRatio: ${ratio},
            setSelect: [ 0, 0, ${x}, ${y} ],
            minSize:[50, 50],
            allowSelect:0,
            allowResize:${resize},
            onChange: showPreview,
            onSelect: showPreview,
            onDblClick:submitCoords
        });

        $('#pic_submit').click(function(){
            var d=$('#form_cut').serialize();
            $.post('../pic/pic_cut',d,function(data){
                call_back(data);
                DialogManager.close('cutpic');
            });
        });
    });
</script>