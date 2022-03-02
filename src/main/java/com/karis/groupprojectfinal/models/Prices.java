package com.karis.groupprojectfinal.models;

import java.text.DecimalFormat;
import java.util.HashMap;

public class Prices {
	
//	private static String[] toppings;
//	private static String size;
//	private static String quantity;
//	private static HashMap<String, Double> pricing; 
//	
//	public Prices(String[] toppings, String size, String quantity)
//	{
//		Prices.toppings = toppings;
//		Prices.size = size;
//		Prices.quantity = quantity;
//		Prices.pricing.put("toppings", .50);
//		Prices.pricing.put("small", 9.99);
//		Prices.pricing.put("medium", 11.99);
//		Prices.pricing.put("large", 13.99);
//		Prices.pricing.put("xlarge", 15.99);
//
//	}
//	private static String[] toppings;
//	private static String size;
//	private static String quantity;
	private static HashMap<String, Double> pricing = Prices.setPricing();

	
	public static String calculatePrice(String toppings, String size, String quantity)
	{
		Double priceDec = Prices.getPricing().get(size);
		Double quantityDec = Double.parseDouble(quantity);
		DecimalFormat decFormat = new DecimalFormat("##.00");
		Double price_unformatted;
		if (toppings != null)
		{
			String [] these_toppings = StringArrayFunctions.strToStrArr(toppings);
			Double toppings_price = these_toppings.length*Prices.getPricing().get("toppings");
			price_unformatted = (toppings_price+priceDec)*quantityDec;
		}
		else
		{
			price_unformatted = priceDec*quantityDec;
		}
//		Double size_price =  Double.parseDouble(decFormat.format(priceDec));
//		Double qnty_formatted_dbl =  Double.parseDouble(decFormat.format(quantityDec));
//		Double size_price = Prices.getPricing().get(size);
		Double price_formatted =  Double.parseDouble(decFormat.format(price_unformatted));
		return price_formatted.toString();
	}

	
	private static HashMap<String, Double> getPricing() {
		return pricing;
	}

	private static HashMap<String, Double> setPricing()
	{
		HashMap<String, Double> pricing = new HashMap<String, Double>();
		pricing.put("toppings", .50);
		pricing.put("Small", 9.99);
		pricing.put("Medium", 11.99);
		pricing.put("Large", 13.99);
		pricing.put("XLarge", 15.99);
		return pricing;
	}

	

	
	
}
