package org.fautapo.domain;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Enlaces extends Categorias {

  /* Private Fields */
  private int    id_enlace;
  private String enlace;
  private String ruta;
  private int    orden;
  private String tabla;
  private String permiso;
  private int id_enlace_padre;
  private int nivel;
  /* JavaBeans Properties */

  public int getId_enlace() { return id_enlace; }
  public void setId_enlace(int id_enlace) { this.id_enlace = id_enlace; }

  public String getEnlace() { return enlace; }
  public void setEnlace(String enlace) { this.enlace = enlace; }

  public String getRuta() { return ruta; }
  public void setRuta(String ruta) { this.ruta = ruta; }

  public int getOrden() { return orden; }
  public void setOrden(int orden) { this.orden = orden; }

  public String getTabla() { return tabla; }
  public void setTabla(String tabla) { this.tabla = tabla; }

  public String getPermiso() { return permiso; }
  public void setPermiso(String permiso) { this.permiso = permiso; }
  
  public int getId_enlace_padre() { return id_enlace_padre; }
  public void setId_enlace_padre(int id_enlace_padre) { this.id_enlace_padre = id_enlace_padre; }
  
  public int getNivel() { return nivel; }
  public void setNivel(int nivel) { this.nivel = nivel; }

}