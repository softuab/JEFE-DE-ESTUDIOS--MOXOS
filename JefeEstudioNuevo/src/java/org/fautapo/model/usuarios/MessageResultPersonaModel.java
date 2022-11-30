/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.model.usuarios;

import java.util.List;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageResultPersonaModel {

    private String status;
    private String message;
    private List<PersonaItem> items;
}
