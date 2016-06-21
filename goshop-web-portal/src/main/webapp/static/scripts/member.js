$(function(){
    /* 全选 */
    $('.checkall').click(function(){
        var _self = this;
        $('.checkitem').each(function(){
            if (!this.disabled)
            {
                $(this).prop('checked', _self.checked);
            }
        });
        $('.checkall').prop('checked', this.checked);
    });

    /* 批量操作按钮 */
    $('a[nc_type="batchbutton"]').click(function(){
        /* 是否有选择 */
        if($('.checkitem:checked').length == 0){    //没有选择
            return false;
        }
        var _uri = $(this).attr('uri');
        var _name = $(this).attr('name');
        var handleResult = function(uri,name) {
        	
	         /* 获取选中的项 */
	        var items = '';
	        $('.checkitem:checked').each(function(){
	            items += this.value + ',';
	        });
	        items = items.substr(0, (items.length - 1));
	        /* 将选中的项通过GET方式提交给指定的URI */
//	        window.location.href=uri + '&' + name + '=' + items;
	        ajaxget(uri + '&' + name + '=' + items);
	        return false;
        }
        if($(this).attr('confirm')){
        	showDialog($(this).attr('confirm'), 'confirm', '', function(){handleResult(_uri,_name)});
        	return false;
        }
		handleResult(_uri,_name);
    });

    /* 缩小大图片 */
    $('.makesmall').each(function(){
        makesmall(this, $(this).attr('max_width'), $(this).attr('max_height'));
    });

    $('.su_btn').click(function(){
        if($(this).hasClass('close')){
            $(this).parent().next('.su_block').css('display', '');
            $(this).removeClass('close');
        }
        else{
            $(this).addClass('close');
            $(this).parent().next('.su_block').css('display', 'none');
        }
    });

    $('*[nc_type="dialog"]').click(function(){
        var id = $(this).attr('dialog_id');
        var title = $(this).attr('dialog_title') ? $(this).attr('dialog_title') : '';
        var url = $(this).attr('uri');
        var width = $(this).attr('dialog_width');
        CUR_DIALOG = ajax_form(id, title, url, width,0);
        return false;
    });

    $('*[nc_type="gselector"]').focus(function(){
        var id = $(this).attr('gs_id');
        var name = $(this).attr('gs_name');
        var callback = $(this).attr('gs_callback');
        var op = $(this).attr('gs_op');
        var store_id = $(this).attr('gs_store_id');
        var title = $(this).attr('gs_title') ? $(this).attr('gs_title') : '';
        var width = $(this).attr('gs_width');
        ajax_form(id, title, SITEURL + '/index.php?act=store_groupbuy&op=' + op + '&dialog=1&title=' + title + '&store_id=' + store_id+ '&id=' + id + '&name=' + name + '&callback=' + callback, width);
        return false;
    });

    var url = window.location.search;
    var params  = url.substr(1).split('&');
    var act = '';
    //找出排序的列和排序的方式及app控制器
    var sort  = '';
    var order = '';
    for(var j=0; j < params.length; j++)
    {
        var param = params[j];
        var arr   = param.split('=');
        if(arr[0] == 'act')
        {
            act = arr[1];
        }
        if(arr[0] == 'sort')
        {
            sort = arr[1];
        }
        if(arr[0] == 'order')
        {
            order = arr[1];
        }
    }
    $('span[nc_type="order_by"]').each(function(){
        if($(this).parent().attr('column') == sort)
        {
            if(order == 'asc')
            {
            $(this).removeClass();
            $(this).addClass("sort_asc");
            }
        else if (order == 'desc')
            {
            $(this).removeClass();
            $(this).addClass("sort_desc");
            }
        }
    });
    $('span[nc_type="order_by"]').click(function(){
        var s_name = $(this).parent().attr('column');
        var found   = false;
        for(var i = 0;i < params.length;i++)
        {
            var param = params[i];
            var arr   = param.split('=');
            if('page' == arr[0])
            {
                params[i] = 'page=1';
            }
            else if('sort' == arr[0])
            {
                params[i] = 'sort'+'='+ s_name;
                found = true;
            }
            else if('order' == arr[0])
            {
                params[i] = 'order'+'='+(arr[1] =='asc' ? 'desc' : 'asc');
            }
        }
        if(!found)
        {
                params.push('sort'+'='+ s_name);
                params.push('order=asc');
        }
        if(location.pathname.indexOf('/admin/')>-1)
        {
                location.assign(SITEURL + '/admin/index.php?' + params.join('&'));
                return;
        }
        location.assign(SITEURL + '/index.php?' + params.join('&'));
    });

    // 初始化上传
    trigger_uploader();
});


function set_zindex(parents, index){
    $.each(parents,function(i,n){
        if($(n).css('position') == 'relative'){//alert('relative');
            //alert($(n).css('z-index'));
            $(n).css('z-index',index);
        }
    });
}

function check_number(v)
{

    if(isNaN(v))
    {
        alert("必须是数字");//lang.only_number
        return false;
    }
    if(v.indexOf('-') > -1)
    {
        alert("必须是数字");//lang.only_number
        return false;
    }
    return true;
}
function check_required(v)
{
    if(v == '')
    {
        alert("不能为空");//lang.not_empty
        return false;
    }
    return true;
}

function check_pint(v)
{
    var regu = /^[0-9]{1,}$/;
    if(!regu.test(v))
    {
        alert("必须是整数");//lang.only_int
        return false;
    }
    return true;
}

function check_max(v)
{
    var regu = /^[0-9]{1,}$/;
    if(!regu.test(v))
    {
        alert("必须是整数");//lang.only_int
        return false;
    }
    var max = 255;
    if(parseInt(v) > parseInt(max))
    {

        alert("范围是0~"+max);//lang.small
        return false;
    }
    return true;
}

function trigger_uploader(){
    // 打开商品图片上传器
    $('#open_uploader').unbind('click');
    $('#open_uploader').click(function(){
        if($('#uploader').css('display') == 'none'){
            $('#uploader').show();
            $(this).find('.hide').attr('class','show');
        }else{
            $('#uploader').hide();
            $(this).find('.show').attr('class','hide');
        }
    });
    /* 悬停解释 */
    $('*[ecm_title]').hover(function(){
        $('*[nc_type="explain_layer"]').remove();
        $(this).parent().parent().append('<div class="titles" nc_type="explain_layer" style="display:none; z-index:999">' + $(this).attr('ecm_title') + '<div class="line"></div></div>');
        $('*[nc_type="explain_layer"]').fadeIn();
    },
    function(){
        $('*[nc_type="explain_layer"]').fadeOut();
    }
    );
}
