
cordova.define("cordova/plugins/Baidushare", 
  function(require, exports, module) {
    var exec = require("cordova/exec");
    var Baidushare = function() {};
     
	  Baidushare.prototype.bdshare = function(title,content,url,imageurl,successCallback, errorCallback) {
        if (errorCallback == null) { errorCallback = function() {}}
    
        if (typeof errorCallback != "function")  {
            console.log("Baidushare failure: failure parameter not a function");
            return
        }
    
        if (typeof successCallback != "function") {
            console.log("Baidushare failure: success callback parameter must be a function");
            return
        }
    
        exec(successCallback, errorCallback, 'Baidushare', 'bdshare', [{"title":title, "content": content,"url":url, "imageurl": imageurl}]);
    };
	
    var Baidushare = new Baidushare();
    module.exports = Baidushare;

});

  
if(!window.plugins) {
    window.plugins = {};
}
if (!window.plugins.Baidushare) {
    window.plugins.Baidushare = cordova.require("cordova/plugins/Baidushare");
}

 