/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.dao.ibatis;

import java.util.List;
import org.fautapo.dao.MencionesDao;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Menciones;
import org.fautapo.domain.ParametrosBusqueda;
import org.fautapo.domain.Planes;
import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;

/**
 *
 * @author hp
 */
public class SqlMapMencionesDao extends SqlSessionDaoSupport implements MencionesDao {

    public List<Menciones> GetListarMencionesProgramas(ParametrosBusqueda buscar) throws DataAccessException {
        return getSqlSession().selectList("GetListarMencionesProgramas", buscar);
    }

    @Override
    public List<Estudiantes> GetListarMencionesEstudiantes(ParametrosBusqueda buscar) throws DataAccessException {
        return getSqlSession().selectList("GetListarMencionesEstudiantes", buscar);
    }

    @Override
    public String GetProgramaMencion(ParametrosBusqueda buscar) throws DataAccessException {
        return getSqlSession().selectOne("GetProgramaMencion", buscar).toString();
    }

    @Override
    public List<String> GetProgramaPlanesMencion(ParametrosBusqueda buscar) throws DataAccessException {
        return getSqlSession().selectList("GetProgramaPlanesMencion", buscar);
    }

    @Override
    public List<Menciones> GetListarMencion(ParametrosBusqueda buscar) throws DataAccessException {
        return getSqlSession().selectList("GetListarMencion", buscar);
    }

    @Override
    public void RegistrarNuevaMencion(Menciones mencion) throws DataAccessException {
        getSqlSession().insert("RegistrarNuevaMencion", mencion);
    }

    @Override
    public void EditarMencion(Menciones mencion) throws DataAccessException {
        getSqlSession().update("EditarMencion", mencion);
    }

    @Override
    public void EliminarMencion(Menciones mencion) throws DataAccessException {
        getSqlSession().update("EliminarMencion", mencion);
    }

}
