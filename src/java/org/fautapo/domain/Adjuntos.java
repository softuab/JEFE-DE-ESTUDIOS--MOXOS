package org.fautapo.domain;

import java.io.Serializable;
import java.util.List;
import java.lang.*;
import java.util.Date;
import java.sql.Time;

public class Adjuntos extends Tramites {

  /* Private Fields */
  private int	 id_adjunto;
  private String adjunto;
  private String archivo;
  
  /* JavaBeans Properties */

  public int getId_adjunto() { return id_adjunto; }
  public void setId_adjunto(int id_adjunto) { this.id_adjunto = id_adjunto; }

  public String getAdjunto() { return adjunto; }
  public void setAdjunto(String adjunto) { this.adjunto = adjunto; }

  public String getArchivo() { return archivo; }
  public void setArchivo(String archivo) { this.archivo = archivo; }

}