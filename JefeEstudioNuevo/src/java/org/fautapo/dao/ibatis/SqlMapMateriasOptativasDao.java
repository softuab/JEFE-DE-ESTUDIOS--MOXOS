/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.dao.ibatis;

import java.util.List;
import org.fautapo.dao.MateriasOptativasDao;
import org.fautapo.domain.MateriasOptativas;
import org.fautapo.domain.ParametrosBusqueda;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.dao.DataAccessException;

/**
 *
 * @author hp
 */
public class SqlMapMateriasOptativasDao extends SqlSessionDaoSupport implements MateriasOptativasDao {
    
    public List<MateriasOptativas> getListarMateriasOptativas(ParametrosBusqueda buscar) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasOptativas", buscar);
    }

    @Override
    public void RegistrarNuevaOptativa(MateriasOptativas optativa) {
        getSqlSession().insert("RegistrarNuevaOptativa", optativa);
    }

    @Override
    public void EditarMateriaOptativa(MateriasOptativas optativa) throws DataAccessException {
      getSqlSession().update("EditarMateriaOptativa", optativa);
    }

    @Override
    public void EliminarMateriaOptativa(Integer id_est_materiaoptativa) throws DataAccessException {
       getSqlSession().update("EliminarMateriaOptativa", id_est_materiaoptativa);
    }
    
}
