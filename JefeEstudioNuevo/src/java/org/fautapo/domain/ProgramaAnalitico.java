/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;

import java.util.Date;

/**
 *
 * @author DBMENESESJ
 */
public class ProgramaAnalitico {

    private int id_persona;
    private String dip;
    private String nombres;
    private String paterno;
    private String materno;
    private String celular;
    private String correo;
    private int id_docente;
    private String categoria;
    private String facultad;
    private String departamento;
    private int gestion;
    private int periodo;
    private String area;
    private String tipo_materia;
    private int id_materia;
    private String sigla;
    private String materia;
    private int hrs_teoricas;
    private int hrs_practicas;
    private int hrs_periodo;
    private double creditos;
    private int id_asignacion;
    private String id_plan;
    private int id_grupo;
    private int nivel_academico;
    private String id_estado;
    private String nro_resolucion;
    private String observacion;
    private int id_dct_programa_analitico;
    private String marco_referencial;
    private String justificacion;
    private String propositos;
    private String objetivo_desarrollador;
    private String objetivo_educativo;
    private String metodos_estrategias;
    private String recursos;
    private String sistema_evaluacion;
    private Date fec_registro;
    private Date fec_modificacion;
    private int ult_usuario;
    private int id_mencion;
    private String titulo;
    private int id_tipo_materia;

    public int getId_tipo_materia() {
        return id_tipo_materia;
    }

    public void setId_tipo_materia(int id_tipo_materia) {
        this.id_tipo_materia = id_tipo_materia;
    }
    

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    
    
    
    

    public int getId_mencion() {
        return id_mencion;
    }

    public void setId_mencion(int id_mencion) {
        this.id_mencion = id_mencion;
    }
    

    public int getId_dct_programa_analitico() {
        return id_dct_programa_analitico;
    }

    public void setId_dct_programa_analitico(int id_dct_programa_analitico) {
        this.id_dct_programa_analitico = id_dct_programa_analitico;
    }

    public String getMarco_referencial() {
        return marco_referencial;
    }

    public void setMarco_referencial(String marco_referencial) {
        this.marco_referencial = marco_referencial;
    }

    public String getJustificacion() {
        return justificacion;
    }

    public void setJustificacion(String justificacion) {
        this.justificacion = justificacion;
    }

    public String getPropositos() {
        return propositos;
    }

    public void setPropositos(String propositos) {
        this.propositos = propositos;
    }

    public String getObjetivo_desarrollador() {
        return objetivo_desarrollador;
    }

    public void setObjetivo_desarrollador(String objetivo_desarrollador) {
        this.objetivo_desarrollador = objetivo_desarrollador;
    }

    public String getObjetivo_educativo() {
        return objetivo_educativo;
    }

    public void setObjetivo_educativo(String objetivo_educativo) {
        this.objetivo_educativo = objetivo_educativo;
    }

    public String getMetodos_estrategias() {
        return metodos_estrategias;
    }

    public void setMetodos_estrategias(String metodos_estrategias) {
        this.metodos_estrategias = metodos_estrategias;
    }

    public String getRecursos() {
        return recursos;
    }

    public void setRecursos(String recursos) {
        this.recursos = recursos;
    }

    public String getSistema_evaluacion() {
        return sistema_evaluacion;
    }

    public void setSistema_evaluacion(String sistema_evaluacion) {
        this.sistema_evaluacion = sistema_evaluacion;
    }

    public Date getFec_registro() {
        return fec_registro;
    }

    public void setFec_registro(Date fec_registro) {
        this.fec_registro = fec_registro;
    }

    public Date getFec_modificacion() {
        return fec_modificacion;
    }

    public void setFec_modificacion(Date fec_modificacion) {
        this.fec_modificacion = fec_modificacion;
    }

    public int getUlt_usuario() {
        return ult_usuario;
    }

    public void setUlt_usuario(int ult_usuario) {
        this.ult_usuario = ult_usuario;
    }

    
    
    public String getNro_resolucion() {
        return nro_resolucion;
    }

    public void setNro_resolucion(String nro_resolucion) {
        this.nro_resolucion = nro_resolucion;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public String getId_estado() {
        return id_estado;
    }

    public void setId_estado(String id_estado) {
        this.id_estado = id_estado;
    }

    public int getNivel_academico() {
        return nivel_academico;
    }

    public void setNivel_academico(int nivel_academico) {
        this.nivel_academico = nivel_academico;
    }

    public String getId_plan() {
        return id_plan;
    }

    public void setId_plan(String id_plan) {
        this.id_plan = id_plan;
    }

    public int getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    public ProgramaAnalitico() {
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public int getGestion() {
        return gestion;
    }

    public void setGestion(int gestion) {
        this.gestion = gestion;
    }

    public int getPeriodo() {
        return periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getTipo_materia() {
        return tipo_materia;
    }

    public void setTipo_materia(String tipo_materia) {
        this.tipo_materia = tipo_materia;
    }

    public int getId_asignacion() {
        return id_asignacion;
    }

    public void setId_asignacion(int id_asignacion) {
        this.id_asignacion = id_asignacion;
    }

    public int getId_persona() {
        return id_persona;
    }

    public void setId_persona(int id_persona) {
        this.id_persona = id_persona;
    }

    public String getDip() {
        return dip;
    }

    public void setDip(String dip) {
        this.dip = dip;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
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

    public int getId_docente() {
        return id_docente;
    }

    public void setId_docente(int id_docente) {
        this.id_docente = id_docente;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getFacultad() {
        return facultad;
    }

    public void setFacultad(String facultad) {
        this.facultad = facultad;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }

    public int getId_materia() {
        return id_materia;
    }

    public void setId_materia(int id_materia) {
        this.id_materia = id_materia;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public int getHrs_teoricas() {
        return hrs_teoricas;
    }

    public void setHrs_teoricas(int hrs_teoricas) {
        this.hrs_teoricas = hrs_teoricas;
    }

    public int getHrs_practicas() {
        return hrs_practicas;
    }

    public void setHrs_practicas(int hrs_practicas) {
        this.hrs_practicas = hrs_practicas;
    }

    public int getHrs_periodo() {
        return hrs_periodo;
    }

    public void setHrs_periodo(int hrs_periodo) {
        this.hrs_periodo = hrs_periodo;
    }

    public double getCreditos() {
        return creditos;
    }

    public void setCreditos(double creditos) {
        this.creditos = creditos;
    }

}
