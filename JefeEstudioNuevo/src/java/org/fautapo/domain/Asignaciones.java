package org.fautapo.domain;

import java.util.Date;
import java.util.List;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-07
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-07
 */
public class Asignaciones extends Grupos {

    /* Private Fields */
    private int id_asignacion;
    private int id_docente;
    private String nombre_completo;
    private int id_modelo_ahorro;
    private String modelo_ahorro;
    private int id_programa;
    private int id_materia;
    private String materia;
    private String sigla;
    private int nivel_academico;
    private int id_grupo;
    private String grupo;
    private int id_fase;
    private String fase;
    private String programa;
    private double nota_aprobacion;
    private int ponderacion_modelo;
    private int ponderacion_materia;
    private int hrs_teoricas;
    private int hrs_practicas;
//  private float  creditos;   
    private int id_tipo_materia;
    private int id_departamento;
    private String descripcion;
    private int cantidad;
    private int ponderacion;
    private int id_tipo_nota;
    private String tipo_nota;
    private int gestion;
    private int periodo;
    private String nombres;
    private Date fec_registro;
    private int ult_usuario;
    private int id_modelo_fase;
    private int padre;
    private int id_evaluacion;
    private List materia_ahorro;
    private int id_tipo_grado;
    private String tipo_grado;
    private int id_tipo_docente;
    private String tipo_docente;
    private int id_tipo_asignacion;
    private String tipo_asignacion;
    private int id_tipo_evaluacion;
    private String tipo_evaluacion;
    private String observacion;
    private Date fec_inicio;
    private Date fec_fin;
    private Date fec_resolucion;
    private int resolucion;
    private String dip;
    private int id_mencion;
    private String mencion;
    private String paterno;
    private String materno;
    private int id_persona;
    private Date fec_inicio2;
    private Date fec_fin2;
    private List materias;
    private int total_horas;
    private int count;
    private String carga_horaria;
    private String id_plan;
    private int permitir;
    private Integer pagina;
    private Integer nro_pagina;
    private String accion;
    private String nro_resolucionhcc;
    private String nro_resolucionhcf;
    private String nro_resolucionhcu;
    private int id_fase_resolucion;
    private int nro_memo;
    private Date fecha;

    public String getNombre_completo() {
        return nombre_completo;
    }

    public void setNombre_completo(String nombre_completo) {
        this.nombre_completo = nombre_completo;
    }

    public Integer getPagina() {
        return pagina;
    }

    public void setPagina(Integer pagina) {
        this.pagina = pagina;
    }

    public Integer getNro_pagina() {
        return nro_pagina;
    }

    public void setNro_pagina(Integer nro_pagina) {
        this.nro_pagina = nro_pagina;
    }

    public String getAccion() {
        return accion;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }

    private int nro_designacion;

    public Date getFec_resolucion() {
        return fec_resolucion;
    }

    public void setFec_resolucion(Date fec_resolucion) {
        this.fec_resolucion = fec_resolucion;
    }

    public int getPermitir() {
        return permitir;
    }

    public void setPermitir(int permitir) {
        this.permitir = permitir;
    }

    public int getNro_designacion() {
        return this.nro_designacion;
    }

    public void setNro_designacion(int nro_designacion) {
        this.nro_designacion = nro_designacion;
    }

    /* JavaBeans Properties */
    public String getId_plan() {
        return id_plan;
    }

    public void setId_plan(String id_plan) {
        this.id_plan = id_plan;
    }

