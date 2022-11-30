package org.fautapo.domain;

import java.io.Serializable;
import java.util.*;
import java.io.*;
import org.fautapo.domain.Modelos_ahorros;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-07
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-07
*/

public class Grupos extends Modelos_ahorros {

  /* Private Fields */

  private int    id_dpto_grupo;
  private int    id_grupo;  
  private String grupo;
  private int    cupo_actual;
  private int    cupo_max;
  private double horas;
  private int    nro_resolucion;
  private Date   fec_resolucion;
  private int    id_grupo_ant;
  private int    id_estudiante;
  private int    id_postulante;  
  private int    resultado;
  private int    id_asignacion; 
  private int    id_tipo_evaluacion;
  private String tipo_evaluacion;
  private String fec_resolucion2;
  private String snro_resolucion;
   private int id_fase_resolucion;
  /* JavaBeans Properties */

  public int getId_dpto_grupo(){return id_dpto_grupo;}
  public void setId_dpto_grupo(int id_dpto_grupo){this.id_dpto_grupo = id_dpto_grupo; }
  
  public int getId_fase_resolucion(){return id_fase_resolucion;}
  public void setId_fase_resolucion(int id_fase_resolucion){this.id_fase_resolucion = id_fase_resolucion; }

  public int getId_grupo(){return id_grupo;}
  public void setId_grupo(int id_grupo){this.id_grupo = id_grupo; }

  public String getGrupo() {return grupo;}
  public void setGrupo(String grupo) {this.grupo = grupo;}

  public int getCupo_actual() { return cupo_actual; }
  public void setCupo_actual(int cupo_actual) {this.cupo_actual = cupo_actual;}
  
  public int getCupo_max() {return cupo_max;}
  public void setCupo_max(int cupo_max) {this.cupo_max = cupo_max;}

  public double getHoras() {return horas;}
  public void setHoras(double horas) {this.horas = horas;}

  public int getNro_resolucion() {return nro_resolucion;}
  public void setNro_resolucion(int nro_resolucion) {this.nro_resolucion = nro_resolucion;}

  public Date getFec_resolucion() {return fec_resolucion;}
  public void setFec_resolucion(Date fec_resolucion) {this.fec_resolucion = fec_resolucion;}

  public int getId_grupo_ant(){return id_grupo_ant;}
  public void setId_grupo_ant(int id_grupo_ant){this.id_grupo_ant = id_grupo_ant; }

  public int getId_estudiante(){return id_estudiante;}
  public void setId_estudiante(int id_estudiante){this.id_estudiante = id_estudiante;}

  public int getId_postulante(){return id_postulante;}
  public void setId_postulante(int id_postulante){this.id_postulante = id_postulante;}
 
  public int getResultado(){return resultado;}
  public void setResultado(int resultado){this.resultado = resultado; }
  
  public int getId_asignacion() { return this.id_asignacion; }
  public void setId_asignacion(int id_asignacion) { this.id_asignacion = id_asignacion; }
  
  public int getId_tipo_evaluacion() { return id_tipo_evaluacion; }
  public void setId_tipo_evaluacion(int id_tipo_evaluacion) { this.id_tipo_evaluacion = id_tipo_evaluacion; }
  
  public String getTipo_evaluacion() {return tipo_evaluacion; }
  public void setTipo_evaluacion(String tipo_evaluacion) {this.tipo_evaluacion = tipo_evaluacion; }  
  
  public String getFec_resolucion2() {return fec_resolucion2;}
  public void setFec_resolucion2(String fec_resolucion2) {this.fec_resolucion2 = fec_resolucion2;}

//ADICIONADO POR LA UAP
  public String getSnro_resolucion() {return  snro_resolucion;}
  public void setSnro_resolucion(String snro_resolucion) {this.snro_resolucion = snro_resolucion;}

}