package org.fautapo.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Usuarios extends Clientes { // extends Personas {

    /* Private Fields */
    private int id_persona;  // TEMPORAL
    private String apodo;
    private String clave;
    private String recordatorio;
    private String captchap;

    private int id_usuario;
    private int id_ubicacion_organica;
    private String ubicacion_organica;
    private int id_proceso;
    private int pagina;
    private String apodo_normal;
    private String clave_normal;
    private String nombre_completo;
    private String dip;
    private String direccion;

}
