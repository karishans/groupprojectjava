package com.karis.groupprojectfinal.models;

public class StringArrayFunctions {
	
	public static String strArrToStr(String[] arr)
	{
    	String str = "";
    	for(int i = 0; i< arr.length; i++)
    	{
    		if (i == 0)
    		{
        		str = arr[i];
    		}
    		else
    		{
        		str += ","+arr[i];
    		}
    	}
    	return str;
	}
	
	
	public static String[] strToStrArr(String str)
	{
		if (str != null)
		{
	    	String[] str_array = str.split(",");
	    	return str_array;
		}
		String[] nothing = null;
		return nothing;
	}

}