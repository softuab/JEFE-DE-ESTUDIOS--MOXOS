/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.validation;

import org.apache.commons.beanutils.BeanUtils;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import org.fautapo.domain.DepartamentoGrupos;
import org.fautapo.domain.Materias;
import org.fautapo.domain.ParametrosBusqueda;
import org.fautapo.domain.logic.MiFacade;
import org.fautapo.util.Convert;
import org.springframework.beans.factory.annotation.Autowired;

public class ExisteGrupoValidator implements ConstraintValidator<ExisteGrupo, Object> {

    @Autowired
    private MiFacade mi;

    public void setMi(MiFacade mi) {
        this.mi = mi;
    }
    private String materia;
    private String evaluacion;
    private String gestion;
    private String periodo;
    private String grupo;
    private String message;

    @Override
    public void initialize(ExisteGrupo constraintAnnotation) {
        materia = constraintAnnotation.materia();
        evaluacion = constraintAnnotation.evaluacion();
        gestion = constraintAnnotation.gestion();
        periodo = constraintAnnotation.periodo();
        grupo = constraintAnnotation.grupo();
        message = constraintAnnotation.message();
    }

    @Override
    public boolean isValid(Object value, ConstraintValidatorContext cvc) {
        boolean valid = true;
        try {
            final Object materiaObj = BeanUtils.getProperty(value, materia);
            final Object evaluacionObj = BeanUtils.getProperty(value, evaluacion);
            final Object gestionObj = BeanUtils.getProperty(value, gestion);
            final Object periodoObj = BeanUtils.getProperty(value, periodo);
            final Object grupoObj = BeanUtils.getProperty(value, grupo);

            int iId_tipo_evaluacion = Convert.ToInteger(evaluacionObj);
            int iGestion = Convert.ToInteger(gestionObj);
            int iPeriodo = Convert.ToInteger(periodoObj);
            int iId_materia = Convert.ToInteger(materiaObj);
            int iId_grupo = Convert.ToInteger(grupoObj);

            //Sacamos los datos de la materia
            Materias materia = new Materias();
            materia.setId_materia(iId_materia);
            materia = this.mi.getMtrBuscarMateria(materia);
            ParametrosBusqueda grupos = new ParametrosBusqueda();
            grupos.setGestion(iGestion);
            grupos.setPeriodo(iPeriodo);
            grupos.setId_materia(iId_materia);
            grupos.setId_grupo(iId_grupo);
            int estado = 0;
            valid = mi.ExisteGrupoPrograma(grupos);
        } catch (final Exception ignore) {
            valid = false;
        }
        if (!valid) {
            cvc.buildConstraintViolationWithTemplate(message)
                    .addPropertyNode(grupo)
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
        }
        return valid;
    }
}
