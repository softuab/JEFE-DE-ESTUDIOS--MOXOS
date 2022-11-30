package org.fautapo.domain;

import java.io.Serializable;
import java.util.List;
import java.lang.*;
import java.util.Date;

public class Dominios extends Actividades {

  /* Private Fields */
  private int	  id_dominio;
  private String  campos;
  private int     id_dominio_padre;     
  private String  dominio;
  private boolean privado;
  private String  dominio_padre;
  private int     id_tipo_dominio;
  private String  tipo_dominio;
  private int	  id_form;
  private int	  id_campo;
  private String  form;
  private String  campo;
  private String  tabla;
  private int     id_tupla;
  private String  tupla;
  private int     id_tupla_padre;
  private String  tupla_padre;
  private int     seleccionado;
  private boolean obligatorio;
  private String  primario;

  /* JavaBeans Properties */

  public int getId_dominio() { return id_dominio; }
  public void setId_dominio(int id_dominio) { this.id_dominio = id_dominio; }

  public String getCampos() { return campos; }
  public void setCampos(String campos) { this.campos = campos; }

  public int getId_dominio_padre() { return id_dominio_padre; }
  public void setId_dominio_padre(int id_dominio_padre) { this.id_dominio_padre = id_dominio_padre; }

  public String getDominio() { return dominio; }
  public void setDominio(String dominio) { this.dominio = dominio; } 

  public boolean getPrivado() { return privado; }
  public void setPrivado(boolean privado) { this.privado = privado; }  

  public String getDominio_padre() { return dominio_padre; }
  public void setDominio_padre(String dominio_padre) {this.dominio_padre = dominio_padre; }

  public int getId_tipo_dominio() { return id_tipo_dominio; }
  public void setId_tipo_dominio(int id_tipo_dominio) { this.id_tipo_dominio = id_tipo_dominio; }

  public String getTipo_dominio() { return tipo_dominio; }
  public void setTipo_dominio(String tipo_dominio) { this.tipo_dominio = tipo_dominio; }

  public int getId_form() { return id_form; }
  public void setId_form(int id_form) { this.id_form = id_form; }

  public int getId_campo() { return id_campo; }
  public void setId_campo(int id_campo) { this.id_campo = id_campo; }
 
  public String getForm() { return form; }
  public void setForm(String form) { this.form = form; }
  
  public String getCampo() { return campo; }
  public void setCampo(String campo) { this.campo = campo; }

  public String getTabla() { return tabla; }
  public void setTabla(String tabla) {this.tabla = tabla; }    

  public int getId_tupla() { return id_tupla; }
  public void setId_tupla(int id_tupla) { this.id_tupla = id_tupla; }

  public String getTupla() { return tupla; }
  public void setTupla(String tupla) { this.tupla = tupla; }
  
  public int getId_tupla_padre() { return id_tupla_padre; }
  public void setId_tupla_padre(int id_tupla_padre) { this.id_tupla_padre = id_tupla_padre; }

  public String getTupla_padre() { return tupla_padre; }
  public void setTupla_padre(String tupla_padre) { this.tupla_padre = tupla_padre; }

  public int getSeleccionado() { return seleccionado; }
  public void setSeleccionado(int seleccionado) { this.seleccionado = seleccionado; }

  public boolean getObligatorio() { return obligatorio; }
  public void setObligatorio(boolean obligatorio) { this.obligatorio = obligatorio; }

  public String getPrimario() { return primario; }
  public void setPrimario(String primario) { this.primario = primario; }
  
}