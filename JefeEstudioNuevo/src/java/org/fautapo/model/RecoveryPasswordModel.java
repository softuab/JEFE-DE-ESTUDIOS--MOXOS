/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.fautapo.validation.ExisteUsuario;
import org.fautapo.validation.VerificarCapchat;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Getter
@Setter
public class RecoveryPasswordModel {

    @NotNull(message = "El correo es obligatorio")
    @NotEmpty(message = "El correo es obligatorio")
    @Email(message = "Debe ser un correo electronico valido")
    @ExisteUsuario
    private String correo;
    @NotNull(message = "El codigo capchat es obligatorio")
    @NotEmpty(message = "El codigo capchat es obligatorio")
    @VerificarCapchat
    private String capchat;

}