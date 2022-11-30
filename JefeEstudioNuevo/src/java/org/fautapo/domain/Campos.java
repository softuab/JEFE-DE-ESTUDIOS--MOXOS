package org.fautapo.domain;

import java.io.Serializable;
import java.util.List;
import java.lang.*;
import java.util.Date;

public class Campos extends Dominios {

  /* Private Fields */
  private int     columnas;
  private int     filas;
  private int     caracteres;
  private String  id_tipo_validacion;
  private String  tipo_validacion;    
  private int     nro_fila;
  private int     nro_columna;
  private String  rango1;
  private String  rango2;
  private String  formula;
  private boolean referencia;
  private boolean operacion;
  private String  id_tipo_permiso;
  private String  tipo_permiso;
  private String  campos_suma;
  private String  cadena_1;  
  private String  cadena;
  private String  tablita;  
  private String  valor;
  private List    lista;
  private String  campos;
  private String  permiso;
  private boolean habilitado;
  private int     pagina;
  private String  campos2;
  
  /* JavaBeans Properties */

  public int getColumnas() { return columnas; }
  public void setColumnas(int columnas) { this.columnas = columnas; }

  public int getFilas() { return filas; }
  public void setFilas(int filas) { this.filas = filas; }
 
  public int getCaracteres() { return caracteres; }
  public void setCaracteres(int caracteres) { this.caracteres = caracteres; }

  public String getId_tipo_validacion() { return id_tipo_validacion; }
  public void setId_tipo_validacion(String id_tipo_validacion) { this.id_tipo_validacion = id_tipo_validacion; }

  public String getTipo_validacion() { return tipo_validacion; }
  public void setTipo_validacion(String tipo_validacion) { this.tipo_validacion = tipo_validacion; }

  public int getNro_fila() { return nro_fila; }
  public void setNro_fila(int nro_fila) { this.nro_fila = nro_fila; }

  public int getNro_columna() { return nro_columna; }
  public void setNro_columna(int nro_columna) { this.nro_columna = nro_columna; }

  public String getRango1() { return rango1; }
  public void setRango1(String rango1) { this.rango1 = rango1; }

  public String getRango2() { return rango2; }
  public void setRango2(String rango2) { this.rango2 = rango2; }

  public String getFormula() { return formula; }
  public void setFormula(String formula) { this.formula = formula; }      

  public boolean getReferencia() { return referencia; }
  public void setReferencia(boolean referencia) { this.referencia = referencia; }

  public boolean getOperacion() { return operacion; }
  public void setOperacion(boolean operacion) { this.operacion = operacion; }  

  public String getId_tipo_permiso() { return id_tipo_permiso; }
  public void setId_tipo_permiso(String id_tipo_permiso) { this.id_tipo_permiso = id_tipo_permiso; }

  public String getTipo_permiso() { return tipo_permiso; }
  public void setTipo_permiso(String tipo_permiso) { this.tipo_permiso = tipo_permiso; }

  public String getCampos_suma() { return campos_suma; }
  public void setCampos_suma(String campos_suma) { this.campos_suma = campos_suma; }

  public String getCadena() { return cadena; }
  public void setCadena(String cadena) { this.cadena = cadena; }
  
  public String getCadena_1() { return cadena_1; }
  public void setCadena_1(String cadena_1) { this.cadena_1 = cadena_1; }

  public String getTablita() { return tablita; }
  public void setTablita(String tablita) { this.tablita = tablita; }

  public String getValor() { return valor; }
  public void setValor(String valor) { this.valor = valor; }

  public List getLista() { return lista; }
  public void setLista(List lista) { this.lista = lista; }

  public String getCampos() { return campos; }
  public void setCampos(String campos) { this.campos = campos; }

  public String getPermiso() { return permiso; }
  public void setPermiso(String permiso) { this.permiso = permiso; }

  public boolean getHabilitado() { return habilitado; }
  public void setHabilitado(boolean habilitado) { this.habilitado = habilitado; }  

  public int getPagina() { return pagina; }
  public void setPagina(int pagina) { this.pagina = pagina; }

  public String getCampos2() { return campos2; }
  public void setCampos2(String campos2) { this.campos2 = campos2; }

}