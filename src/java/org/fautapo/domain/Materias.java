package org.fautapo.domain;

import java.util.List;
/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Materias extends Departamentos {

  /* Private Fields */
  private int    id_materia;

  private int    id_tipo_materia;
  private String materia;
  private String sigla;
  private int    hrs_teoricas;
  private int    hrs_practicas;
  private int    hrs_periodo;
  private float  creditos;
  private List   grupos;
  private int    id_grupo;
  private String tipo_materia;
  private int    cupo_restante;
  private int    nro_grupos;
  private int    nivel_academico;
  //EST_PROGRAMACIONES
  private int    id_modelo_ahorro;
  private String modelo_ahorro;
  private String grupo;
  private int    id_estudiante;
  private int    id_mencion;
  private int    id_programa;
  private int    id_postulante;
  private int    max_niveles;
  //estadisticas
  private String programa;
  private int    id_tipo_grado;      
  private String id_plan;
  private int    id_tipo_evaluacion;      
  private List   asignaciones;
  private int    nro_asignaciones;
  private List   materias;
  private String estado;
  private String tipo_grado;
  private boolean es_electiva;
  private String mencion;
  private String nombre_completo;
  private String sigla_origen;
  private String materia_origen;
  private int similitud;
  private int nota_origen;
  /* JavaBeans Properties */

  /* JavaBeans Properties */

    public String getNombre_completo() {
        return nombre_completo;
    }

    public void setNombre_completo(String nombre_completo) {
        this.nombre_completo = nombre_completo;
    }

  
  public int getId_tipo_materia() { return id_tipo_materia; }
  public void setId_tipo_materia(int id_tipo_materia) { this.id_tipo_materia = id_tipo_materia; }
  
  
  public String getTipo_materia() { return tipo_materia; }
  public void setTipo_materia(String tipo_materia) { this.tipo_materia = tipo_materia; }
  
  public int getId_materia() { return id_materia; }
  public void setId_materia(int id_materia) { this.id_materia = id_materia; }

  public String getMateria() { return materia;}
  public void setMateria(String materia) { this.materia = materia;}
  
  public String getSigla() { return sigla;}
  public void setSigla(String sigla) { this.sigla = sigla;}
  
  public int getHrs_teoricas() { return hrs_teoricas;}
  public void setHrs_teoricas(int hrs_teoricas) { this.hrs_teoricas = hrs_teoricas;}
  
  public int getHrs_practicas() { return hrs_practicas;}
  public void setHrs_practicas(int hrs_practicas) { this.hrs_practicas = hrs_practicas;}

  public int getHrs_periodo() { return this.hrs_periodo; }
  public void setHrs_periodo(int hrs_periodo) { this.hrs_periodo = hrs_periodo; }

  public float getCreditos() { return creditos;}
  public void setCreditos(float creditos) { this.creditos = creditos; }

  public List getGrupos() { return grupos; }
  public void setGrupos(List grupos) { this.grupos = grupos; }
  
  public int getCupo_restante() { return cupo_restante; }
  public void setCupo_restante(int cupo_restante) { this.cupo_restante = cupo_restante; }
  
  public int getNro_grupos() {return nro_grupos;}
  public void setNro_grupos(int nro_grupos) { this.nro_grupos = nro_grupos; }

  public int getNivel_academico() {return nivel_academico;}
  public void setNivel_academico(int nivel_academico) { this.nivel_academico = nivel_academico; }
  
  public int getId_grupo() { return id_grupo;}
  public void setId_grupo(int id_grupo) {this.id_grupo = id_grupo; }
  
   //EST_PROGRAMACIONES 
  public int getId_modelo_ahorro() {return id_modelo_ahorro;}
  public void setId_modelo_ahorro(int id_modelo_ahorro) { this.id_modelo_ahorro = id_modelo_ahorro;}
  
  public String getModelo_ahorro() {return modelo_ahorro;}
  public void setModelo_ahorro(String modelo_ahorro) { this.modelo_ahorro = modelo_ahorro;}
  
  public String getGrupo() {  return grupo; }
  public void setGrupo(String grupo) { this.grupo = grupo;} 
  
  public int getId_estudiante() {return id_estudiante;}
  public void setId_estudiante(int id_estudiante) { this.id_estudiante = id_estudiante;}

  public int getId_mencion() {return id_mencion;}
  public void setId_mencion(int id_mencion) { this.id_mencion = id_mencion;}
  
  public int getId_programa() { return id_programa; }
  public void setId_programa(int id_programa) { this.id_programa = id_programa; }
  
  public int getId_postulante() {return id_postulante;}
  public void setId_postulante(int id_postulante) { this.id_postulante = id_postulante;}

  public int getMax_niveles() { return max_niveles; }
  public void setMax_niveles(int max_niveles) { this.max_niveles = max_niveles; } 
  
  public String getPrograma() {return programa;}
  public void setPrograma(String programa) { this.programa = programa;} 
  
  public String getId_plan() { return id_plan; }
  public void setId_plan(String id_plan) { this.id_plan = id_plan; } 
  
  public int getId_tipo_grado() { return id_tipo_grado; }
  public void setId_tipo_grado(int id_tipo_grado) { this.id_tipo_grado = id_tipo_grado; } 
  
  public int getId_tipo_evaluacion() { return id_tipo_evaluacion; }
  public void setId_tipo_evaluacion(int id_tipo_evaluacion) { this.id_tipo_evaluacion = id_tipo_evaluacion; } 
  
  public List getAsignaciones() { return asignaciones; }
  public void setAsignaciones(List asignaciones) { this.asignaciones = asignaciones; }
  
  public int getNro_asignaciones() {return nro_asignaciones;}
  public void setNro_asignaciones(int nro_asignaciones) { this.nro_asignaciones = nro_asignaciones; }
  
  public List getMaterias() { return materias; }
  public void setMaterias(List materias) { this.materias = materias; }
  
  public String getEstado() { return this.estado; }
  public void setEstado(String estado) { this.estado = estado; }

  public String getTipo_grado() { return this.tipo_grado; }
  public void setTipo_grado(String tipo_grado) { this.tipo_grado = tipo_grado; }

  public boolean getEs_electiva() { return this.es_electiva; }
  public void setEs_electiva(boolean es_electiva) { this.es_electiva = es_electiva; }

  public String getMencion() { return mencion; }
  public void setMencion(String mencion) { this.mencion = mencion; }
  
  public String getSigla_origen() { return sigla_origen; }
  public void setSigla_origen(String sigla_origen) { this.sigla_origen = sigla_origen; } 
  
  public String getMateria_origen() { return materia_origen; }
  public void setMateria_origen(String materia_origen) { this.materia_origen = materia_origen; } 

  public int getSimilitud() { return similitud; }
  public void setSimilitud(int similitud) { this.similitud = similitud; }

  public int getNota_origen() { return nota_origen; }
  public void setNota_origen(int nota_origen) { this.nota_origen = nota_origen; }

}