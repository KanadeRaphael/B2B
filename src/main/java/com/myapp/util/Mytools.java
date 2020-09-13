package com.myapp.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Mytools {
	public static String DateMinusOneDay(Object value) throws ParseException {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		date = format.parse((String)value);

		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DAY_OF_MONTH, 1);

		return format.format(c.getTime());
	}
	public static boolean confirmSuffix(String suffix) {
		if (suffix.equals(".jpg") || suffix.equals(".gif") || suffix.equals(".png") || suffix.equals(".svg") || suffix.equals(".jpeg"))
			return true;
		else return false;
	}
	public static String sendmail(String email){
		MailOperation operation = new MailOperation();
		String user = "ccykirito@163.com";
		String password = "ccy786577872";
		String host = "smtp.163.com";
		String from = "ccykirito@163.com";
		String to = email;// 收件人
		String subject = "B2C电商平台-验证码信息";
		//邮箱内容
		StringBuffer sb = new StringBuffer();
		String yzm = String.valueOf((int) (Math.random() * 1000000));
		sb.append("<!DOCTYPE>"+"<div bgcolor='#f1fcfa'   style='border:1px solid #d9f4ee; font-size:14px; line-height:22px; color:#005aa0;padding-left:1px;padding-top:5px;   padding-bottom:5px;'><span style='font-weight:bold;'>温馨提示：</span>"
				+ "<div style='width:950px;font-family:arial;'>欢迎使用我们的B2C电商平台，您本次的验证码为：<br/><h2 style='color:green'>"+yzm+"</h2><br/>本邮件由系统自动发出，请勿回复。<br/>感谢您的使用。<br/>来自寝室616</div>"
				+"</div>");
		String res;

		{
			try {
				res = operation.sendMail(user, password, host, from, to,
						subject, sb.toString());
				System.out.println(res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return yzm;
	}
	public static String addZeroForNum(String str, int strLength) {
		int strLen = str.length();
		StringBuffer sb = null;
		while (strLen < strLength) {
			sb = new StringBuffer();
			sb.append("0").append(str);// 左补0
			// sb.append(str).append("0");//右补0
			str = sb.toString();
			strLen = str.length();
		}
		return str;
	}
}