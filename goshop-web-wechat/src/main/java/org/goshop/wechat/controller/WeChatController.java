package org.goshop.wechat.controller;

import org.goshop.wechat.core.*;
import org.goshop.wechat.menu.MenuManager;
import org.goshop.wechat.service.WeChatService;
import org.apache.log4j.Logger;
import org.goshop.wechat.core.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 微信核心 web 入口
 * 用户微信接口的相关接入工作。
 */
@Controller
@RequestMapping("wechat")
public class WeChatController {
	private Logger log = Logger.getLogger(WeChatController.class);
 
	/**
	 * 校验信息是否是从微信服务器发过来的。
	 * 
	 * @param weChat
	 * @param out
	 */
	@RequestMapping(method = { RequestMethod.GET }, produces = "application/json;charset=UTF-8")
	public void valid(WeChat weChat, PrintWriter out) {
		String signature = weChat.getSignature(); // 微信加密签名
		String timestamp = weChat.getTimestamp(); // 时间戳
		String nonce = weChat.getNonce();// 随机数
		String echostr = weChat.getEchostr();// 随机字符串
 
		// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
		if (SignUtil.checkSignature(signature, timestamp, nonce)) {
			out.print(echostr);
		} else {
			log.info("将非法访问存储到数据库!");
		}
		out.flush();
		out.close();
	}
 
	/**
	 * 微信消息的处理
	 * 
	 * @param request
	 * @throws IOException
	 */
	@RequestMapping(method = { RequestMethod.POST }, produces = "application/xml;charset=UTF-8")
	public void dispose(WeChat weChat, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		/* 消息的接收、处理、响应 */
 
		// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String signature = weChat.getSignature(); // 微信加密签名
		String timestamp = weChat.getTimestamp(); // 时间戳
		String nonce = weChat.getNonce();// 随机数
 
		PrintWriter out = response.getWriter();
		// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
		if (SignUtil.checkSignature(signature, timestamp, nonce)) {
			String responseXML= WeChatService.processRequest(request);
			out.print(responseXML);
		} 
		out.flush();
		out.close();
	}

	@RequestMapping(value="menu")
	@ResponseBody
	public String menu(PrintWriter out) {
		// 第三方用户唯一凭证
		String appId = "wx57389cc7f1b9cdfc";
		// 第三方用户唯一凭证密钥
		String appSecret = "872d15fbb6c3b1b4bfee5088047e008b";

		// 调用接口获取凭证
		Token token = CommonUtil.getToken(appId, appSecret);

		if (null != token) {
			// 创建菜单
			boolean result = MenuUtil.createMenu(MenuManager.getMenu(), token.getAccessToken());

			// 判断菜单创建结果
			if (result)
				return "菜单创建成功！";
			else
				return "菜单创建失败！";
		}
		return "";
	}
}
