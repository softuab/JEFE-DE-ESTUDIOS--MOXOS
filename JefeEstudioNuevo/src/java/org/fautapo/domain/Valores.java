package org.fautapo.domain;

import java.io.Serializable;
import java.util.Date;

public class Valores extends Principal {

  /* Private Fields */
 private int	puntaje;
 private int 	verificacion;
// private String    var;
 /* JavaBeans Properties */
  
  public int getPuntaje() { return puntaje; }
  public void setPuntaje(int puntaje) { this.puntaje = puntaje; }
  
  public int getVerificacion() { return verificacion; }
  public void setVerificacion(int verificacion) { this.verificacion = verificacion; }
  
  
}