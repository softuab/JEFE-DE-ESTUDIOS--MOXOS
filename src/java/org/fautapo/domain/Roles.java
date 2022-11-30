package org.fautapo.domain;

import java.util.Date;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Roles extends Clientes {

  /* Private Fields */
  private int    id_usr_rol;
  private int    id_rol_padre;
  private String descripcion;
  private Date   fec_expiracion;
  /* JavaBeans Properties */
//agregado el id rol para el modulo d designacion de docentes
private int id_rol;

 public int getId_rol() { return id_rol; }
  public void setId_rol(int id_rol) { this.id_rol = id_rol; }

  public int getId_usr_rol() { return id_usr_rol; }
  public void setId_usr_rol(int id_usr_rol) { this.id_usr_rol = id_usr_rol; }

  public int getId_rol_padre() { return id_rol_padre; }
  public void setId_rol_padre(int id_rol_padre) { this.id_rol_padre = id_rol_padre; }

  public String getDescripcion() { return descripcion; }
  public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

  public Date getFec_expiracion() { return fec_expiracion; }
  public void setFec_expiracion(Date fec_expiracion) { this.fec_expiracion = fec_expiracion; }

}