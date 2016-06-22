/* 多级选择相关函数，如地区选择，分类选择
 * common_select
 */

/* 地区选择函数 */
function regionInit(divId){
	var area_id = 0;	
	getArea(function(){
		if(typeof(nc_a[area_id]) == 'object' && nc_a[area_id].length > 0){//数组存在
			var area_select = $("#" + divId + " > select");//选择要初始化的对象
			areaInit(area_select,area_id);
		}
		$("#" + divId + " > select").change(regionChange); // select的onchange事件
		$("#" + divId + " > input:button[class='edit_region']").click(regionEdit); // 编辑按钮的onclick事件
	});
}
function areaInit(area_select,area_id){//初始化地区
	getArea(function(){
		if(typeof(area_select) == 'object' && nc_a[area_id].length > 0){
			var areas = new Array();
			areas = nc_a[area_id];
			$(area_select).append("<option value=''>-请选择-</option>");
			for (i = 0; i <areas.length; i++){
				$(area_select).append("<option value='" + areas[i][0] + "'>" + areas[i][1] + "</option>");
			}
		}
	});
}
if(typeof(regionChange) != 'function'){//检测是否已经被定义过，防止重写
	function regionChange(){
	    // 删除后面的select
	    $(this).nextAll("select").remove();
	    // 计算当前选中到id和拼起来的name
	    var selects = $(this).siblings("select").andSelf();
	    var id = '';
	    var names = new Array();
	    for (i = 0; i < selects.length; i++){
	        sel = selects[i];
	        if (sel.value > 0){
	            id = sel.value;
	            name = sel.options[sel.selectedIndex].text;
	            names.push(name);
	        }
	    }
	    $(".area_ids").val(id);
	    $(".area_name").val(name);
	    $(".area_names").val(names.join("\t"));
	    
	    if (this.value > 0){//下级地区
	        var area_id = this.value;
	        if(typeof(nc_a[area_id]) == 'object' && nc_a[area_id].length > 0){//数组存在
	        	$("<select></select>").change(regionChange).insertAfter(this);
	        	areaInit($(this).next("select"),area_id);//初始化地区
	        }
	    }
	}
}

function regionEdit()
{
    $(this).siblings("select").show();
    $(this).siblings("span").andSelf().hide();
}

/* 商品分类选择函数 */
function gcategoryInit(divId)
{
    $("#" + divId + " > select").get(0).onchange = gcategoryChange; // select的onchange事件
    window.onerror = function(){return true;}; //屏蔽jquery报错
    $("#" + divId + " .edit_gcategory").click(gcategoryEdit); // 编辑按钮的onclick事件
}

function gcategoryChange()
{
    // 删除后面的select
    $(this).nextAll("select").remove();

    // 计算当前选中到id和拼起来的name
    var selects = $(this).siblings("select").andSelf();
    var id = 0;
    var names = new Array();
    for (i = 0; i < selects.length; i++)
    {
        sel = selects[i];
        if (sel.value > 0)
        {
            id = sel.value;
            name = sel.options[sel.selectedIndex].text;
            names.push(name);
        }
    }
    $(this).parent().find(".mls_id").val(id);
    $(this).parent().find(".mls_name").val(name);
    $(this).parent().find(".mls_names").val(names.join("\t"));

    // ajax请求下级分类
	if (!!this.value)
    {
        var _self = this;
		var url = SELECT_URL + '/goods_class/json_class?callback=?';
        $.getJSON(url, {'gc_parent_id':this.value}, function(data){
            if (data)
            {
                if (data.length > 0)
                {
                    $("<select class='class-select'><option>-请选择-</option></select>").change(gcategoryChange).insertAfter(_self);
                    var data  = data;
                    for (i = 0; i < data.length; i++)
                    {
                        $(_self).next("select").append("<option value='" + data[i].gc_id + "'>" + data[i].gc_name + "</option>");
                    }
                }
            }
        });
    }
}

function gcategoryEdit()
{
    $(this).siblings("select").show();
    $(this).siblings("span").andSelf().remove();
}
if(typeof(jQuery.validator.addMethod) == 'function'){//添加自动检测是否是最后一级地区
	jQuery.validator.addMethod("checkarea", function(value, element) {
		return this.optional(element) || (typeof(nc_a[value]) == 'undefined');//当数组不存在时确定选到最后
	}, "请选择所在地区");
} 
function getArea(callback){
	if(typeof(nc_a) == 'undefined'){//加载地区数据
		var area_scripts_src =  __uri("area_array.js");
		$.getScript(area_scripts_src,function(){
				callback();
				return true;
		});
	} else {
		callback();
	}
}