package com.bdqn.spz.messageboard.test;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.swing.JApplet;

import com.sun.org.apache.bcel.internal.generic.NEW;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		/*��������ֱ�Ӹ�ֵ��Integer ��ֵ�ķ�Χ�� [-128,127] ʱ�� �᲻�����µĶ��� ֱ�Ӱѻ����еĶ��������� */
		
		/*Integer a=1;
		Integer b=1;
		System.out.println(a==b);
		
		
		Integer c=new Integer(1);
		Integer d=new Integer(1);
		System.out.println(c==d);
		
		
		Integer e=500;
		Integer f=500;
		
		System.out.println(e==f);
		
		
		Integer g=127;
		Integer h=127;
		
		System.out.println(g==h);
		
		Integer i=128;
		Integer j=128;
		
		System.out.println(i==j);*/
		
		
		Integer a=1;
		int b=1;
		System.out.println(a==b);
		
		Integer c=128;
		int d=128;
		System.out.println(c==d);
		
		System.out.println(��ǰʱ��());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	static String ��ǰʱ��(){
		Date date=new Date();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return simpleDateFormat.format(date);
	}
}