package org.fautapo.domain;

import java.util.List;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Categorias extends Principal {

  /* Private Fields */
  private int    id_categoria;
  private int    id_rol;
  private String categoria;
  private String imagen;
  private List   enlaces;
  /* JavaBeans Properties */

  public int getId_categoria() { return id_categoria; }
  public void setId_categoria(int id_categoria) { this.id_categoria = id_categoria; }

  public int getId_rol() { return id_rol; }
  public void setId_rol(int id_rol) { this.id_rol = id_rol; }

  public String getCategoria() { return categoria; }
  public void setCategoria(String categoria) {this.categoria = categoria; }

  public String getImagen() { return imagen; }
  public void setImagen(String imagen) { this.imagen = imagen; }

  public List getEnlaces() { return enlaces; }
  public void setEnlaces(List enlaces) { this.enlaces = enlaces; }
}