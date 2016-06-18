// JavaScript Document


//自定义radio样式
$(document).ready( function(){
	$(".cb-enable").click(function(){
		var parent = $(this).parents('.onoff');
		$('.cb-disable',parent).removeClass('selected');
		$(this).addClass('selected');
		$('.checkbox',parent).prop('checked', true);
	});
	$(".cb-disable").click(function(){
		var parent = $(this).parents('.onoff');
		$('.cb-enable',parent).removeClass('selected');
		$(this).addClass('selected');
		$('.checkbox',parent).prop('checked', false);
	});
});


//图片比例缩放控制
function DrawImage(ImgD, FitWidth, FitHeight) {
	var image = new Image();
	image.src = ImgD.src;
	if (image.width > 0 && image.height > 0) {
		if (image.width / image.height >= FitWidth / FitHeight) {
			if (image.width > FitWidth) {
				ImgD.width = FitWidth;
				ImgD.height = (image.height * FitWidth) / image.width;
			} else {
				ImgD.width = image.width;
				ImgD.height = image.height;
			}
		} else {
			if (image.height > FitHeight) {
				ImgD.height = FitHeight;
				ImgD.width = (image.width * FitHeight) / image.height;
			} else {
				ImgD.width = image.width;
				ImgD.height = image.height;
			}
		}
	}
}


$(function(){
	// 显示隐藏预览图 start
	$('.show_image').hover(
		function(){
			$(this).next().css('display','block');
		},
		function(){
			$(this).next().css('display','none');
		}
	);

	// 全选 start
	$('.checkall').click(function(){
		$('.checkall').prop('checked',$(this).prop('checked'));
		$('.checkitem').each(function(){
			$(this).prop('checked',$('.checkall').prop('checked'));
		});
	});

	// 表格鼠标悬停变色 start
	$("tbody tr").hover(
		function(){
			$(this).css({background:"#FBFBFB"} );
		},
		function(){
			$(this).css({background:"#FFF"} );
		});

	// 可编辑列（input）变色
	$('.editable').hover(
		function(){
			$(this).removeClass('editable').addClass('editable2');
		},
		function(){
			$(this).removeClass('editable2').addClass('editable');
		}
	);

	// 提示操作 展开与隐藏
	$("#prompt tr:odd").addClass("odd");
	$("#prompt tr:not(.odd)").hide();
	$("#prompt tr:first-child").show();

	$("#prompt tr.odd").click(function(){
		$(this).next("tr").toggle();
		$(this).find(".title").toggleClass("ac");
		$(this).find(".arrow").toggleClass("up");

	});

	// 可编辑列（area）变色
	$('.editable-tarea').hover(
		function(){
			$(this).removeClass('editable-tarea').addClass('editable-tarea2');
		},
		function(){
			$(this).removeClass('editable-tarea2').addClass('editable-tarea');
		}
	);

});

/* 火狐下取本地全路径 */
function getFullPath(obj)
{
	if(obj)
	{
		// ie
		if (window.navigator.userAgent.indexOf("MSIE")>=1)
		{
			obj.select();
			if(window.navigator.userAgent.indexOf("MSIE") == 25){
				obj.blur();
			}
			return document.selection.createRange().text;
		}
		// firefox
		else if(window.navigator.userAgent.indexOf("Firefox")>=1)
		{
			if(obj.files)
			{
				//return obj.files.item(0).getAsDataURL();
				return window.URL.createObjectURL(obj.files.item(0));
			}
			return obj.value;
		}
		return obj.value;
	}
}


