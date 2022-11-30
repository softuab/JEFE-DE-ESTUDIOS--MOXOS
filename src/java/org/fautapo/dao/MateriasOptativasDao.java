/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.dao;

import java.util.List;
import org.fautapo.domain.MateriasOptativas;
import org.fautapo.domain.ParametrosBusqueda;
import org.springframework.dao.DataAccessException;

/**
 *
 * @author hp
 */
public interface MateriasOptativasDao {

    List<MateriasOptativas> getListarMateriasOptativas(ParametrosBusqueda buscar) throws DataAccessException;

    void RegistrarNuevaOptativa(MateriasOptativas optativa);

    void EditarMateriaOptativa(MateriasOptativas optativa) throws DataAccessException;
    
    void EliminarMateriaOptativa(Integer id_est_materiaoptativa) throws DataAccessException;
}
