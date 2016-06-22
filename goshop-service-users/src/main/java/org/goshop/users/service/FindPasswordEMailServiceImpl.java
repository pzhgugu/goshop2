package org.goshop.users.service;

import org.goshop.common.utils.RandomUtils;
import org.goshop.users.mapper.master.FindPasswordMapper;
import org.goshop.users.pojo.FindPassword;
import org.goshop.users.i.FindPasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.MessageFormat;

@Service
public class FindPasswordEMailServiceImpl implements FindPasswordService {

    @Value("${SHOP_URL}")
    private String shopUrl;

    @Autowired
    FindPasswordMapper findPasswordMapper;

    private static String content = "<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" id=\"message-body-wrapper\"><tbody>" +
            "<tr><td width=\"0\" id=\"message-body-left-margin\"></td><td id=\"message-body\"><table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" id=\"paragraphs\"><tbody>" +
            "<tr><td style=\"padding:0 5% 18px;font:300 14px/18px 'Lucida Grande', Lucida Sans, Lucida Sans Unicode, sans-serif, Arial, Helvetica, Verdana, sans-serif;color:#333;\" class=\"paragraph\">{0}�����ã�</td></tr>" +
            "<tr><td style=\"padding:0 5% 18px;font:300 14px/18px 'Lucida Grande', Lucida Sans, Lucida Sans Unicode, sans-serif, Arial, Helvetica, Verdana, sans-serif;color:#333;\" class=\"paragraph\">�����Ϊ�����������������Ҫ��ɴ˹��̣���㰴�������ӡ�</td></tr><tr><td style=\"padding:0 5% 18px;font:300 14px/18px 'Lucida Grande', Lucida Sans, Lucida Sans Unicode, sans-serif, Arial, Helvetica, Verdana, sans-serif;color:#333;\" class=\"paragraph\">" +
            "�븴�����������޸����룺{1}</td></tr><tr><td style=\"padding:0 5% 18px;font:300 14px/18px 'Lucida Grande', Lucida Sans, Lucida Sans Unicode, sans-serif, Arial, Helvetica, Verdana, sans-serif;color:#333;\" class=\"paragraph\">�����δ��������󣬿����������û����������������ĵ����ʼ���ַ�������ʻ���Ȼ��ȫ�������������δ����Ȩ����Ա�����������ʻ�����Ӧ����ǰ�������ʻ�ҳ��, �����������롣</td></tr><tr><td style=\"padding:0 5% 18px;font:300 14px/18px 'Lucida Grande', Lucida Sans, Lucida Sans Unicode, sans-serif, Arial, Helvetica, Verdana, sans-serif;color:#333;\" class=\"paragraph\">����</td></tr><tr><td style=\"padding:18px 5% 51px;font:300 14px/18px 'Lucida Grande', Lucida Sans, Lucida Sans Unicode, sans-serif, Arial, Helvetica, Verdana, sans-serif;\" id=\"signature\">֧��</td></tr></tbody></table></td></tr></tbody></table>";


    @Override
    public String getContent(String username) {
        String key = RandomUtils.generateString(28);
        this.saveFindPassword(username,key);
        String url =shopUrl+"/password/update.html?key="+key;
        return MessageFormat.format(content, username, url);
    }

    @Override
    public int saveFindPassword(String username, String key) {
        //ɾ�������޸���������
        findPasswordMapper.deleteInvalid();
        //���浱ǰkey
        FindPassword findPassword = new FindPassword();
        findPassword.setCreated(new Timestamp(System.currentTimeMillis()));
        findPassword.setRandom(key);
        findPassword.setLoginName(username);
        return findPasswordMapper.insert(findPassword);
    }

    @Override
    public void deleteInvalid(){
        findPasswordMapper.deleteInvalid();
    }

    @Override
    public String findByKey(String key) {
        return findPasswordMapper.findByKey(key);
    }

    @Override
    public void delete(String key) {
        findPasswordMapper.delete(key);
    }
}
