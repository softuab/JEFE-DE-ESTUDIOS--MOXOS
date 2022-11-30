package org.fautapo.domain;

import java.io.Serializable;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Literales implements Serializable {

  private static final String[] majorNames = {
    "",
    " mil",
    " millon",
    " billon",
    " trillon",
    " cuatrillon",
    " quintillon"
  };
  
  private static final String[] tensNames = {
    "",
    "diez",
    "veinti",
    "treinta",
    "cuarenta",
    "cincuenta",
    "sesenta",
    "setenta",
    "ochenta",
    "noventa"
  };

  private static final String[] numNames = {
    "",
    "uno",
    "dos",
    "tres",
    "cuatro",
    "cinco",
    "seis",
    "siete",
    "ocho",
    "nueve",
    "diez",
    "once",
    "doce",
    "trece",
    "catorce",
    "quince",
    "dieciseis",
    "diecisiete",
    "dieciocho",
    "diecinueve"
  };

  private String unidades(int number) {
    String soFar = "";
    if (number < 20) {
      return numNames[number];
    } else if (number == 20){
      return "veinte";
    } else if (number < 30){
      return tensNames[2] + numNames[number % 10];
    } else {
      if (number % 10 > 0)
        soFar = " y ";
      soFar += numNames[number % 10];
      number /= 10;
      soFar = tensNames[number] + soFar;
    }
    return soFar;
  }

  private String convertLessThanOneThousand(int number) {
    String soFar = unidades(number % 100);
    int cantidad = number / 100; 

    if (number == 100)
      return "cien";

    switch (cantidad) {
      case 0 : return soFar;
      case 1 : return "ciento " + soFar;
      case 5 : return "quinientos " + soFar;
      case 7 : return "setecientos " + soFar;
      case 9 : return "novecientos " + soFar;
    }
    return numNames[cantidad] + "cientos " + soFar;
  }

  public String convert(double numero) {
    int number = (int) numero;
    int decimal = (int) ((numero - number) * 100);
    
    /* special case */
    if (number == 0) { return "cero"; }

    String prefix = "";

    if (number < 0) {
        number = -number;
        prefix = "negativo";
      }

    String soFar = "";
    int place = 0;

    do {
      int n = number % 1000;
      int numerito = number % 10;
      if (n != 0){
         String s = convertLessThanOneThousand(n);
	 String plural = "";
	 if (place > 1 && numerito > 1)
	   plural = "es ";
	 if (place == 1 && numerito == 1)
	   s = "";
         soFar = s + majorNames[place] + plural + soFar;
        }
      if (place == 2)
        place = 0;
      place++;
      number /= 1000;
      } while (number > 0);


    if(decimal == 0){
      return (prefix + soFar).trim() + " "  + "00/100";
     }
     else{
       return (prefix + soFar).trim() + " " + decimal + "/100";
        }

//    return (prefix + soFar).trim() + " " + decimal + "/100";
  }

  public String convertNumber(double numero) {
    int number = (int) numero;
    int decimal = (int) ((numero - number) * 100);
    
    /* special case */
    if (number == 0) { return "cero"; }

    String prefix = "";

    if (number < 0) {
        number = -number;
        prefix = "negativo";
      }

    String soFar = "";
    int place = 0;

    do {
      int n = number % 1000;
      int numerito = number % 10;
      if (n != 0){
         String s = convertLessThanOneThousand(n);
	 String plural = "";
	 if (place > 1 && numerito > 1)
	   plural = "es ";
	 if (place == 1 && numerito == 1)
	   s = "";
         soFar = s + majorNames[place] + plural + soFar;
        }
      if (place == 2)
        place = 0;
      place++;
      number /= 1000;
      } while (number > 0);

    return (prefix + soFar).trim();
  }

}