cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
    {
        "file": "plugins/cordova-plugin-whitelist/whitelist.js",
        "id": "cordova-plugin-whitelist.whitelist",
        "runs": true
    },
    {
        "file": "plugins/cordova-plugin-device/www/device.js",
        "id": "cordova-plugin-device.device",
        "clobbers": [
            "device"
        ]
    },
    {
        "file": "plugins/cordova-plugin-ionic-keyboard/www/keyboard.js",
        "id": "cordova-plugin-ionic-keyboard.keyboard",
        "clobbers": [
            "cordova.plugins.Keyboard"
        ]
    },
    {
        "file": "plugins/cordova-plugin-statusbar/www/statusbar.js",
        "id": "cordova-plugin-statusbar.statusbar",
        "clobbers": [
            "window.StatusBar"
        ]
    },
    {
        "file": "plugins/jaeger.Html5Video/www/Html5Video.js",
        "id": "jaeger.Html5Video.Html5Video",
        "clobbers": [
            "plugins.html5Video"
        ]
    },
    {
        "file": "plugins/com.dawsonloudon.videoplayer/www/VideoPlayer.js",
        "id": "com.dawsonloudon.videoplayer.VideoPlayer",
        "clobbers": [
            "VideoPlayer"
        ]
    },
    {
        "file": "plugins/cordova-plugin-splashscreen/www/splashscreen.js",
        "id": "cordova-plugin-splashscreen.SplashScreen",
        "clobbers": [
            "navigator.splashscreen"
        ]
    },
    {
        "file": "plugins/cn.jpush.phonegap.JPushPlugin/www/JPushPlugin.js",
        "id": "cn.jpush.phonegap.JPushPlugin.JPushPlugin",
        "clobbers": [
            "window.plugins.jPushPlugin"
        ]
    }
];
module.exports.metadata = 
// TOP OF METADATA
{
    "cordova-plugin-whitelist": "1.0.0",
    "cordova-plugin-device": "1.0.1",
    "cordova-plugin-ionic-keyboard": "1.0.5",
    "cordova-plugin-statusbar": "1.0.1",
    "jaeger.Html5Video": "1.2.1",
    "com.dawsonloudon.videoplayer": "1.0.0",
    "cordova-plugin-splashscreen": "2.1.1-dev",
    "cn.jpush.phonegap.JPushPlugin": "2.0.2"
}
// BOTTOM OF METADATA
});