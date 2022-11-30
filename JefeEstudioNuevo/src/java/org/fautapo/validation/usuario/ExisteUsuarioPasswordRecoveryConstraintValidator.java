/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.validation.usuario;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.apache.commons.beanutils.BeanUtils;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.util.Util;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author FNZABALETAA
 */
public class ExisteUsuarioPasswordRecoveryConstraintValidator implements ConstraintValidator<ExisteUsuarioPasswordRecovery, Object> {

    @Autowired
    private MiFacade mi;
 
    private String segundoFieldName;
    private String tercerFieldName;
    private String cuartoFieldName;
    private String quintoFieldName;
    private String message;

    @Override
    public void initialize(final ExisteUsuarioPasswordRecovery constraintAnnotation) { 
        segundoFieldName = constraintAnnotation.segundo();
        tercerFieldName = constraintAnnotation.tercero();
        cuartoFieldName = constraintAnnotation.cuarto();
        quintoFieldName = constraintAnnotation.quinto();
        message = constraintAnnotation.message();
    }

    public void setMi(MiFacade mi) {
        this.mi = mi;
    }
    private Boolean isOptional;

    @Override
    public boolean isValid(final Object value, final ConstraintValidatorContext context) {
        boolean valid = true;
        try { 
            final Object segundoObj = BeanUtils.getProperty(value, segundoFieldName);
            final Object tercerObj = BeanUtils.getProperty(value, tercerFieldName);
            final Object cuartoObj = BeanUtils.getProperty(value, cuartoFieldName);
            final Object quintoObj = BeanUtils.getProperty(value, quintoFieldName);
            String correo = cuartoObj.toString().equals("MD5") ? Util.MD5(quintoObj.toString() + "fautapo") : quintoObj.toString();
            message = segundoObj.equals(correo) ? "" : mi.ExisteUsuarioModificar( correo, tercerObj.toString());
        } catch (final Exception ignore) {
            message = "problemas con la validacion";
        }
        if (message.equals("")) {
            valid = true;
        } else {
            valid = false;
        }
        if (!valid) {
            context.buildConstraintViolationWithTemplate(message)
                    .addPropertyNode(quintoFieldName)
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
        }

        return valid;
    }

}
