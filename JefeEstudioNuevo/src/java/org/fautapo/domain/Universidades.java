package org.fautapo.domain;

import org.fautapo.domain.Instituciones;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Universidades extends Instituciones {

  /* Private Fields */
  private int    id_universidad;
  private String universidad;
  /* JavaBeans Properties */

  public int getId_universidad() { return id_universidad; }
  public void setId_universidad(int id_universidad) { this.id_universidad = id_universidad; }

  public String getUniversidad() { return universidad; }
  public void setUniversidad(String universidad) { this.universidad = universidad; }

}