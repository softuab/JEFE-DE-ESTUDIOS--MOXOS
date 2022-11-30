/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.dao;

import java.util.List;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Menciones;
import org.fautapo.domain.ParametrosBusqueda;
import org.springframework.dao.DataAccessException;

/**
 *
 * @author hp
 */
public interface MencionesDao {

    List<Menciones> GetListarMencionesProgramas(ParametrosBusqueda buscar) throws DataAccessException;

    List<Estudiantes> GetListarMencionesEstudiantes(ParametrosBusqueda buscar) throws DataAccessException;

    String GetProgramaMencion(ParametrosBusqueda buscar) throws DataAccessException;

    List<String> GetProgramaPlanesMencion(ParametrosBusqueda buscar) throws DataAccessException;
    List<Menciones> GetListarMencion(ParametrosBusqueda buscar) throws DataAccessException;

    void RegistrarNuevaMencion(Menciones mencion) throws DataAccessException;

    void EditarMencion(Menciones mencion) throws DataAccessException;

    void EliminarMencion(Menciones mencion) throws DataAccessException;
}
