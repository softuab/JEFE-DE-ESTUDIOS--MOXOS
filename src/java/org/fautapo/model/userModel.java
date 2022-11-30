/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.fautapo.Validacion.ExisteCorreo;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Getter
@Setter
public class userModel {

    @NotNull(message = "El correo de postulante es obligatorio")
    @NotEmpty(message = "El correo del postulante es obligatorio")
    @Email(message = "Debe ser un correo electronico valido")
    @ExisteCorreo
    private String username;
    private String captcha;

}
