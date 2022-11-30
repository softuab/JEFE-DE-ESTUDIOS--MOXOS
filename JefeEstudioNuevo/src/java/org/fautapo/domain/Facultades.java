package org.fautapo.domain;

import org.fautapo.domain.Universidades;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Facultades extends Universidades {

  /* Private Fields */
  private int    id_facultad;
  private int    id_sede;
  private String facultad;
  private String codigo;
  private String decano;
  private String value;
  private String display;

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
  
  
  /* JavaBeans Properties */

  public int getId_facultad() { return id_facultad; }
  public void setId_facultad(int id_facultad) { this.id_facultad = id_facultad; }

  public int getId_sede() { return id_sede; }
  public void setId_sede(int id_sede) { this.id_sede = id_sede; }

  public String getFacultad() { return facultad; }
  public void setFacultad(String facultad) { this.facultad = facultad; }

  public String getCodigo() { return codigo; }
  public void setCodigo(String codigo) { this.codigo = codigo; }

  public String getDecano() { return decano; }
  public void setDecano(String decano) { this.decano = decano; }

}