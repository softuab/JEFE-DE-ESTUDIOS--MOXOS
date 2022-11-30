package org.fautapo.domain;

import java.util.Date;
import java.util.List;
import org.fautapo.domain.Facultades;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
*/

public class Programas extends Facultades {

  /* Private Fields */
  private int    id_programa;
  private int    id_campus;
  private int    id_area_conocimiento;
  private int    id_grado_academico;
  private int    id_tipo_ensenyanza;
  private int    id_tipo_graduacion;
  private int    id_tipo_admision;
  private int    id_periodo;
  private int    id_sede;
  private String programa;
  private String resolucion_hcu;
  private Date   fec_inicio;
  private String mision;
  private String objetivos;
  private int    duracion;
  private String turno;
  private int    nro_estudiante;
  private float  nota_aprobacion;
  private int nota_minima;

  private float  nota_admision;
  //EST_PROGRAMACIONES
  private int     max_materias_laboratorios;
  private int     max_materias_teoricas;
  private float   costo_materia_laboratorio;
  private float   costo_materia_teorica;
  private String  id_plan;
  private int     id_tipo_programacion;
  private int     max_niveles;
  private int     id_estudiante;
  private String  modelo_ahorro;
  private String  materia;
  private String  grupo;
  private int  id_grupo;
  private int  id_materia;
  private int  id_modelo_ahorro;
  private int     id_postulante;
  private Date    fec_final;    
  private String  tipo_programacion;
  
  private int  id_mencion;
  private String  mencion;
  private int  nivel_academico;
  private String  materias;
  private int  id_detalle; 
  private String  nombres;
  private int    id_programacion;
  private int id_rol;
  private String tipo_admision;
  private int gestion;
  private int periodo;

  //estadisticas
  private int  id_tipo_grado;
  private String  tipo_grado;
  private String  plan;  
  private int  id_tipo_evaluacion;  
  private String  tipo_evaluacion;  
  /* JavaBeans Properties */


  
  public int getId_programa() { return id_programa; }
  public void setId_programa(int id_programa) { this.id_programa = id_programa; }
  
  public int getId_sede() { return id_sede; }
  public void setId_sede(int id_sede) { this.id_sede = id_sede; }

  public int getId_campus() { return id_campus; }
  public void setId_campus(int id_campus) { this.id_campus = id_campus; }

  public int getId_area_conocimiento() { return id_area_conocimiento; }
  public void setId_area_conocimiento(int id_area_conocimiento) { this.id_area_conocimiento = id_area_conocimiento; }

  public int getId_grado_academico() { return id_grado_academico; }
  public void setId_grado_academico(int id_grado_academico) { this.id_grado_academico = id_grado_academico; }

  public int getId_tipo_ensenyanza() { return id_tipo_ensenyanza; }
  public void setId_tipo_ensenyanza(int id_tipo_ensenyanza) { this.id_tipo_ensenyanza = id_tipo_ensenyanza; }

  public int getId_tipo_graduacion() { return id_tipo_graduacion; }
  public void setId_tipo_graduacion(int id_tipo_graduacion) { this.id_tipo_graduacion = id_tipo_graduacion; }

  public int getId_tipo_admision() { return id_tipo_admision; }
  public void setId_tipo_admision(int id_tipo_admision) { this.id_tipo_admision = id_tipo_admision; }

  public int getId_periodo() { return id_periodo; }
  public void setId_periodo(int id_periodo) { this.id_periodo = id_periodo; }

  public String getPrograma() { return programa; }
  public void setPrograma(String programa) { this.programa = programa; }

  public String getResolucion_hcu() { return resolucion_hcu; }
  public void setResolucion_hcu(String resolucion_hcu) { this.resolucion_hcu = resolucion_hcu; }

  public Date getFec_inicio() { return fec_inicio; }
  public void setFec_inicio(Date fec_inicio) { this.fec_inicio = fec_inicio; }

  public String getMision() { return mision; }
  public void setMision(String mision) { this.mision = mision; }

  public String getObjetivos() { return objetivos; }
  public void setObjetivos(String objetivos) { this.objetivos = objetivos; }

  public int getDuracion() { return duracion; }
  public void setDuracion(int duracion) { this.duracion = duracion; }

  public String getTurno() { return turno; }
  public void setTurno(String turno) { this.turno = turno; }

  public int getNro_estudiante() { return nro_estudiante; }
  public void setNro_estudiante(int nro_estudiante) { this.nro_estudiante = nro_estudiante; }

  public float getNota_aprobacion() { return nota_aprobacion; }
  public void setNota_aprobacion(float nota_aprobacion) { this.nota_aprobacion = nota_aprobacion; }

  public float getNota_admision() { return nota_admision; }
  public void setNota_admision(float nota_admision) { this.nota_admision = nota_admision; }

  //EST_PROGRAMACIONES
  public int getMax_materias_teoricas() { return max_materias_teoricas;}
  public void setMax_materias_teoricas(int max_materias_teoricas) { this.max_materias_teoricas = max_materias_teoricas;}

