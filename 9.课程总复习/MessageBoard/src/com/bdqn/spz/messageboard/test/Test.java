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
		
		/*对于这样直接赋值的Integer 当值的范围在 [-128,127] 时候 会不生成新的对象 直接把缓存中的对象拿来用 */
		
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
		
		System.out.println(当前时间());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	static String 当前时间(){
		Date date=new Date();
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return simpleDateFormat.format(date);
	}
}