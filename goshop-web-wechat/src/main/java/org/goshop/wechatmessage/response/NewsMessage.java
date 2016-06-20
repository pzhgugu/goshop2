package org.goshop.wechatmessage.response;

import java.util.List;

/**
 * �ı���Ϣ
 * 
 * @author liufeng
 * @date 2013-09-11
 */
public class NewsMessage extends BaseMessage {
	// ͼ����Ϣ��������Ϊ10������
	private int ArticleCount;
	// ����ͼ����Ϣ��Ϣ��Ĭ�ϵ�һ��itemΪ��ͼ
	private List<Article> Articles;

	public int getArticleCount() {
		return ArticleCount;
	}

	public void setArticleCount(int articleCount) {
		ArticleCount = articleCount;
	}

	public List<Article> getArticles() {
		return Articles;
	}

	public void setArticles(List<Article> articles) {
		Articles = articles;
	}
}
