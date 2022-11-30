/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.Validacion;


import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.PARAMETER;
import java.lang.annotation.Retention;
import static java.lang.annotation.RetentionPolicy.RUNTIME;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

@Target({FIELD, PARAMETER})
@Retention(RUNTIME)
@Constraint(validatedBy = ExisteCorreoConstraintValidator.class)
public @interface ExisteCorreo {

    String message() default "Ya se encuentra registrado el correo electronico";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
     boolean optional() default false;
}

