package org.fautapo.domain;

import java.io.Serializable;
import java.util.*;
import java.text.*;
import org.fautapo.domain.*;
import org.fautapo.dao.AbmDao;
import org.fautapo.domain.logic.MiFacade;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


/****************************************
 @usuario          :: Luis Jordan
 @fec_registro     :: 31.05.2007
 @ult_usuario      :: Luis Jordan
 @fec_modificacion :: 31.05.2007
*****************************************/

public class Funciones implements Serializable {

  HttpServletRequest request;
  Map modelo;
  MiFacade mi;

  //CONSTRUCTOR


  public Funciones(HttpServletRequest request, Map modelo, MiFacade mi) {
    this.request = request;
    this.modelo = modelo;
    this.mi = mi;
    Abm abm = new Abm();
    abm.setSql("SELECT institucion, sigla, logo FROM instituciones WHERE id_institucion=1");
    List valoresInstitucion = this.mi.getEjecutarListado(abm);
    abm = (Abm)valoresInstitucion.get(0);
    String valor[]= abm.getValores().split(",");
    Date dFecha_actual = new Date();
    String sDia = Integer.toString(dFecha_actual.getDate());
    String sMes = Integer.toString(dFecha_actual.getMonth() + 1);
    String sAnio = Integer.toString(dFecha_actual.getYear() + 1900);
    modelo.put("anio", sAnio);
    modelo.put("mes", sMes);
    modelo.put("dia", sDia);
    modelo.put("institucion", valor[0]);
    modelo.put("sigla", valor[1]);
    modelo.put("logo", valor[2]);
  }

  //METODOS

  public String hoy(){
      Date dFecha_actual = new Date();
      String sDia = Integer.toString(dFecha_actual.getDate());
      String sMes = Integer.toString(dFecha_actual.getMonth() + 1);
      String sAnio = Integer.toString(dFecha_actual.getYear() + 1900);
      if(sDia.length() == 1) sDia = "0" + sDia;
      if(sMes.length() == 1) sMes = "0" + sMes;
      String sFecha = sDia + "/" + sMes + "/" + sAnio;
      return sFecha;
  }




  // Request


  public String sRequest(String s){
    if((request.getParameter(s) == null))
    return "";
    return request.getParameter(s);
  }

  public int iRequest(String s){
    if((request.getParameter(s) == null) ||("".equals(request.getParameter(s))))
    return 0;
    return Integer.parseInt(request.getParameter(s));
  }

  public double dRequest(String s){
    if((request.getParameter(s) == null) ||("".equals(request.getParameter(s))))
    return 0;
    return Double.parseDouble(request.getParameter(s));
  }

  public boolean bRequest(String s){
    if((request.getParameter(s) == null) ||("".equals(request.getParameter(s))))
    return false;
    return Boolean.parseBoolean(request.getParameter(s));
  }

  public String fRequest(String s){
    if((request.getParameter(s) == null) ||("".equals(request.getParameter(s))))
    return "01/01/1900";
    //Aqui validar si es una fecha valida
    return request.getParameter(s);
  }







  // Matrices / Listas



  public void combo(String sql, String lista){
    String datos[][];
    Abm abm = new Abm();
    System.out.println("--Combo:\n  --SQL:\n    "+sql+"\n  Lista: "+lista+"\n");
    abm.setSql(sql);
    List valores = mi.getEjecutarListado(abm);
    //System.out.println("--Combo numero de datos:\n"+valores.size());
    if( valores.size()>0) {
      datos = new String[valores.size()][3];
      for (int i=0; i<valores.size(); i++) {
        abm = (Abm)valores.get(i);
        String valor1[]= abm.getValores().split(",");
        if(valor1.length>0){
          for (int j=0; j<valor1.length;j++) {
              //System.out.println("--valorj:\n"+valor1[j]);
              datos[i][j] = valor1[j].replaceAll("#~~~#", ",");
          }
        }
      }
     //System.out.println("--Combo datos:\n"+datos[0][0]);
      modelo.put(lista, datos);
    }
  }

