
package org.fautapo.Validacion;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.fautapo.domain.logic.MiFacade;

public class ExisteCorreoConstraintValidator implements ConstraintValidator<ExisteCorreo, String> {

    @Autowired
    private MiFacade mi;

    public void setMi(MiFacade mi) {
        this.mi = mi;
    }
    private Boolean isOptional;

    @Override
    public boolean isValid(String t, ConstraintValidatorContext cvc) {
        return mi.ExisteCorreo(t.replaceAll("\\s+", ""));
    }

    @Override
    public void initialize(ExisteCorreo a) {
        this.isOptional = a.optional();
    }

}
