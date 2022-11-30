package org.fautapo.domain;

import java.io.Serializable;
import java.util.List;
import java.lang.*;
import java.util.Date;
import java.sql.Time;

public class Proveidos extends Tramites {

  /* Private Fields */
  private int    id_tipo_proveido;
  private String tipo_proveido;   
  private int	 id_proveido;
  private String proveido;
  
  /* JavaBeans Properties */

  public int getId_tipo_proveido() { return id_tipo_proveido; }
  public void setId_tipo_proveido(int id_tipo_proveido) { this.id_tipo_proveido = id_tipo_proveido; }
  
  public String getTipo_proveido() { return tipo_proveido;  }
  public void setTipo_proveido(String tipo_proveido) {this.tipo_proveido = tipo_proveido; }  

  public int getId_proveido() { return id_proveido; }
  public void setId_proveido(int id_proveido) { this.id_proveido = id_proveido; }

  public String getProveido() { return proveido; }
  public void setProveido(String proveido) { this.proveido = proveido; }

}