  public void matriz(String sql, String lista, String lista1, int columnas, int desde, String sdesde, int numeros){
    //matriz("select id_campo, campo from tabla", "ltabla", "ltabla1", 2, 0, "desde", 1);
    String datos[][];
    String datos1[][];
    Abm abm = new Abm();
    abm.setSql(sql);
    //System.out.println("-- Matriz:\n  "+sql);
    List valores = mi.getEjecutarListado(abm);
    datos = new String[valores.size()][columnas];
    datos1 = new String[valores.size()][columnas];
    for (int i=0; i<valores.size(); i++) {
      abm = (Abm)valores.get(i);
      String valor1[]= abm.getValores().split(",");
      for (int j=0; j<valor1.length;j++) {
        datos1[i][j] = valor1[j].replaceAll("#~~~#", ",");
        if (j<numeros) {
          datos[i][j] = "<td align=left>" + valor1[j].replaceAll("#~~~#", ",") + "</td>";
        }
        else {
          datos[i][j] = "<td align=right>" + separar_miles(valor1[j], ".", ",") + "</td>";
        }
        if (j<desde) datos[i][j] = valor1[j].replaceAll("#~~~#", ",");
      }
    }
    modelo.put(sdesde, Integer.toString(desde));
    modelo.put(lista, datos);
    modelo.put(lista1, datos1);
  }

  public int matriz_etiquetas(String sql, String lista, int desde, String sdesde, int numeros, String etiqueta){
    //matriz("select id_campo, campo from tabla", "ltabla", 2, 0, "desde", 1);
    String etiquetas[]= etiqueta.split("###");
    modelo.put("etiquetas", etiquetas);
    String datos[][];
    String datos1[][];
    Abm abm = new Abm();
    abm.setSql(sql);
    List valores = mi.getEjecutarListado(abm);

    datos = new String[valores.size()][etiquetas.length];
    datos1 = new String[valores.size()][etiquetas.length];
    int v=valores.size();
    for (int i=0; i<v; i++) {
      abm = (Abm)valores.get(i);
      String valor1[]= abm.getValores().split(",");
      for (int j=0; j<valor1.length;j++) {
        datos1[i][j] = valor1[j].replaceAll("#~~~#", ",");
        if(j<numeros){
          datos[i][j] = "<td align=left>" + valor1[j].replaceAll("#~~~#", ",") + "</td>";
        }
        else {
          datos[i][j] = "<td align=right>" + separar_miles(valor1[j], ".", ",") + "</td>";
        }
        if (j<desde) datos[i][j] = valor1[j].replaceAll("#~~~#", ",");
      }
    }
    modelo.put(sdesde, Integer.toString(desde));
    modelo.put(lista, datos);
    modelo.put("datos1", datos1);
    return valores.size();
  }


  public int matriz_etiquetas_subtotales(String sql, String lista, int desde, String sdesde, int numeros, String etiqueta){
    //EL Primer campo define si es dato(1) o subtotal(2)
    //matriz("select id_campo, campo from tabla", "ltabla", 2, "desde", 4, "campo1###campo2");
    String etiquetas[]= etiqueta.split("###");
    modelo.put("etiquetas", etiquetas);
    String datos[][];
    Abm abm = new Abm();
    abm.setSql(sql);
    List valores = mi.getEjecutarListado(abm);

    datos = new String[valores.size()][etiquetas.length];
    int v=valores.size();
    for (int i=0; i<v; i++) {
      abm = (Abm)valores.get(i);
      String valor1[]= abm.getValores().split(",");
      for (int j=0; j<valor1.length;j++) {
           String a="";
        if(valor1[0].equals("2")) a=" height=15 style=\"border-top: 2px solid #000000; border-bottom: 2px solid #000000;\"";
        if(j<numeros){
            datos[i][j] = "<td align=left " + a +">" + valor1[j].replaceAll("#~~~#", ",") + "</td>";
        }
        else {
          datos[i][j] = "<td align=right " + a +">" + separar_miles(valor1[j], ".", ",") + "</td>";
        }
        if (j<desde) datos[i][j] = valor1[j].replaceAll("#~~~#", ",");
      }
    }
    modelo.put(sdesde, Integer.toString(desde));
    modelo.put(lista, datos);
    return valores.size();
  }

