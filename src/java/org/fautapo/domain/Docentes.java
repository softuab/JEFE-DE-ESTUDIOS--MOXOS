package org.fautapo.domain;

//import org.fautapo.domain.Personas;
/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-10
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-10
 */
import java.io.Serializable;
import java.util.Date;

public class Docentes extends Usuarios {
// extends Personas {

    /* Private Fields */
    private int id_docente;
    private String nombre_completo;
    private String categoria;
    private String dip;
    private String paterno;
    private String materno;
    private String nombres;
    private String fec_nacimiento;
    private String direccion;
    private String telefono;
    private String correo;
    private String tipo_sanguineo;
    private String estado_civil;
    private int id_tipo_asignacion;
    private String tipo_asignacion;
    private int id_tipo_docente;
    private String tipo_docente;
    private int id_tipo_evaluacion;
    private String tipo_evaluacion;

    //Para las funciones administrativas
    private int id_funcion;
    private String descripcion;

    //Adicionado por la UAP
    private int id_departamento;
    private int gestion;
    private int periodo;
    private int id_grupo;
    private String materia;

    private int id_doc_adjunto;
    private String nombre_archivo;
    private String adjunto;

    
   private int id_notificacion;
   private String contenido;
   private String url;
   private Date fecha_publicacion;
   private Date fecha_limite_publicacion;
   private String departamento;
    /* JavaBeans Properties */

    public int getId_notificacion() {
        return id_notificacion;
    }

    public void setId_notificacion(int id_notificacion) {
        this.id_notificacion = id_notificacion;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getFecha_publicacion() {
        return fecha_publicacion;
    }

    public void setFecha_publicacion(Date fecha_publicacion) {
        this.fecha_publicacion = fecha_publicacion;
    }

    public Date getFecha_limite_publicacion() {
        return fecha_limite_publicacion;
    }

    public void setFecha_limite_publicacion(Date fecha_limite_publicacion) {
        this.fecha_limite_publicacion = fecha_limite_publicacion;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento;
    }
 

    public int getId_docente() {
        return id_docente;
    }

    public void setId_docente(int id_docente) {
        this.id_docente = id_docente;
    }

    public String getNombre_completo() {
        return nombre_completo;
    }

    public void setNombre_completo(String nombre_completo) {
        this.nombre_completo = nombre_completo;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
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

    public String getFec_nacimiento() {
        return fec_nacimiento;
    }

    public void setFec_nacimiento(String fec_nacimiento) {
        this.fec_nacimiento = fec_nacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTipo_sanguineo() {
        return tipo_sanguineo;
    }

    public void setTipo_sanguineo(String tipo_sanguineo) {
        this.tipo_sanguineo = tipo_sanguineo;
    }

    public String getEstado_civil() {
        return estado_civil;
    }

    public void setEstado_civil(String estado_civil) {
        this.estado_civil = estado_civil;
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

    public int getId_funcion() {
        return id_funcion;
    }

    public void setId_funcion(int id_funcion) {
        this.id_funcion = id_funcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

//ADICIONADO POR LA UAP  
    public int getId_departamento() {
        return this.id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public int getGestion() {
        return this.gestion;
    }

    public void setGestion(int gestion) {
        this.gestion = gestion;
    }

    public int getPeriodo() {
        return this.periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public int getId_grupo() {
        return this.id_grupo;
    }

    public void setId_grupo(int id_grupo) {
        this.id_grupo = id_grupo;
    }

    public String getMateria() {
        return this.materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public int getId_doc_adjunto() {
        return id_doc_adjunto;
    }

    public void setId_doc_adjunto(int id_est_adjunto) {
        this.id_doc_adjunto = id_est_adjunto;
    }

    public String getNombre_archivo() {
        return nombre_archivo;
    }

    public void setNombre_archivo(String nombre_archivo) {
        this.nombre_archivo = nombre_archivo;
    }

    public String getAdjunto() {
        return adjunto;
    }

    public void setAdjunto(String adjunto) {
        this.adjunto = adjunto;
    }

}
