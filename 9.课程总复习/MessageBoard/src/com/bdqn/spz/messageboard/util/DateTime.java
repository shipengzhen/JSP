package com.bdqn.spz.messageboard.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime {

	/**
	 * ��ȡ��ǰʱ��
	 * @return String
	 */
	public static String getDateNow(){
		Date date=new Date();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return simpleDateFormat.format(date);
	}
}
