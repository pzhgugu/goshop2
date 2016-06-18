package org.goshop.common.utils;


import com.github.pagehelper.PageHelper;

/**
 * Created by Administrator on 2016/5/21.
 */
public class PageUtils {

    public static void startPage(Integer curPage, Integer pageSize){
        //1、设置分页
        if (curPage == null) {
            curPage = 1;
        }
        if (pageSize == null) {
            pageSize = 20;
        }
        PageHelper.startPage(curPage, pageSize);
    }
}
