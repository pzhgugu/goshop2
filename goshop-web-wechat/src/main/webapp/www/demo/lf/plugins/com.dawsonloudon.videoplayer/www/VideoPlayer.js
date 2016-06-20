cordova.define("com.dawsonloudon.videoplayer.VideoPlayer", function(require, exports, module) { /*-
 * cordova VideoPlayer Plugin for Android
 *
 * Created by Simon MacDonald (2008) MIT Licensed
 * Revised for Cordova 3.3+ by Dawson Loudon (2013) MIT Licensed
 *
 * Usages:
 *
 * VideoPlayer.play("http://path.to.my/video.mp4");
 * VideoPlayer.play("file:///path/to/my/video.mp4");
 * VideoPlayer.play("file:///android_asset/www/path/to/my/video.mp4");
 * VideoPlayer.play("https://www.youtube.com/watch?v=en_sVVjWFKk");
 */

var exec = require("cordova/exec");

var VideoPlayer = {
    play: function(url) {
        exec(null, null, "VideoPlayer", "playVideo", [url]);
    }
};

module.exports = VideoPlayer;


});
