package org.goshop.common.pojo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;

/**
 * 创 建 人：gugu
 * 创建日期：2015-06-18
 * 修 改 人：
 * 修改日 期：
 * 描   述：xml异常类解析。  
 */
@XmlRootElement(name="data")
@XmlAccessorType (XmlAccessType.FIELD)
public class ErrorData {
	
	 @XmlElement
	private List<ErrorMessage> action = new ArrayList<ErrorMessage>();

	public List<ErrorMessage> getAction() {
		return action;
	}

	public void setAction(List<ErrorMessage> action) {
		this.action = action;
	}


}
