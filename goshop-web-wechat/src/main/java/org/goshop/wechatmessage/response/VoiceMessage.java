package org.goshop.wechatmessage.response;

/**
 * 语音消息
 *
 * @author liufeng
 * @date 2013-09-11
 */
public class VoiceMessage extends BaseMessage {
	// 语音
	private Voice Voice;

	public Voice getVoice() {
		return Voice;
	}

	public void setVoice(Voice voice) {
		Voice = voice;
	}
}
