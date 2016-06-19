@if (@_win32 && @_jscript_version>4)
var minmax_elements;
minmax_props= new Array(
new Array('min-width', 'minWidth'),
new Array('max-width', 'maxWidth'),
new Array('min-height','minHeight'),
new Array('max-height','maxHeight')
);
// Binding. Called on all new elements. If <body>, initialise; check all
// elements for minmax properties
function minmax_bind(el) {
var i, em, ms;
var st= el.style, cs= el.currentStyle;
if (minmax_elements==window.undefined) {
// initialise when body element has turned up, but only on IE
if (!document.body || !document.body.currentStyle) return;
minmax_elements= new Array();
window.attachEvent('onresize', minmax_delayout);
// make font size listener
em= document.createElement('div');
em.setAttribute('id', 'minmax_em');
em.style.position= 'absolute'; em.style.visibility= 'hidden';
em.style.fontSize= 'xx-large'; em.style.height= '5em';
em.style.top='-5em'; em.style.left= '0';
if (em.style.setExpression) {
em.style.setExpression('width', 'minmax_checkFont()');
document.body.insertBefore(em, document.body.firstChild);
}
}
// transform hyphenated properties the browser has not caught to camelCase
for (i= minmax_props.length; i-->0;)
if (cs[minmax_props[i][0]])
st[minmax_props[i][1]]= cs[minmax_props[i][0]];
// add element with properties to list, store optimal size values
for (i= minmax_props.length; i-->0;) {
ms= cs[minmax_props[i][1]];
if (ms && ms!='auto' && ms!='none' && ms!='0' && ms!='') {
st.minmaxWidth= cs.width; st.minmaxHeight= cs.height;
minmax_elements[minmax_elements.length]= el;
// will need a layout later
minmax_delayout();
break;
} }
}
// check for font size changes
var minmax_fontsize= 0;
function minmax_checkFont() {
var fs= document.getElementById('minmax_em').offsetHeight;
if (minmax_fontsize!=fs && minmax_fontsize!=0)
minmax_delayout();
minmax_fontsize= fs;
return '5em';
}
// Layout. Called after window and font size-change. Go through elements we
// picked out earlier and set their size to the minimum, maximum and optimum,
// choosing whichever is appropriate
// Request re-layout at next available moment
var minmax_delaying= false;
function minmax_delayout() {
if (minmax_delaying) return;
minmax_delaying= true;
window.setTimeout(minmax_layout, 0);
}
function minmax_stopdelaying() {
minmax_delaying= false;
}
function minmax_layout() {
window.setTimeout(minmax_stopdelaying, 100);
var i, el, st, cs, optimal, inrange;
for (i= minmax_elements.length; i-->0;) {
el= minmax_elements[i]; st= el.style; cs= el.currentStyle;
// horizontal size bounding
st.width= st.minmaxWidth; optimal= el.offsetWidth;
inrange= true;
if (inrange && cs.minWidth && cs.minWidth!='0' && cs.minWidth!='auto' && cs.minWidth!='') {
st.width= cs.minWidth;
inrange= (el.offsetWidth<optimal);
}
if (inrange && cs.maxWidth && cs.maxWidth!='none' && cs.maxWidth!='auto' && cs.maxWidth!='') {
st.width= cs.maxWidth;
inrange= (el.offsetWidth>optimal);
}
if (inrange) st.width= st.minmaxWidth;
// vertical size bounding
st.height= st.minmaxHeight; optimal= el.offsetHeight;
inrange= true;
if (inrange && cs.minHeight && cs.minHeight!='0' && cs.minHeight!='auto' && cs.minHeight!='') {
st.height= cs.minHeight;
inrange= (el.offsetHeight<optimal);
}
if (inrange && cs.maxHeight && cs.maxHeight!='none' && cs.maxHeight!='auto' && cs.maxHeight!='') {
st.height= cs.maxHeight;
inrange= (el.offsetHeight>optimal);
}
if (inrange) st.height= st.minmaxHeight;
}
}
// Scanning. Check document every so often until it has finished loading. Do
// nothing until <body> arrives, then call main init. Pass any new elements
// found on each scan to be bound
var minmax_SCANDELAY= 500;
function minmax_scan() {
var el;
for (var i= 0; i<document.all.length; i++) {
el= document.all[i];
if (!el.minmax_bound) {
el.minmax_bound= true;
minmax_bind(el);
} }
}
var minmax_scanner;
function minmax_stop() {
window.clearInterval(minmax_scanner);
minmax_scan();
}
minmax_scan();
minmax_scanner= window.setInterval(minmax_scan, minmax_SCANDELAY);
window.attachEvent('onload', minmax_stop);
@end 