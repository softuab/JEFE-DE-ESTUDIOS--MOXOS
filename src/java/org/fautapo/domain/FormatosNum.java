package org.fautapo.domain;

import java.text.NumberFormat;
import java.text.DecimalFormat;
import java.util.Locale;
import java.text.ParseException;
import java.text.DecimalFormatSymbols;

public class FormatosNum{
	
  public boolean esReal(String valor){
    boolean respuesta = true;  
    try{
      Double.valueOf(valor).doubleValue();      
    }catch(NumberFormatException e){
      respuesta = false;
    }
    return respuesta;
  }

  public boolean esMoneda(String valor){
    Locale locale = new Locale("en","US");
    NumberFormat nf = NumberFormat.getInstance(locale);
    boolean resultado = true;
    Object obj = null;
    try {
      obj = nf.parse(valor);
    }
    catch (ParseException e) {
      resultado = false;
    }
    if(resultado && (esReal(obj.toString()))) resultado = true;
      return resultado;
  }
  
  public String parseMoneda(double valor, int n){
    String resultado = "";
    Locale locale = new Locale("en","US");
    NumberFormat nf = NumberFormat.getInstance(locale);
    try{
      nf.setMinimumFractionDigits(n);
      nf.setMaximumFractionDigits(n);
      resultado = nf.format(valor);
    }catch(NumberFormatException e){
      resultado = "";
    }
    return resultado;
  }
 
  public double parseDouble(String valor){  	
    Locale locale = new Locale("en","US");
    NumberFormat nf = NumberFormat.getInstance(locale);
    double resultado = 0;
    Object obj = null;
    try {
      obj = nf.parse(valor);
      resultado = Double.valueOf(obj.toString()).doubleValue();
    }
    catch (ParseException e) {
      System.err.println(e);
      resultado = 0;
    }
    return resultado;
  }
  
  public double redondear(double valor, int n){
  	double resultado = 0;
  	DecimalFormat df = new DecimalFormat("#");
  	try{
      df.setMaximumFractionDigits(n);
      resultado = Double.valueOf(df.format(valor)).doubleValue();
    }catch(NumberFormatException e){
      resultado = 0;
    }
    return resultado;
  }

  public String parseDecimal(double valor, int n){
    String resultado = "";   
    DecimalFormat df = new DecimalFormat("#.#");
    DecimalFormatSymbols unusualSymbols = new DecimalFormatSymbols();
    unusualSymbols.setDecimalSeparator('.'); 
    df.setDecimalFormatSymbols(unusualSymbols);
    try{
      df.setMinimumFractionDigits(n);
      df.setMaximumFractionDigits(n);
      resultado = df.format(valor).toString();
    }catch(NumberFormatException e){
      resultado = "";
    }
    return resultado;
  }
  
}
