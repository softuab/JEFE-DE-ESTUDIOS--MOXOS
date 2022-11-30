/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.validation;


import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.fautapo.domain.logic.MiFacade;

/**
 *
 * @author FNZABALETAA
 */
public class ExisteUsuarioConstraintValidator implements ConstraintValidator<ExisteUsuario, String> {

    @Autowired
    private MiFacade mi;

    public void setMi(MiFacade mi) {
        this.mi = mi;
    }
    private Boolean isOptional;

    @Override
    public boolean isValid(String t, ConstraintValidatorContext cvc) {
        return mi.ExisteUsuario(t);
    }

    @Override
    public void initialize(ExisteUsuario a) {
        this.isOptional = a.optional();
    }

}
