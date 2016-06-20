cordova.define("jaeger.Html5Video.Html5Video", function(require, exports, module) { var exec = require("cordova/exec");
var Html5Video = function() {};

Html5Video.prototype._videos = {};
Html5Video.prototype._callbacks = {};

/*
 * videos - a map between html video tag ids and the file name of the video
 * they play. In addition, file names must be all lowercase, with only
 * alpha-numeric characters 
 * eg: {"video1":"video1file.mp4", "video2":"video2file.mp4"}
 */
Html5Video.prototype.initialize = function(videos) {
	var me = this;

	if (!videos)
		return false;

	me._videos = videos;
	if (device.platform == 'Android' || device.platform == 'amazon-fireos') {
		return cordova.exec(function(result) {
			me._videos = result;
		}, function(err) {
			console.error('html video error: ' + err);
		}, 'Html5Video', 'initialize', [ videos ]);
	}
};

/*
 * videoId - the html video tag id of the video to play 
 * callback - a function that is called when the video has finished playing
 */
Html5Video.prototype.play = function(videoId, callback) {
	var me = this;
	me._callbacks[videoId] = callback;

	if (device.platform == 'Android' || device.platform == 'amazon-fireos') {
		return cordova.exec(function(result) {			
		}, function(err) {
			console.error('html video error: ' + err);
		}, 'Html5Video', 'play', [ videoId ]);
	} else {
		this._play(document.getElementById(videoId));
	}
}

Html5Video.prototype._play = function(video) {
	var me = this,
		videoId = video.id;

	video.src = me._videos[videoId];
	//video.setAttribute('poster', video.getAttribute('poster'));		

	video.addEventListener("timeupdate", function() {
		if (video.duration > 0 
			&& Math.round(video.duration) - Math.round(video.currentTime) == 0) {
			
			//if loop atribute is set, restart video
		    if (video.loop) {
		        video.currentTime = 0;
		    }
			
			//if a callback function was set, trigger it
		    if (!!me._callbacks[videoId]) {
		        me._callbacks[videoId](video);
		        if (!video.loop) {
		            delete me._callbacks[videoId];
		        }
		    }
		}
	}, false);
	
	video.addEventListener("canplay", function(){
		video.removeEventListener("canplay", this, false);
		video.play();
	}, false);
	
	video.play();
}

module.exports = new Html5Video();

});