  public void pies(String cadena){
    List valores;
    String sql;
    Abm abm = new Abm();

    sql= "SELECT reporte_pie FROM reportes_pies WHERE id_sistema=1 AND identificador = 'titulo_" + cadena + "'";
    abm.setSql(sql);
    valores = this.mi.getEjecutarListado(abm);
    if(valores.size()==1) modelo.put("titulo", ((Abm)valores.get(0)).getValores());

    sql= "SELECT reporte_pie FROM reportes_pies WHERE id_sistema=1 AND identificador = 'glosa_" + cadena + "'";
    abm.setSql(sql);
    valores = this.mi.getEjecutarListado(abm);
    if(valores.size()==1) modelo.put("glosa", ((Abm)valores.get(0)).getValores());

    sql= "SELECT reporte_pie FROM reportes_pies WHERE id_sistema=1 AND identificador = 'firmas_" + cadena + "'";
    abm.setSql(sql);
    valores = this.mi.getEjecutarListado(abm);
    if(valores.size()==1) modelo.put("firmas", ((Abm)valores.get(0)).getValores());
  }




  public String guardar(String tabla, String campos, String valores, int tipo, String campo, String valor, int ult_usuario, MiFacade mi){
    try {
      Abm abm = new Abm();
      String sql ="select registrar_datos('" + tabla + "', '" + campos + "', '" + valores + "', " + tipo + ", '" + campo + "', '" + valor + "', " + ult_usuario + ")";
      System.out.println("--SQL:\n  " + sql);
      abm.setSql(sql);
      mi.getEjecutarListado(abm);
      return "Los datos se registraron correctamente";
    }
    catch (Exception e){
      String mensajes[] = ((String[]) (e.getCause().getMessage().split("SQLException: ERROR: ")))[1].split("Detail:");
      String problema = mensajes[0];
      if (mensajes.length > 1) {
        System.out.println("error guardar:" + mensajes[1]);
        problema += "<br> DETALLE:" + mensajes[1] + "<hr/>";
      }
      return problema;
    }
  }


  public String hijos(String id, String prefijo, String id_campo, String tabla, String id_padre){
    if (iRequest(id)>0){
      String sql ="SELECT  ' AND (' || substring(replace (a, ',', ' OR "+prefijo+id_campo+" = ') FROM 4) || ')' FROM listar_hijos('"+tabla+"', '"+id_campo+"', '"+id_padre+"', "+sRequest(id)+", ' ') as a";
      System.out.println("hijos:\n\n"+sql+"\n\n");
      Abm abm = new Abm();
      abm.setSql(sql);
      List valores = this.mi.getEjecutarListado(abm);
      return "\n " + ((Abm)valores.get(0)).getValores();
    }
    return "";
  }



  public String separar_miles(String s, String Separador, String Decimal){
    //entrada s=1000.4   separador="," Decimal="."
    //Salida 1,000.40
    if(!s.equals("&nbsp;")){
      if (s.length() > 0){
        String sDecimal;
        String sEntero;
        if (s.indexOf('.') == -1) s += ".00"; else if((s.length() - s.indexOf('.')) == 2) s += "0";
        sDecimal = s.substring(s.indexOf('.'));
        sDecimal = Decimal + sDecimal.charAt(1) + sDecimal.charAt(2);
        sEntero = s.substring(0, s.indexOf('.'));
        s = "";
        if (sEntero.length() > 3) {
          s = sEntero.substring(0, sEntero.length() % 3);
          sEntero = sEntero.substring(sEntero.length() % 3);
          if (s.length() > 0) s += Separador;
          while (sEntero.length() > 3){
            s += sEntero.substring(0, 3) + Separador;
            sEntero = sEntero.substring(3);
          }
        }
        s+= sEntero + sDecimal;
      }
      else s = "0" + Decimal + "00";
    }
    if(s.indexOf('-')+1==s.indexOf(','))
      s="-" + s.substring(2, s.length());
    return s;
  }