  public int getMax_materias_laboratorios() { return max_materias_laboratorios;}
  public void setMax_materias_laboratorios(int max_materias_laboratorios) { this.max_materias_laboratorios = max_materias_laboratorios;}

  public float getCosto_materia_teorica() { return costo_materia_teorica; }
  public void setCosto_materia_teorica(float costo_materia_teorica) { this.costo_materia_teorica = costo_materia_teorica; }

  public float getCosto_materia_laboratorio() { return costo_materia_laboratorio; }
  public void setCosto_materia_laboratorio(float costo_materia_laboratorio) { this.costo_materia_laboratorio = costo_materia_laboratorio; }
  
  public String  getId_plan() { return id_plan; }
  public void setId_plan(String id_plan) { this.id_plan = id_plan; }

  public int getId_tipo_programacion() { return id_tipo_programacion; }
  public void setId_tipo_programacion(int id_tipo_programacion) { this.id_tipo_programacion = id_tipo_programacion; }
  
   public int getMax_niveles() { return max_niveles; }
  public void setMax_niveles(int max_niveles) { this.max_niveles = max_niveles; }
  
  public int getId_estudiante() { return id_estudiante; }
  public void setId_estudiante(int id_estudiante) {this.id_estudiante = id_estudiante;} 
  
  public String  getModelo_ahorro() { return modelo_ahorro; }
  public void setModelo_ahorro(String modelo_ahorro) { this.modelo_ahorro = modelo_ahorro; }

  public int  getId_modelo_ahorro() { return id_modelo_ahorro; }
  public void setId_modelo_ahorro(int id_modelo_ahorro) { this.id_modelo_ahorro = id_modelo_ahorro; }
  
  public String getMateria() {return materia; }
  public void setMateria(String materia) {this.materia = materia; }
  
  public String getGrupo() {return grupo;}
  public void setGrupo(String grupo) {this.grupo = grupo;}
  
  public int getId_grupo() { return id_grupo;}
  public void setId_grupo(int id_grupo) { this.id_grupo = id_grupo;}

  public int getId_materia() {return id_materia; }
  public void setId_materia(int id_materia) {this.id_materia = id_materia; } 
  
  public int getId_postulante() { return id_postulante; }
  public void setId_postulante(int id_postulante) {this.id_postulante = id_postulante;} 
  
  public Date getFec_final() { return fec_final; }
  public void setFec_final(Date fec_final) { this.fec_final = fec_final; }
  
  public String getTipo_programacion() { return tipo_programacion; }
  public void setTipo_programacion(String tipo_programacion) { this.tipo_programacion = tipo_programacion; }
  
  public int getId_mencion() { return id_mencion; }
  public void setId_mencion(int id_mencion) { this.id_mencion = id_mencion; }

  public String getMencion() { return mencion; }
  public void setMencion(String mencion) { this.mencion = mencion; } 
  
  public int getNivel_academico() { return nivel_academico; }
  public void setNivel_academico(int nivel_academico) { this.nivel_academico = nivel_academico; }

  //programaion como estudiante
  public String getMaterias() {return materias; }
  public void setMaterias(String materias) {this.materias = materias; }
   
  public int getId_detalle() { return id_detalle; }
  public void setId_detalle(int id_detalle) { this.id_detalle = id_detalle; }
  
  public String getNombres() { return nombres; }
  public void setNombres(String nombres) { this.nombres = nombres; } 
  
  public int getId_programacion() { return id_programacion; }
  public void setId_programacion(int id_programacion) { this.id_programacion = id_programacion; }
  
  public int getId_rol() { return id_rol; }
  public void setId_rol(int id_rol) { this.id_rol = id_rol; }
  
  public String getTipo_admision() {return tipo_admision; }
  public void setTipo_admision(String tipo_admision) {this.tipo_admision = tipo_admision; }
  
  //estadistica
  public int getId_tipo_grado() { return id_tipo_grado; }
  public void setId_tipo_grado(int id_tipo_grado) { this.id_tipo_grado = id_tipo_grado; }
  
  public String getTipo_grado() {return tipo_grado; }
  public void setTipo_grado(String tipo_grado) {this.tipo_grado = tipo_grado; }
  
  public String getPlan() {return plan; }
  public void setPlan(String plan) {this.plan = plan; }  
  
  public int getId_tipo_evaluacion() { return id_tipo_evaluacion; }
  public void setId_tipo_evaluacion(int id_tipo_evaluacion) { this.id_tipo_evaluacion = id_tipo_evaluacion; }
  
  public String getTipo_evaluacion() {return tipo_evaluacion; }
  public void setTipo_evaluacion(String tipo_evaluacion) {this.tipo_evaluacion = tipo_evaluacion; }  
  
   
    public int getNota_minima() {
        return nota_minima;
    }

    public void setNota_minima(int nota_minima) {
        this.nota_minima = nota_minima;
    }
}