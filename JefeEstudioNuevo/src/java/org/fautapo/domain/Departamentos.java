package org.fautapo.domain;

import org.fautapo.domain.Facultades;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Departamentos extends Facultades {

  /* Private Fields */
  private int    id_departamento;
  private String departamento;
  /* JavaBeans Properties */

  public int getId_departamento() { return id_departamento; }
  public void setId_departamento(int id_departamento) { this.id_departamento = id_departamento; }

  public String getDepartamento() { return departamento; }
  public void setDepartamento(String departamento) { this.departamento = departamento; }

}