  public String verificar(String s, String comparacion, String campo, String apostrofes){
    //Para los sql aumenta un "AND s comparacion campo" donde s tiene el "apostrofes" a su izquierda y derecha
    // ej.  s="2006-12-31"  comparacion="=" campo="fecha" apostrofes="'"
    // salida=  "\n AND '2006-12-31' = fecha"
    if((s != null)&&(!s.equals(""))&&(!s.equals("0"))&&(campo.equals(" EXTRACT (year FROM fec_comprobante)")))
      return "\n AND " + campo + "= EXTRACT (year FROM " + apostrofes + s + apostrofes + "::date)";
    if((s != null)&&(!s.equals(""))&&(!s.equals("0")))
      return "\n AND " + apostrofes + s + apostrofes + " " + comparacion + " " + campo + " ";
    return "";
  }
  public String usr_unidades(int id_usuario){
    System.out.println("Id_usuario:"+id_usuario);
    System.out.println("id_unidad:"+Integer.toString(iRequest("id_unidad")));
    if (iRequest("id_unidad")==0){
      Abm abm = new Abm();
      String sql ="SELECT id_unidad FROM _usr_unidades a, _usr_roles b WHERE a.id_usr_rol = b.id_usr_rol AND b.id_usuario="+id_usuario;
      abm.setSql(sql);
      List valores = mi.getEjecutarListado(abm);
      int v=valores.size();
      String s="\n AND (false ";
      for (int i=0; i<v; i++) {
        abm = (Abm)valores.get(i);
        s+= " OR c.id_unidad = "+ abm.getValores();
      }
      s+=")";
      return s;
    }
    return "\n AND c.id_unidad = "+ sRequest("id_unidad");
  }

  public String usr_unidadescb(int id_usuario){
    System.out.println("Id_usuario:"+id_usuario);
    System.out.println("id_unidad:"+Integer.toString(iRequest("id_unidad")));
    if (iRequest("id_unidad")==0){
      Abm abm = new Abm();
      String sql ="SELECT id_unidad FROM _usr_unidades a, _usr_roles b WHERE a.id_usr_rol = b.id_usr_rol AND b.id_usuario="+id_usuario;
      abm.setSql(sql);
      List valores = mi.getEjecutarListado(abm);
      int v=valores.size();
      String s="\n AND (false ";
      for (int i=0; i<v; i++) {
        abm = (Abm)valores.get(i);
        s+= " OR cb.id_unidad = "+ abm.getValores();
      }
      s+=")";
      return s;
    }
    return "\n AND cb.id_unidad = "+ sRequest("id_unidad");
  }

  public String usr_unidadesca(int id_usuario){
    System.out.println("Id_usuario:"+id_usuario);
    System.out.println("id_unidad:"+Integer.toString(iRequest("id_unidad")));
    if (iRequest("id_unidad")==0){
      Abm abm = new Abm();
      String sql ="SELECT id_unidad FROM _usr_unidades a, _usr_roles b WHERE a.id_usr_rol = b.id_usr_rol AND b.id_usuario="+id_usuario;
      abm.setSql(sql);
      List valores = mi.getEjecutarListado(abm);
      int v=valores.size();
      String s="\n AND (false ";
      for (int i=0; i<v; i++) {
        abm = (Abm)valores.get(i);
        s+= " OR ca.id_unidad = "+ abm.getValores();
      }
      s+=")";
      return s;
    }
    return "\n AND ca.id_unidad = "+ sRequest("id_unidad");
  }


  public ModelAndView mensaje_error(String mensaje, String donde){
    String mensajes[] = ((String[]) (mensaje.split("SQLException: ERROR: ")))[1].split("Detail:");
    String problema = mensajes[0];
    if (mensajes.length > 1) {
      System.out.println("--> error "+donde+":" + mensajes[1]);
      problema += "<br> DETALLE:" + mensajes[1] + "<hr/>";
    }
    return new ModelAndView("Error", "mensaje", problema);
  }





