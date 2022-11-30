/*
 * To change this license header; choose License Headers in Project Properties.
 * To change this template file; choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.domain;
 
import java.util.Date;

/**
 *
 * @author FNZABALETAA
 */
public class CursosMoodle {

    private long id_cursos_moodle;
    private int id_moodle;
    private String moodle_username;
    private String moodle_password;
    private String moodle_passwordbase64;
    private String moodle_correo;
    private String moodle_nombres_usuario;
    private String moodle_apellidos_usuario;
    private String moodle_detallecurso;
    private String id_moodle_cursos;
    private int id_rol_cursos_moodle;
    private int id_persona_moxos;
    private int id_programa;
    private int gestion;
    private int periodo;
    private int id_usuario_moxos_ru_doc;
    private int tipo_usuario;
    private int id_grupo;
    private int id_materia;
    private String id_estado;
    private Date fecha_registro;
    private Date fecha_modificacion;
    private int id_rol;
    private int ult_usuario;
    private Boolean matricular;

    private String materias;
    private String grupo;
    private String facultad;
    private String programa;
    private String sigla;
    private String nombres;
    private String dip;
    private String oferta;
    private Integer id_tipo_evaluacion;
    
    private Integer cantidad;

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }
    

    public Integer getId_tipo_evaluacion() {
        return id_tipo_evaluacion;
    }

    public void setId_tipo_evaluacion(Integer id_tipo_evaluacion) {
        this.id_tipo_evaluacion = id_tipo_evaluacion;
    }
    

    public String getOferta() {
        return oferta;
    }

    public void setOferta(String oferta) {
        this.oferta = oferta;
    }

    public String getSigla() {
        return sigla;
    }

    public void setSigla(String sigla) {
        this.sigla = sigla;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getDip() {
        return dip;
    }

    public void setDip(String dip) {
        this.dip = dip;
    }

    public Boolean getMatricular() {
        return matricular;
    }

    public void setMatricular(Boolean matricular) {
        this.matricular = matricular;
    }

    public long getId_cursos_moodle() {
        return id_cursos_moodle;
    }

    public void setId_cursos_moodle(long id_cursos_moodle) {
        this.id_cursos_moodle = id_cursos_moodle;
    }

    public int getId_moodle() {
        return id_moodle;
    }

    public void setId_moodle(int id_moodle) {
        this.id_moodle = id_moodle;
    }

    public String getMoodle_username() {
        return moodle_username;
    }

    public void setMoodle_username(String moodle_username) {
        this.moodle_username = moodle_username;
    }

    public String getMoodle_password() {
        return moodle_password;
    }
  
    public void setMoodle_password(String moodle_password) {
        this.moodle_password = moodle_password;
    }

    public String getMoodle_correo() {
        return moodle_correo;
    }

    public void setMoodle_correo(String moodle_correo) {
        this.moodle_correo = moodle_correo;
    }

    public String getMoodle_nombres_usuario() {
        return moodle_nombres_usuario;
    }

    public void setMoodle_nombres_usuario(String moodle_nombres_usuario) {
        this.moodle_nombres_usuario = moodle_nombres_usuario;
    }

    public String getMoodle_apellidos_usuario() {
        return moodle_apellidos_usuario;
    }

    public void setMoodle_apellidos_usuario(String moodle_apellidos_usuario) {
        this.moodle_apellidos_usuario = moodle_apellidos_usuario;
    }

    public String getMoodle_detallecurso() {
        return moodle_detallecurso;
    }

    public void setMoodle_detallecurso(String moodle_detallecurso) {
        this.moodle_detallecurso = moodle_detallecurso;
    }

    public String getId_moodle_cursos() {
        return id_moodle_cursos;
    }

    public void setId_moodle_cursos(String id_moodle_cursos) {
        this.id_moodle_cursos = id_moodle_cursos;
    }

    public int getId_rol_cursos_moodle() {
        return id_rol_cursos_moodle;
    }

    public void setId_rol_cursos_moodle(int id_rol_cursos_moodle) {
        this.id_rol_cursos_moodle = id_rol_cursos_moodle;
    }

    public int getId_persona_moxos() {
        return id_persona_moxos;
    }

    public void setId_persona_moxos(int id_persona_moxos) {
        this.id_persona_moxos = id_persona_moxos;
    }

    public int getId_programa() {
        return id_programa;
    }

    public void setId_programa(int id_programa) {
        this.id_programa = id_programa;
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

    public int getId_usuario_moxos_ru_doc() {
        return id_usuario_moxos_ru_doc;
    }

    public void setId_usuario_moxos_ru_doc(int id_usuario_moxos_ru_doc) {
        this.id_usuario_moxos_ru_doc = id_usuario_moxos_ru_doc;
    }

    public int getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(int tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }

    public int getId_grupo() {
        return id_grupo;
    }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    public int getId_materia() {
        return id_materia;
    }

    public void setId_materia(int id_materia) {
        this.id_materia = id_materia;
    }

    public String getId_estado() {
        return id_estado;
    }

    public void setId_estado(String id_estado) {
        this.id_estado = id_estado;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public Date getFecha_modificacion() {
        return fecha_modificacion;
    }

    public void setFecha_modificacion(Date fecha_modificacion) {
        this.fecha_modificacion = fecha_modificacion;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public int getUlt_usuario() {
        return ult_usuario;
    }

    public void setUlt_usuario(int ult_usuario) {
        this.ult_usuario = ult_usuario;
    }

    public String getMaterias() {
        return materias;
    }

    public void setMaterias(String materias) {
        this.materias = materias;
    }

    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    public String getFacultad() {
        return facultad;
    }

    public void setFacultad(String facultad) {
        this.facultad = facultad;
    }

    public String getPrograma() {
        return programa;
    }

    public void setPrograma(String programa) {
        this.programa = programa;
    }

    public String getMoodle_passwordbase64() {
        return moodle_passwordbase64;
    }

    public void setMoodle_passwordbase64(String moodle_passwordbase64) {
        this.moodle_passwordbase64 = moodle_passwordbase64;
    }

}
