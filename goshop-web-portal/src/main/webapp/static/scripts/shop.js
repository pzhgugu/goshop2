/** header.php **/
function slideUp_fn()
{
    $('.ncs_cart_popup').slideUp('slow');
}
//
$(function(){
	$(".ncs-search-input-text").focus(function(){
  		$(".search a").css("display","block");
	});
	$("#formSearch").blur(function(){
  		$(".search a").css("display","none");
	});
});
// 头部导航下拉菜单
	var timeout         = 500;
	var closetimer		= 0;
	var ddmenuitem      = 0;

	function jsddm_open()
	{	jsddm_canceltimer();
		jsddm_close();
		ddmenuitem = $(this).find('.sub').eq(0).css('visibility', 'visible');}

	function jsddm_close()
	{	if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');}

	function jsddm_timer()
	{	closetimer = window.setTimeout(jsddm_close, timeout);}

	function jsddm_canceltimer()
	{	if(closetimer)
		{	window.clearTimeout(closetimer);
			closetimer = null;}}

	$(document).ready(function()
	{	$('#jsddm > div').bind('mouseover', jsddm_open);
		$('#jsddm > div').bind('mouseout',  jsddm_timer);});