  public String parseMoneda(double valor){
    String resultado = "";
    String formato = "#,##0.00";
    DecimalFormatSymbols unusualSymbols = new DecimalFormatSymbols();
    unusualSymbols.setDecimalSeparator('.');
    unusualSymbols.setGroupingSeparator(',');
    DecimalFormat df = new DecimalFormat(formato, unusualSymbols);
    df.setGroupingSize(3);
    try{
      resultado = df.format(valor).toString();
    } catch(NumberFormatException e){
      System.out.println("Error al convertir el valor " + valor + ", EL error fu: " + e);
      resultado = "";
    }
  	return resultado;
  }










/////////////////////// funciones del aurelio swt

  public boolean esReal(String valor){
    boolean respuesta = true;
	try{
      Double.valueOf(valor).doubleValue();
    }catch(Exception e){
      System.out.println("Error al convertir a real el valor " + valor);
      respuesta = false;
    }
    return respuesta;
  }

  public boolean esMoneda(String valor){
    boolean resultado = true;
  	String formato = setFormatoMoneda(2);
  	DecimalFormatSymbols unusualSymbols = new DecimalFormatSymbols();
    unusualSymbols.setDecimalSeparator('.');
    unusualSymbols.setGroupingSeparator(',');
    DecimalFormat df = new DecimalFormat(formato, unusualSymbols);
    df.setGroupingSize(3);

    double valor_real = 0;
    Number numero = null;

  	try{
      numero = df.parse(valor);
	  valor_real = numero.doubleValue();
    }catch(ParseException e){
      System.out.println("Error al verificar la conversion el valor " + valor + " a moneda lo que resulto " + numero + " (" + valor_real + "), EL error fu�: " + e);
      resultado = false;
    }
  	return resultado;
  }

  public double parseMonedaDouble(String valor){
    double resultado = 0;
  	String formato = setFormatoMoneda(2);
  	DecimalFormatSymbols unusualSymbols = new DecimalFormatSymbols();
    unusualSymbols.setDecimalSeparator('.');
    unusualSymbols.setGroupingSeparator(',');
    DecimalFormat df = new DecimalFormat(formato, unusualSymbols);
    df.setGroupingSize(3);

    try{
      Number numero = df.parse(valor);
	  resultado = numero.doubleValue();
    }catch(ParseException e){
      System.out.println("Error al convertir el valor moneda: " + valor + " a real lo que resulto " + resultado + ", EL error fue: " + e);
      resultado = 0;
    }
  	return resultado;
  }

  public String parseMoneda(double valor, int n){
    String resultado = "";
  	String formato = setFormatoMoneda(n);
  	DecimalFormatSymbols unusualSymbols = new DecimalFormatSymbols();
    unusualSymbols.setDecimalSeparator('.');
    unusualSymbols.setGroupingSeparator(',');
    DecimalFormat df = new DecimalFormat(formato, unusualSymbols);
    df.setGroupingSize(3);

  	try{
      //df.setMinimumFractionDigits(n);
      //df.setMaximumFractionDigits(n);
      resultado = df.format(valor).toString();
    }catch(NumberFormatException e){
      System.out.println("Error al convertir el valor " + valor + " a moneda con " + n + " decimales, EL error fue: " + e);
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
    System.out.println("Error al convertir el valor " + valor + " a un numero real, el error fue: " + e);
	  resultado = 0;
	}
    return resultado;
  }

  public double redondear(double valor, int n){
  	double resultado = 0;
  	String formato = setFormato(n);

  	DecimalFormatSymbols unusualSymbols = new DecimalFormatSymbols();
    unusualSymbols.setDecimalSeparator('.');

    DecimalFormat df = new DecimalFormat(formato, unusualSymbols);

  	try{
      //df.setMaximumFractionDigits(n);
      resultado = Double.valueOf(df.format(valor)).doubleValue();
    }catch(NumberFormatException e){
      System.out.println("Error al redondear el valor " + valor + "a " + n + " digitos, EL error fue: " + e);
      resultado = 0;
    }
    return resultado;
  }