    public int getCount() {
        return this.count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    //ESTO FUE AGREGADO PARA LA designacion de docentes

    public int getNro_memo() {
        return this.nro_memo;
    }

    public void setNro_memo(int nro_memo) {
        this.nro_memo = nro_memo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getNro_resolucionhcc() {
        return this.nro_resolucionhcc;
    }

    public void setNro_resolucionhcc(String nro_resolucionhcc) {
        this.nro_resolucionhcc = nro_resolucionhcc;
    }

    public String getNro_resolucionhcf() {
        return this.nro_resolucionhcf;
    }

    public void setNro_resolucionhcf(String nro_resolucionhcf) {
        this.nro_resolucionhcf = nro_resolucionhcf;
    }

    public String getNro_resolucionhcu() {
        return this.nro_resolucionhcu;
    }

    public void setNro_resolucionhcu(String nro_resolucionhcu) {
        this.nro_resolucionhcu = nro_resolucionhcu;
    }

    public int getId_fase_resolucion() {
        return this.id_fase_resolucion;
    }

    public void setId_fase_resolucion(int id_fase_resolucion) {
        this.id_fase_resolucion = id_fase_resolucion;
    }

    public int getId_asignacion() {
        return this.id_asignacion;
    }

    public void setId_asignacion(int id_asignacion) {
        this.id_asignacion = id_asignacion;
    }

    public int getId_docente() {
        return this.id_docente;
    }

    public void setId_docente(int id_docente) {
        this.id_docente = id_docente;
    }

    public int getId_modelo_ahorro() {
        return this.id_modelo_ahorro;
    }

    public void setId_modelo_ahorro(int id_modelo_ahorro) {
        this.id_modelo_ahorro = id_modelo_ahorro;
    }

    public String getModelo_ahorro() {
        return this.modelo_ahorro;
    }

    public void setModelo_ahorro(String modelo_ahorro) {
        this.modelo_ahorro = modelo_ahorro;
    }

    public int getId_programa() {
        return this.id_programa;
    }

    public void setId_programa(int id_programa) {
        this.id_programa = id_programa;
    }

    public String getPrograma() {
        return this.programa;
    }

    public void setPrograma(String programa) {
        this.programa = programa;
    }

    public int getId_materia() {
        return this.id_materia;
    }

    public void setId_materia(int id_materia) {
        this.id_materia = id_materia;
    }

    public String getMateria() {
        return this.materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String getSigla() {
        return this.sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public int getNivel_academico() {
        return this.nivel_academico;
    }

    public void setNivel_academico(int nivel_academico) {
        this.nivel_academico = nivel_academico;
    }

    public int getId_grupo() {
        return this.id_grupo;
    }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    public String getGrupo() {
        return this.grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public int getId_fase() {
        return this.id_fase;
    }

    public void setId_fase(int id_fase) {
        this.id_fase = id_fase;
    }

    public String getFase() {
        return this.fase;
    }

    public void setFase(String fase) {
        this.fase = fase;
    }

    public int getId_tipo_evaluacion() {
        return this.id_tipo_evaluacion;
    }

    public void setId_tipo_evaluacion(int id_tipo_evaluacion) {
        this.id_tipo_evaluacion = id_tipo_evaluacion;
    }

    public String getTipo_evaluacion() {
        return this.tipo_evaluacion;
    }

    public void setTipo_evaluacion(String tipo_evaluacion) {
        this.tipo_evaluacion = tipo_evaluacion;
    }

    public double getNota_aprobacion() {
        return this.nota_aprobacion;
    }

    public void setNota_aprobacion(double nota_aprobacion) {
        this.nota_aprobacion = nota_aprobacion;
    }

    public int getPonderacion_modelo() {
        return this.ponderacion_modelo;
    }

    public void setPonderacion_modelo(int ponderacion_modelo) {
        this.ponderacion_modelo = ponderacion_modelo;
    }

    public int getPonderacion_materia() {
        return this.ponderacion_materia;
    }

    public void setPonderacion_materia(int ponderacion_materia) {
        this.ponderacion_materia = ponderacion_materia;
    }

    public int getHrs_teoricas() {
        return this.hrs_teoricas;
    }

    public void setHrs_teoricas(int hrs_teoricas) {
        this.hrs_teoricas = hrs_teoricas;
    }

    public int getHrs_practicas() {
        return this.hrs_practicas;
    }

    public void setHrs_practicas(int hrs_practicas) {
        this.hrs_practicas = hrs_practicas;
    }

//  public float getCreditos() { return this.creditos; }
//  public void setCreditos(float creditos) { this.creditos = creditos; }  
    public int getId_tipo_materia() {
        return this.id_tipo_materia;
    }

    public void setId_tipo_materia(int id_tipo_materia) {
        this.id_tipo_materia = id_tipo_materia;
    }

    public int getId_departamento() {
        return this.id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public String getDescripcion() {
        return this.descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return this.cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPonderacion() {
        return this.ponderacion;
    }

    public void setPonderacion(int ponderacion) {
        this.ponderacion = ponderacion;
    }

    public int getId_tipo_nota() {
        return this.id_tipo_nota;
    }

    public void setId_tipo_nota(int id_tipo_nota) {
        this.id_tipo_nota = id_tipo_nota;
    }

    public String getTipo_nota() {
        return this.tipo_nota;
    }

    public void setTipo_nota(String tipo_nota) {
        this.tipo_nota = tipo_nota;
    }

    public int getPeriodo() {
        return this.periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public int getGestion() {
        return this.gestion;
    }

    public void setGestion(int gestion) {
        this.gestion = gestion;
    }

    public String getNombres() {
        return this.nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public Date getFec_registro() {
        return this.fec_registro;
    }

    public void setFec_registro(Date fec_registro) {
        this.fec_registro = fec_registro;
    }

    public int getUlt_usuario() {
        return this.ult_usuario;
    }

    public void setUlt_usuario(int ult_usuario) {
        this.ult_usuario = ult_usuario;
    }

    public int getId_modelo_fase() {
        return this.id_modelo_fase;
    }

    public void setId_modelo_fase(int id_modelo_fase) {
        this.id_modelo_fase = id_modelo_fase;
    }

    public int getPadre() {
        return this.padre;
    }

    public void setPadre(int padre) {
        this.padre = padre;
    }

    public int getId_evaluacion() {
        return this.id_evaluacion;
    }

    public void setId_evaluacion(int id_evaluacion) {
        this.id_evaluacion = id_evaluacion;
    }

    public List getMateria_ahorro() {
        return materia_ahorro;
    }

    public void setMateria_ahorro(List materia_ahorro) {
        this.materia_ahorro = materia_ahorro;
    }

    public int getId_tipo_grado() {
        return this.id_tipo_grado;
    }

    public void setId_tipo_grado(int id_tipo_grado) {
        this.id_tipo_grado = id_tipo_grado;
    }

    public String getTipo_grado() {
        return this.tipo_grado;
    }

    public void setTipo_grado(String tipo_grado) {
        this.tipo_grado = tipo_grado;
    }

    public int getId_tipo_asignacion() {
        return id_tipo_asignacion;
    }

    public void setId_tipo_asignacion(int id_tipo_asignacion) {
        this.id_tipo_asignacion = id_tipo_asignacion;
    }

    public String getTipo_asignacion() {
        return tipo_asignacion;
    }

    public void setTipo_asignacion(String tipo_asignacion) {
        this.tipo_asignacion = tipo_asignacion;
    }

    public int getId_tipo_docente() {
        return id_tipo_docente;
    }

    public void setId_tipo_docente(int id_tipo_docente) {
        this.id_tipo_docente = id_tipo_docente;
    }

    public String getTipo_docente() {
        return tipo_docente;
    }

    public void setTipo_docente(String tipo_docente) {
        this.tipo_docente = tipo_docente;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public Date getFec_inicio() {
        return fec_inicio;
    }

    public void setFec_inicio(Date fec_inicio) {
        this.fec_inicio = fec_inicio;
    }

    public Date getFec_fin() {
        return fec_fin;
    }

    public void setFec_fin(Date fec_fin) {
        this.fec_fin = fec_fin;
    }

    //public String getFec_resolucion() { return fec_resolucion; }
    //public void setFec_resolucion(String fec_resolucion) { this.fec_resolucion = fec_resolucion; }
    public int getResolucion() {
        return resolucion;
    }

    public void setResolucion(int resolucion) {
        this.resolucion = resolucion;
    }

    public String getDip() {
        return dip;
    }

    public void setDip(String dip) {
        this.dip = dip;
    }

    public int getId_mencion() {
        return id_mencion;
    }

    public void setId_mencion(int id_mencion) {
        this.id_mencion = id_mencion;
    }

    public String getMencion() {
        return mencion;
    }

    public void setMencion(String mencion) {
        this.mencion = mencion;
    }

    public String getPaterno() {
        return paterno;
    }

    public void setPaterno(String paterno) {
        this.paterno = paterno;
    }

    public String getMaterno() {
        return materno;
    }

    public void setMaterno(String materno) {
        this.materno = materno;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public Date getFec_inicio2() {
        return fec_inicio2;
    }

    public void setFec_inicio2(Date fec_inicio2) {
        this.fec_inicio2 = fec_inicio2;
    }

    public Date getFec_fin2() {
        return fec_fin2;
    }

    public void setFec_fin2(Date fec_fin2) {
        this.fec_fin2 = fec_fin2;
    }

    public List getMaterias() {
        return materias;
    }

    public void setMaterias(List materias) {
        this.materias = materias;
    }

    public int getTotal_horas() {
        return this.total_horas;
    }

    public void setTotal_horas(int total_horas) {
        this.total_horas = total_horas;
    }

    /*public Object getId_asignacion() {
    return id_asignacion; 
  }
  public void setId_asignacion(Object id_asignacion) { 
    this.id_asignacion = id_asignacion; 
  }*/
//ADICIONADO POR LA UAP
    public String getCarga_horaria() {
        return carga_horaria;
    }

    public void setCarga_horaria(String carga_horaria) {
        this.carga_horaria = carga_horaria;
    }

}
