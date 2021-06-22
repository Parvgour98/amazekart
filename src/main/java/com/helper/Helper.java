package com.helper;

public class Helper {
	public static String getTenWords(String desc)
	{
		
		String arr[] = desc.split(" ");
		if(arr.length>10)
		{
			String temp = "";
			for(int i=0; i<10; i++)
			{
				temp+=arr[i]+" ";
			}
			return temp+"...";
		}
		return desc+"...";
		
	}
}