  public String parseDecimal(double valor, int n){
    String resultado = "";
    String formato = setFormato(n);
    DecimalFormatSymbols unusualSymbols = new DecimalFormatSymbols();
    unusualSymbols.setDecimalSeparator('.');
    DecimalFormat df = new DecimalFormat(formato, unusualSymbols);
    try{
      //df.setMinimumFractionDigits(n);
      //df.setMaximumFractionDigits(n);
      resultado = df.format(valor).toString();
    }catch(NumberFormatException e){
      System.out.println("Error al convertir el valor " + valor + "a " + n + " decimales, EL error fue: " + e);
      resultado = "";
    }
    return resultado;
  }
  public String setFormato(int n){
    String formato = "0.0";
    if(n == 0) formato = "0.#";
    else
      for (int i=1; i<n; i++) formato += "0";
    return formato;
  }
  public String setFormatoMoneda(int n){
    String formato = "#,##0.0";
    if(n == 0) formato = "#,##0.#";
    else
      for (int i=1; i<n; i++) formato += "0";
    return formato;
  }

   public String cambiarFormatoFecha(String fecha, String formato){
	String resultado="";
	int n = fecha.length();
	if(n == 10){
	  if(formato.equals("-"))
	    resultado = fecha.substring(n-2) + "/" + fecha.substring((n-5), (n-3)) + "/" + fecha.substring(0, 4);
	  else
	    resultado = fecha.substring(n-4) + "-" + fecha.substring((n-7), (n-5)) + "-" + fecha.substring(0, 2);
	}
	return resultado;
  }

// otros
  public String request_id_fuente_organismo(){
    Abm abm = new Abm();
    String organismo= verificar (sRequest("id_organismo_financiador"), "=", "d.id_fuente_organismo", "");
    if((iRequest("id_fuente_financiamiento")>0)&&(iRequest("id_organismo_financiador")==0)){
      abm.setSql("SELECT id_fuente_organismo FROM fnt_organismos WHERE id_estado = 'A' AND id_fuente_financiamiento="+iRequest("id_fuente_financiamiento"));
      List lorganismo = this.mi.getEjecutarListado(abm);
      organismo="\n AND (false ";
      for (int i=0; i<lorganismo.size(); i++) {
        organismo+=" OR d.id_fuente_organismo = " + ((Abm)lorganismo.get(i)).getValores();
      }
      organismo+=")";
    }
    return organismo;
  }




