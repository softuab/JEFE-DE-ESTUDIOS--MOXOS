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
public class CertificadoNotalModel {

    private Integer gestion;
    private Integer periodo;
    @NotBlank(message = "Debe Introducir su Contraseña")
    @VerificarClave(message = "Contraseña Incorrecta")
    private String clave;
    @NotBlank(message = "Debe Introducir el numero de certificado")
    private String nrocertificado;
    private String observacion;
    private String todas;
}
