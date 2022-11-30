package org.fautapo.domain;

import java.io.Serializable;
import org.fautapo.domain.Menciones;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Planes extends Menciones {

  /* Private Fields */
  private String id_plan_ant;
  private int    id_tipo_evaluacion;
  private int    id_materia_ant;
  private int    id_materia;
  private String materia;
  private int    nivel_academico;
  private int    id_tipo_materia;
  private int    id_grado;
  private int    id_tipo_grado;
  private String tipo_grado;
  private String tipo_materia;
  private String grado_academico;
  private int    id_grado_academico;
  private String tipo_evaluacion;
  private int    id_programa;
  private int    numero;
  private int    aprobados;
  private int    reprobados;
  private int    abandonos;
  private String plan;
  private String detalles;
  private String resolucion;
  private boolean actual;
  private String materias_anteriores;
  private int    id_mtr_plan;
  private int    id_perfil;
  private double costo;
  private int    id_prg_plan;
  private int    hrs_teoricas;
  private int    hrs_practicas;
  private int    creditos;
  private int    id_tipo_sexo;
  
  private int    id_tipo_convalidacion;
  private String tipo_convalidacion;
  private String sigla_origen;
  private String materia_origen;
  private int similitud;
  private int  nota_origen;
  private int  id_convalidacion;
  private String nro_resolucion;
  private String  paterno;
  private String  materno;
  private String  nombres;
  private int  id_estudiante;
  private int  id_cnv_detalle;
  private int  id_nota;  
  private int  id_matricula;
  /* JavaBeans Properties */
private int id_fase_resolucion;
 public int getId_fase_resolucion() { return id_fase_resolucion; }
  public void  setId_fase_resolucion(int id_fase_resolucion) { this.id_fase_resolucion = id_fase_resolucion; }
  
  public String getGrado_academico() { return grado_academico; }
  public void setGrado_academico(String grado_academico) { this.grado_academico = grado_academico;  }

  public int getId_grado_academico() { return id_grado_academico; }
  public void  setId_grado_academico(int id_grado_academico) { this.id_grado_academico = id_grado_academico; }

  public String getTipo_evaluacion() { return tipo_evaluacion; }
  public void setTipo_evaluacion(String tipo_evaluacion) { this.tipo_evaluacion = tipo_evaluacion;  }

  public String getTipo_grado() { return tipo_grado; }
  public void setTipo_grado(String tipo_grado) { this.tipo_grado = tipo_grado;  }

  public int getId_programa() { return id_programa; }
  public void  setId_programa(int id_programa) { this.id_programa = id_programa; }

  public String getId_plan_ant() { return id_plan_ant; }
  public void  setId_plan_ant(String id_plan_ant) { this.id_plan_ant = id_plan_ant; }

  public int getId_tipo_evaluacion() { return id_tipo_evaluacion; }
  public void setId_tipo_evaluacion(int id_tipo_evaluacion) { this.id_tipo_evaluacion = id_tipo_evaluacion; }

  public int getId_materia_ant() { return id_materia_ant; }
  public void setId_materia_ant(int id_materia_ant) { this.id_materia_ant = id_materia_ant; }

  public int getId_materia() { return id_materia; }
  public void setId_materia(int id_materia) { this.id_materia = id_materia; }

  public int getNivel_academico() { return nivel_academico; }
  public void setNivel_academico(int nivel_academico) { this.nivel_academico = nivel_academico; }

  public int getId_tipo_materia() { return id_tipo_materia; }
  public void setId_tipo_materia(int id_tipo_materia) { this.id_tipo_materia = id_tipo_materia; }

  public int getId_grado() { return id_grado; }
  public void setId_grado(int id_grado) { this.id_grado = id_grado; }

  public String getMateria() { return materia; }
  public void setMateria(String materia) { this.materia = materia; }

  public String getTipo_materia() { return tipo_materia; }
  public void setTipo_materia(String tipo_materia) { this.tipo_materia = tipo_materia; }

  public int getId_tipo_grado() { return id_tipo_grado; }
  public void setId_tipo_grado(int id_tipo_grado) { this.id_tipo_grado = id_tipo_grado; }

  public int getNumero(){return numero;}
  public void setNumero(int numero){this.numero = numero;}
  
  public int getAprobados(){ return aprobados; }
  public void setAprobados(int aprobados){ this.aprobados = aprobados; }
  
  public int getReprobados(){ return reprobados; }
  public void setReprobados(int reprobados){ this.reprobados = reprobados; }
  
  public int getAbandonos(){ return abandonos; }
  public void setAbandonos(int abandonos){ this.abandonos = abandonos; }
  
  public String getPlan() { return plan; }
  public void setPlan(String plan) { this.plan = plan; }
  
  public String getResolucion() { return resolucion; }
  public void setResolucion(String resolucion) { this.resolucion = resolucion; }
  
  public String getDetalles() { return detalles; }
  public void setDetalles(String detalles) { this.detalles = detalles; }
  
  public boolean getActual() { return actual; }
  public void setActual(boolean actual) { this.actual = actual; }  
  
  public String getMaterias_anteriores() { return materias_anteriores; }
  public void setMaterias_anteriores(String materias_anteriores) { this.materias_anteriores = materias_anteriores; }

  public int getId_mtr_plan() { return id_mtr_plan; }
  public void setId_mtr_plan(int id_mtr_plan) { this.id_mtr_plan = id_mtr_plan; }
  
  public int getId_perfil() { return id_perfil; }
  public void setId_perfil(int id_perfil) { this.id_perfil = id_perfil; }
  
  public double getCosto() { return costo; }
  public void setCosto(double costo) { this.costo = costo; }
  
  public int getId_prg_plan() { return id_prg_plan; }
  public void setId_prg_plan(int id_prg_plan) { this.id_prg_plan = id_prg_plan; }
  
  public int getHrs_teoricas() { return hrs_teoricas;}
  public void setHrs_teoricas(int hrs_teoricas) { this.hrs_teoricas = hrs_teoricas;}
  
  public int getHrs_practicas() { return hrs_practicas;}
  public void setHrs_practicas(int hrs_practicas) { this.hrs_practicas = hrs_practicas;}

  public int getCreditos() { return creditos;}
  public void setCreditos(int creditos) { this.creditos = creditos; }

  public int getId_tipo_sexo() { return id_tipo_sexo; }
  public void setId_tipo_sexo(int id_tipo_sexo) { this.id_tipo_sexo = id_tipo_sexo; }
  
  public int getId_tipo_convalidacion() { return id_tipo_convalidacion; }
  public void setId_tipo_convalidacion(int id_tipo_convalidacion) { this.id_tipo_convalidacion = id_tipo_convalidacion; }
  
  public String getTipo_convalidacion() { return tipo_convalidacion; }
  public void setTipo_convalidacion(String tipo_convalidacion) { this.tipo_convalidacion = tipo_convalidacion; } 
  
  public String getSigla_origen() { return sigla_origen; }
  public void setSigla_origen(String sigla_origen) { this.sigla_origen = sigla_origen; } 
  
  public String getMateria_origen() { return materia_origen; }
  public void setMateria_origen(String materia_origen) { this.materia_origen = materia_origen; } 

  public int getSimilitud() { return similitud; }
  public void setSimilitud(int similitud) { this.similitud = similitud; }

  public int getNota_origen() { return nota_origen; }
  public void setNota_origen(int nota_origen) { this.nota_origen = nota_origen; }
  
  public int getId_convalidacion() { return this.id_convalidacion; }
  public void setId_convalidacion(int id_convalidacion) { this.id_convalidacion = id_convalidacion; }

  public String getNro_resolucion() { return nro_resolucion; }
  public void setNro_resolucion(String nro_resolucion) { this.nro_resolucion = nro_resolucion; }
  
  public String getNombres() { return nombres; }
  public void setNombres(String nombres) { this.nombres = nombres; }

  public String getPaterno() { return paterno; }
  public void setPaterno(String paterno) { this.paterno = paterno; }

  public String getMaterno() { return materno; }
  public void setMaterno(String materno) { this.materno = materno; }
  
  public int getId_estudiante() { return id_estudiante; }
  public void setId_estudiante(int id_estudiante) { this.id_estudiante = id_estudiante; }

  public int getId_cnv_detalle() { return id_cnv_detalle; }
  public void setId_cnv_detalle(int id_cnv_detalle) { this.id_cnv_detalle = id_cnv_detalle; }

  public int getId_nota() { return id_nota; }
  public void setId_nota(int id_nota) { this.id_nota = id_nota; }
  
  public int getId_matricula() {return id_matricula;}
  public void setId_matricula(int id_matricula) { this.id_matricula = id_matricula; }


}