  // Combos
  public void combo_unidad(){combo("SELECT u.id_unidad, replace(substring(u.unidad for 50), ',', '#~~~#') FROM unidades u, _usr_unidades a, _usr_roles b WHERE u.id_unidad=a.id_unidad AND u.id_tipo_calificacion=1 AND a.id_usr_rol = b.id_usr_rol AND b.id_usuario="+((Clientes) request.getSession().getAttribute("__sess_cliente")).getId_usuario(), "lunidad");}
  public void combo_apertura(){combo("SELECT p.id_apertura_programatica, replace((codigo_apertura_programatica ||' - '|| apertura_programatica), ',', '#~~~#'), id_unidad FROM pr_aperturas_programaticas p, pr_und_aperturas a WHERE p.id_apertura_programatica = a.id_apertura_programatica order by codigo_apertura_programatica", "lapertura");}
  public void combo_gestion(){combo("SELECT valor|| '-01-01', now()::date FROM _parametros WHERE sistema='financiero' and campo='gestion'", "lgestion");}
  public void combo_periodo_contable(){combo("SELECT DISTINCT  id_periodo_contable, substring(periodo_contable for 50) as periodo_contable FROM periodos_contables ORDER BY periodo_contable", "lperiodo_contable");}
  public void combo_comprobante(){combo("SELECT DISTINCT c.id_comprobante, fec_comprobante || ' - ' || nro_comprobante, id_unidad FROM ct_comprobantes c, ct_cmp_detalles d, codigos_transacciones ct WHERE c.id_comprobante = d.id_comprobante AND c.id_estado = 'V' AND c.id_codigo_transaccion = ct.id_codigo_transaccion AND bits like '______1%'", "lcomprobante");}
  public void combo_cuenta_bancaria(){combo("select id_cuenta_bancaria, replace(substring((numero ||' - '|| nombre) for 50), ',', '#~~~#'),id_unidad from ts_cuentas_bancarias order by numero", "lcuenta_bancaria");}
  public void combo_entidad_transferencia(){combo("SELECT DISTINCT et.id_entidad_transferencia, replace(substring(codigo_entidad_transferencia || ' - ' || entidad_transferencia for 50), ',', '#~~~#')  FROM entidades_transferencias et, (SELECT DISTINCT id_entidad_transferencia FROM ct_cmp_detalles) c WHERE et.id_entidad_transferencia = c.id_entidad_transferencia ORDER BY replace(substring(codigo_entidad_transferencia || ' - ' || entidad_transferencia for 50), ',', '#~~~#')", "lentidad_transferencia");}
  public void combo_fuente_financiamiento(){combo("SELECT DISTINCT fo.id_fuente_financiamiento, codigo_fuente_financiamiento || ' - ' || replace(fuente_financiamiento, ',', '#~~~#') FROM fuentes_financiamientos ff, (SELECT DISTINCT id_fuente_organismo FROM ct_cmp_detalles) c, fnt_organismos fo WHERE ff.id_fuente_financiamiento = fo.id_fuente_financiamiento AND c.id_fuente_organismo = fo.id_fuente_organismo ORDER BY codigo_fuente_financiamiento || ' - ' || replace(fuente_financiamiento, ',', '#~~~#')", "lfuente_financiamiento");}
  public void combo_organismo_financiador(){combo("SELECT DISTINCT fo.id_fuente_organismo, codigo_organismo_financiador || ' - ' || replace(organismo_financiador, ',', '#~~~#'), id_fuente_financiamiento FROM organismos_financiadores ff, (SELECT DISTINCT id_fuente_organismo FROM ct_cmp_detalles) c, fnt_organismos fo WHERE ff.id_organismo_financiador = fo.id_organismo_financiador AND c.id_fuente_organismo = fo.id_fuente_organismo ORDER BY codigo_organismo_financiador || ' - ' || replace(organismo_financiador, ',', '#~~~#')", "lorganismo_financiador");}
  public void combo_almacen_activos(){combo("SELECT id_almacen, replace(substring(almacen for 50), ',', '#~~~#') as almacen FROM almacenes al WHERE id_tipo_almacen =3  AND id_almacen not in ( SELECT DISTINCT id_almacen_padre FROM almacenes) ORDER BY almacen", "lalmacen");}
  public void combo_tipo_baja(){combo("SELECT DISTINCT  id_tipo_baja, replace(substring(tipo_baja for 50), ',', '#~~~#') as tipo_baja FROM act_tipos_bajas ORDER BY tipo_baja", "ltipo_baja");}
  public void combo_casa_comercial(){combo("SELECT DISTINCT  id_casa_comercial, replace(substring(casa_comercial for 50), ',', '#~~~#') as casa_comercial FROM ss_casas_comerciales ORDER BY casa_comercial", "lcasa_comercial");}
  public void combo_tipo_restringido(){combo("SELECT DISTINCT  id_tipo_restringido, replace(substring(tipo_restringido for 50), ',', '#~~~#') as tipo_restringido FROM act_tipos_restringidos ORDER BY tipo_restringido", "ltipo_restringido");}
  public void combo_tipo_tipo_estado_activo(){combo("SELECT DISTINCT  id_tipo_estado_activo, replace(substring(tipo_estado_activo for 50), ',', '#~~~#') as tipo_estado_activo FROM act_tipos_estados_activos ORDER BY tipo_estado_activo", "ltipo_estado_activo");}


  public void combo_gestion_periodo(){
    combo_unidad();
    combo_apertura();
    combo_gestion();
    combo_periodo_contable();
    combo_entidad_transferencia();
    combo_fuente_financiamiento();
    combo_organismo_financiador();
    Abm abm = new Abm();
    abm.setSql("SELECT valor, id_periodo_contable FROM _parametros p, periodos_contables c WHERE campo='gestion' and sistema='financiero' and p.valor=c.gestion");
    List valores = this.mi.getEjecutarListado(abm);
    if( valores.size()>0) {
      abm = (Abm)valores.get(0);
      String valor1[]= abm.getValores().split(",");
      if(valor1.length==2){
        modelo.put("gestion", valor1[0]);
        modelo.put("id_periodo_contable", valor1[1]);
      }
    }
  }


}
