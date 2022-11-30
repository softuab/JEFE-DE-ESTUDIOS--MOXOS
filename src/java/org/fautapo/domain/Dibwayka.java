package org.fautapo.domain;

import java.util.List;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Dibwayka extends Principal {

  /* Private Fields */
  private int     id_campo;
  private int     id_dominio;
  private int     id_proceso;
  private int     id_tupla;
  private int     id_tupla_padre;
  private int     id_dominio_padre;
  private String  id_tipo_validacion;
  private String  id_tipo_permiso;
  private String  campo;
  private String  tupla;
  private String  descripcion;
  private List    lista_combo;
  private String  proceso;

  private int     id_tabla;
  private String  tabla;
  private String  etiqueta;
  private String  tipo_dato;
  /* JavaBeans Properties */
  private int     id_consulta;  
  private String  consulta;
  private String  etiquetas;
  private String  variables;  
  private String  cabezas;  
  private String  sumas;    
  private boolean glosa;      
  private String  componente;    
  private String  sql;      
  private String  id_campos;
  private int     orden;

  public int getId_campo() { return id_campo; }
  public void setId_campo(int id_campo) { this.id_campo = id_campo; }

  public int getId_dominio() { return id_dominio; }
  public void setId_dominio(int id_dominio) { this.id_dominio = id_dominio; }

  public int getId_proceso() { return id_proceso; }
  public void setId_proceso(int id_proceso) { this.id_proceso = id_proceso; }

  public int getId_tupla() { return id_tupla; }
  public void setId_tupla(int id_tupla) { this.id_tupla = id_tupla; }

  public int getId_tupla_padre() { return id_tupla_padre; }
  public void setId_tupla_padre(int id_tupla_padre) { this.id_tupla_padre = id_tupla_padre; }

  public int getId_dominio_padre() { return id_dominio_padre; }
  public void setId_dominio_padre(int id_dominio_padre) { this.id_dominio_padre = id_dominio_padre; }

  public String getId_tipo_validacion() { return id_tipo_validacion; }
  public void setId_tipo_validacion(String id_tipo_validacion) { this.id_tipo_validacion = id_tipo_validacion; }

  public String getId_tipo_permiso() { return id_tipo_permiso; }
  public void setId_tipo_permiso(String id_tipo_permiso) { this.id_tipo_permiso = id_tipo_permiso; }

  public String getCampo() { return campo; }
  public void setCampo(String campo) { this.campo = campo; }

  public String getTupla() { return tupla; }
  public void setTupla(String tupla) { this.tupla = tupla; }

  public String getDescripcion() { return descripcion; }
  public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

  public List getLista_combo() { return lista_combo; }
  public void setLista_combo(List lista_combo) { this.lista_combo = lista_combo; }

  public String getProceso() { return proceso; }
  public void setProceso(String proceso) { this.proceso = proceso; }

  public String getEtiqueta() { return etiqueta; }
  public void setEtiqueta(String etiqueta) { this.etiqueta = etiqueta; }

  public int getId_tabla() { return id_tabla; }
  public void setId_tabla(int id_tabla) { this.id_tabla = id_tabla; }

  public String getTabla() { return tabla; }
  public void setTabla(String tabla) { this.tabla = tabla; }

  public String getTipo_dato() { return tipo_dato; }
  public void setTipo_dato(String tipo_dato) { this.tipo_dato = tipo_dato; }


  public int getId_consulta() { return id_consulta; }
  public void setId_consulta(int id_consulta) { this.id_consulta = id_consulta; }

  public String getConsulta() { return consulta; }
  public void setConsulta(String consulta) { this.consulta = consulta; }

  public String getEtiquetas() { return etiquetas; }
  public void setEtiquetas(String etiquetas) { this.etiquetas = etiquetas; }

  public String getCabezas() { return cabezas; }
  public void setCabezas(String cabezas) { this.cabezas = cabezas; }

  public String getSumas() { return sumas; }
  public void setSumas(String sumas) { this.sumas = sumas; }

  public boolean getGlosa() { return glosa; }
  public void setGlosa(boolean glosa) { this.glosa = glosa; }

  public String getVariables() { return variables; }
  public void setVariables(String variables) { this.variables = variables; }

  public String getComponente() { return componente; }
  public void setComponente(String componente) { this.componente = componente; }

  public String getSql() { return sql; }
  public void setSql(String sql) { this.sql = sql; }

  public String getId_campos() { return id_campos; }
  public void setId_campos(String id_campos) { this.id_campos = id_campos; }

  public int getOrden() { return orden; }
  public void setOrden(int orden) { this.orden = orden; }

}