package com.team.sharemap.util;

import javax.servlet.http.Cookie;

public class CookieSearch {
	public static String getCookie(Cookie[] coos, String key){
		if(coos != null){
			for(Cookie coo : coos){
				if(coo.getName().equals(key)){
					return coo.getValue();
				}
			}
		}
		return "";
	}

}

