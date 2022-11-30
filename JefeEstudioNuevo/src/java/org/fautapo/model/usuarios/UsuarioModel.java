/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model.usuarios;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.fautapo.validation.FieldMatch;
import org.fautapo.validation.usuario.ExisteUsuario;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
@ExisteUsuario(primero = "id_persona", segundo = "apodo", tercero = "tipo", cuarto = "tipoEncriptacion")
@FieldMatch(first = "confirmar_clave", second = "clave", message = "Los campos de la contraseña deben coincidir")
public class UsuarioModel {

    private String tipoEncriptacion;
    private Integer id_usuario;
    @NotNull(message = "Debe seleecionar la persona")
    private Integer id_persona;
    private String nombre_completo;
    private String tipo;
    @NotBlank(message = "Debe introducir el usuario o correo")
    private String apodo;
    @Size(min = 6, max = 30, message = "la longitud de la contraseña debe ser de 8 y 30 caracteres")
    @NotBlank(message = "Debe introducir la contraseña")
    private String clave;
    @Size(min = 6, max = 30, message = "la longitud de la contraseña debe ser de 8 y 30 caracteres")
    @NotBlank(message = "Debe introducir la contraseña")
    private String confirmar_clave;
    @NotBlank(message = "Debe introducir el recordatorio de la contraseña")
    private String recordatorio;
    private String id_estado;
    private Integer ult_usuario;
}
