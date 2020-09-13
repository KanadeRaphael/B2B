package com.myapp.model;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * 发件人账号密码
 * @author zhangdi
 *
 */
public class MailAuthenticator extends  Authenticator{

    public static String USERNAME = "ccykirito@163.com";
    public static String PASSWORD = "ccy786577872";

    public MailAuthenticator() {
    }

    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(USERNAME, PASSWORD);
    }

}