package org.fautapo.domain;

import java.util.List;
import java.util.Date;
import org.fautapo.domain.Grupos;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

import java.io.Serializable;
//public class Horarios implements Serializable {
public class Horarios extends Grupos {
// extends Grupos {

  // Seccion Private
  private int    id_dia;
  private int    id_hora;
  private int    id_aula;
  private int    nro_aulas;
  private int    asignada;
  private String aula;
  private String hora;
  private String dia;
  private List   aulas;
  private Date   hora_inicio;
  private Date   hora_fin;
  private int id_rol;
  private int id_tipo_aula;
  // Seccion Public

  public int getId_dia() { return id_dia; }
  public void setId_dia(int id_dia) { this.id_dia = id_dia; }

  public int getId_hora() { return id_hora; }
  public void setId_hora(int id_hora) { this.id_hora = id_hora; }

  public int getId_aula() { return id_aula; }
  public void setId_aula(int id_aula) { this.id_aula = id_aula; }

  public int getNro_aulas() { return nro_aulas; }
  public void setNro_aulas(int nro_aulas) { this.nro_aulas = nro_aulas; }

  public int getAsignada() { return asignada; }
  public void setAsignada(int asignada) { this.asignada = asignada; }

  public String getAula() { return aula; }
  public void setAula(String aula) { this.aula = aula; }

  public String getHora() { return hora; }
  public void setHora(String hora) { this.hora = hora; }

  public String getDia() { return dia; }
  public void setDia(String dia) { this.dia = dia; }

  public List getAulas() { return aulas; }
  public void setAulas(List aulas) { this.aulas = aulas; }

  public Date getHora_inicio() { return hora_inicio; }
  public void setHora_inicio(Date hora_inicio) { this.hora_inicio = hora_inicio; }

  public Date getHora_fin() { return hora_fin; }
  public void setHora_fin(Date hora_fin) { this.hora_fin = hora_fin; }

  public int getId_rol() { return id_rol; }
  public void setId_rol(int id_rol) { this.id_rol = id_rol; }
  
  public int getId_tipo_aula() { return id_tipo_aula; }
  public void setId_tipo_aula(int id_tipo_aula) { this.id_tipo_aula = id_tipo_aula; }

}