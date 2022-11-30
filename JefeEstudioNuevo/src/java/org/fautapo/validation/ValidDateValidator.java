/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ValidDateValidator implements ConstraintValidator<ValidDate, String> {

    private Boolean isOptional;

    @Override
    public void initialize(ValidDate validDate) {
        this.isOptional = validDate.optional();
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext constraintValidatorContext) {

        boolean validDate = isValidFormat("dd/MM/yyyy", value);

        return isOptional ? (validDate || (isNullOrEmpty(value))) : validDate;
    }

    private boolean isNullOrEmpty(String value) {
        if (value == null) {
            return true;
        } else {
            if (value.equals("")) {
                return true;
            } else {
                return false;
            }
        }
    }

    private static boolean isValidFormat(String format, String value) {
        Date date = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            if (value != null) {
                date = sdf.parse(value);
                if (!value.equals(sdf.format(date))) {
                    date = null;
                }
            }

        } catch (ParseException ex) {
        }
        return date != null;
    }
}
