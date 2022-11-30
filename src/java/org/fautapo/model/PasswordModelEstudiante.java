/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import lombok.Getter;
import lombok.Setter;
import org.fautapo.validation.VerificarClave;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
public class PasswordModelEstudiante {

    private Integer id_estudiante;
    @NotBlank(message = "Debe Introducir su Contraseña")
    @VerificarClave(message = "Contraseña Incorrecta")
    private String clave;
}
