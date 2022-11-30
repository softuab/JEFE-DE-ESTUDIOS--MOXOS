/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model;

import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.fautapo.validation.ValidToken;
import org.hibernate.validator.constraints.NotEmpty;

@Getter
@Setter

@ValidToken(first = "id_usr_adm", second = "token", message = "El token es invalido o expiro el tiempo limite del token")
public class TokenRecovery {

    private String nombre_completo;
    private Integer id_usr_adm;
    @NotNull(message = "El token es obligatorio")
    @NotEmpty(message = "El token es obligatorio")
    private String token;
}
