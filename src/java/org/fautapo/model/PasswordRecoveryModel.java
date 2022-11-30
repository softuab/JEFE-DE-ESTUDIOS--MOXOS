/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import javax.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.NotBlank;

@Getter
@Setter
public class PasswordRecoveryModel {

    private Integer id_usr_adm;
    private Integer id_usuario;
    @NotBlank(message = "La clave es obligatorio")
    @Size(min = 7, max = 30)
    private String nueva_clave;
    @NotBlank(message = "La clave de confirmacion es obligatorio")
    @Size(min = 7, max = 30)
    private String conf_nueva_clave;
}
