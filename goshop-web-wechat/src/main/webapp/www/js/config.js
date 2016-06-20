var S_URL_CMS_R='http://127.0.0.1:8080/cms/';
var S_URL='http://127.0.0.1:8080/wx/';
angular.module("starter.config", [])
    .constant("ENV", {
            // "name": "production",
            "debug": false,
            "categoryQueryUrl": S_URL_CMS_R+"cms_article_class/query",
            "newSlideUrl":S_URL_CMS_R+"cms_slide/new_slide",
            'articleLangUrl':S_URL_CMS_R+"article_lang/image_query",
            'articleLangPageUrl':S_URL_CMS_R+"article_lang/page",
            'version':'1.0.1'
    });
