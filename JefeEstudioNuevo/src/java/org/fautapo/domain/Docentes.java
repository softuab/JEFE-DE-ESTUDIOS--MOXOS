package org.fautapo.domain;

//import org.fautapo.domain.Personas;
/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-10
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-10
 */
import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
    private String nombreUsuario;
    private Integer nro_pagina;
}
