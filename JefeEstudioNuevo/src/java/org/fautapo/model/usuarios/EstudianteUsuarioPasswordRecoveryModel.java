/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model.usuarios;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.fautapo.validation.FieldMatch;
import org.fautapo.validation.usuario.ExisteUsuarioPasswordRecovery;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
@ExisteUsuarioPasswordRecovery(segundo = "correo", tercero = "tipoUsuario", cuarto = "tipoEncriptacion", quinto = "confirmar_correo")
@FieldMatch(first = "confirmar_clave", second = "clave", message = "Los campos de la contraseña deben coincidir")
public class EstudianteUsuarioPasswordRecoveryModel {

    private String tipoEncriptacion;
    private Integer id_usuario_estudiante;
    @NotNull(message = "Debe seleecionar la persona")
    private Integer id_persona;
    private String nombre_completo;
    @NotBlank(message = "Debe introducir  el numero de celular")
    @Pattern(regexp = "[0-9]+", message = "Debe introducir solo numeros de celular")
    private String celular;
    private String tipoUsuario;
    private String correo;
    @NotBlank(message = "Debe introducir el correo para confirmar")
    @Pattern(regexp = "^[A-Za-z0-9+_.-]+@(.+)$", message = "Debe introducir formato correcto del correo")
    private String confirmar_correo;
    @Size(min = 6, max = 30, message = "la longitud de la contraseña debe ser de 8 y 30 caracteres")
    @NotBlank(message = "Debe introducir la contraseña")
    private String clave;
    @Size(min = 6, max = 30, message = "la longitud de la contraseña debe ser de 8 y 30 caracteres")
    @NotBlank(message = "Debe introducir la contraseña")
    private String confirmar_clave;
    private String observacion;
    private String id_estado;
    private Integer ult_usuario;
    private Integer id_rol;
}
