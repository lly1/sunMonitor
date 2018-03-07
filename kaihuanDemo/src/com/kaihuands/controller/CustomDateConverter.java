package com.kaihuands.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;
//前台传时间戳格式化传后台
public class CustomDateConverter implements Converter<String,Date> {
      public Date convert(String arg0){
    	  SimpleDateFormat simpleDateFormat =new SimpleDateFormat("yyyy-mm-dd'T'hh:mm:ss");
    	  Date date=null;
    	  try {
			date=simpleDateFormat.parse(arg0);
			System.out.println(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	  return date;
      }
}
