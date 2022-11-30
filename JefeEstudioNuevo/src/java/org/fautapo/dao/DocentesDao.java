package org.fautapo.dao;

import java.util.List;
import org.fautapo.domain.Asignaciones;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.ParametrosBusqueda;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-11
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-11
 */
public interface DocentesDao {

    Docentes getComprobarDocente(Docentes docente) throws DataAccessException;

    Docentes getBuscarDocente(Docentes docente) throws DataAccessException;

    Docentes getBuscarDocentexdepartamento(Docentes docente) throws DataAccessException;

    int setCambioPinDocente(Docentes docente) throws DataAccessException;

    List getBuscarListaDocentesNombres(Docentes docente) throws DataAccessException;

    List getBuscarListaDocentesDip(Docentes docente) throws DataAccessException;

    List getListarTiposDocentes() throws DataAccessException;

    List getListarTiposAsignaciones() throws DataAccessException;

    List getListarTiposFunciones() throws DataAccessException;
    //Docentes Todos

    List getListarDocentesTodos() throws DataAccessException;

    //INICIO - Administrar Docente
    int setRegistrarDocente(Docentes docente) throws DataAccessException;

    int setEliminarDocente(Docentes docente) throws DataAccessException;
    //FIN - Administrar Docente 

    //Inicio Cambio PIN Docente General
    int setModificarApodoClaveDocente(Docentes docente) throws DataAccessException;
    //Fin Cambio PIN Docente General

//INICIO - METODOS ADICIONADOS POR LA UAP
    List getListarDocentesPorDpto(Docentes docente) throws DataAccessException;

    //Listar a todos los Auxiliares de docencia
    List getListarAuxiliaresTodos() throws DataAccessException;

    Docentes getBuscarAuxiliar(Docentes docente) throws DataAccessException;
//FIN - METODOS ADICIONADOS POR LA UAP

    List<Docentes> getDetallefotoadjunto(Docentes docente) throws DataAccessException;

    int setRegistrarDocenteAdjuntos(Docentes docente) throws DataAccessException;

    int setActualizarDocenteAdjuntos(Docentes docente) throws DataAccessException;

    List<Docentes> getBuscarListaDocentesCorreo(String Correo) throws DataAccessException;

    List<Docentes> GetListaNotificacionDocente(ParametrosBusqueda buscar) throws DataAccessException;

    List<Docentes> getListarDocentes(Docentes docente) throws DataAccessException;

    List<Docentes> getDocenteDesignadosCarrera(Asignaciones asignacion);
}
