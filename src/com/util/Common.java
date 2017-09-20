package com.util;

/**
 * ���÷�����
 * 
 * 
 */
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public final class Common {
	/**
	 * �ַ��� HTML ת��
	 * @param str
	 * @return
	 */
	public static String turn(String str) {
	
		while (str.indexOf("\n") != -1) {
			str = str.substring(0, str.indexOf("\n")) + "<br>"
					+ str.substring(str.indexOf("\n") + 1);
		}
		while (str.indexOf(" ") != -1) {
			str = str.substring(0, str.indexOf(" ")) + "&nbsp;"
					+ str.substring(str.indexOf(" ") + 1);
		}
		return str;
	}
	
	/**
	 * ��������  ��ǰ���ڴ���0  һ��֮ǰ����-1 �������3
	 * @param num
	 * @return
	 */
	public static String getDate(int num){
	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		c.add(Calendar.YEAR, num);
		
		return df.format(c.getTime());
	}
	
	/**
	 * ���ݿ�����ַ����Ĺ���
	 * @param str
	 * @return
	 */
	public static String SQLStr(String str){
	
		if(str != null && str.length()>1 && str.substring(0,1).equals("?")){
			str = str.substring(1);
		}
				
		if(str == null || str.equals("") || str.equals(" ")){
			str = "&nbsp;";
		}
		return str;
	} 
	/**
	 * ���˿ո�
	 * @param str
	 * @return
	 */
	public static String PageStr(String str){
	
		if(str==null || str.trim().equals("") || str.equals(" ")||str.equals("null")){
			str = "";
		}
		str = str.trim();
		return str;
	}
	/**
	 * ��ʽ������	
	 * @param oldDate
	 * @return
	 */
	public static String formatRZ(String oldDate){
	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date Date = new Date(oldDate);
		return df.format(Date);
	}
	
	/**
	 * ����
	 * @param str
	 * @return
	 */
	public static String toChineseAndTrim(String str){
	
		if(str==null){
			str="";
		}
		try{
			byte b[]=str.getBytes("iso-8859-1");
			str=new String(b);
			str=str.trim();
		}catch(Exception e){
			e.printStackTrace();
		}
		return str;
	}
}