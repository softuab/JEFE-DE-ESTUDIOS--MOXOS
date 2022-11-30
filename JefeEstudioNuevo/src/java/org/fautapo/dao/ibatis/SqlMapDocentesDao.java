package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.DocentesDao;
import org.fautapo.domain.Asignaciones;
import org.fautapo.domain.Docentes;
import org.fautapo.domain.ParametrosBusqueda;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-04-10
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-04-10
 */
public class SqlMapDocentesDao extends SqlSessionDaoSupport implements DocentesDao {

    public Docentes getComprobarDocente(Docentes docente) throws DataAccessException {
        return (Docentes) getSqlSession().selectOne("getComprobarDocente", docente);
    }

    public Docentes getBuscarDocente(Docentes docente) throws DataAccessException {
        return (Docentes) getSqlSession().selectOne("getBuscarDocente", docente);
    }

    public Docentes getBuscarDocentexdepartamento(Docentes docente) throws DataAccessException {
        return (Docentes) getSqlSession().selectOne("getBuscarDocentexdepartamento", docente);
    }

    public int setCambioPinDocente(Docentes docente) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setCambioPinDocente", docente);
        return i.intValue();
    }

    public List getBuscarListaDocentesNombres(Docentes docente) throws DataAccessException {
        return getSqlSession().selectList("getBuscarListaDocentesNombres", docente);
    }

    public List getBuscarListaDocentesDip(Docentes docente) throws DataAccessException {
        return getSqlSession().selectList("getBuscarListaDocentesDip", docente);
    }

    public List getListarTiposDocentes() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposDocentes", null);
    }

    public List getListarTiposAsignaciones() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposAsignaciones", null);
    }

    public List getListarTiposFunciones() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposFunciones", null);
    }

    //Docentes Todos 
    public List getListarDocentesTodos() throws DataAccessException {
        return getSqlSession().selectList("getListarDocentesTodos", null);
    }

    //INICIO - Admin. Docente
    public int setRegistrarDocente(Docentes docente) {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarDocente", docente);
        return i.intValue();
    }

    public int setEliminarDocente(Docentes docente) {
        Integer i = (Integer) getSqlSession().selectOne("setEliminarDocente", docente);
        return i.intValue();
    }
    //FIN - Admin. Docente  
    //Inicio Cambio PIN Docente General

    public int setModificarApodoClaveDocente(Docentes docente) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setModificarApodoClaveDocente", docente);
        return i.intValue();
    }
    //Fin Cambio PIN Docente General

//INICIO - METODOS ADICIONADOS POR LA UAP
    public List getListarDocentesPorDpto(Docentes docente) throws DataAccessException {
        return getSqlSession().selectList("getListarDocentesPorDpto", docente);
    }

    //Auxiliares Todos 
    public List getListarAuxiliaresTodos() throws DataAccessException {
        return getSqlSession().selectList("getListarAuxiliaresTodos", null);
    }

    public Docentes getBuscarAuxiliar(Docentes docente) throws DataAccessException {
        return (Docentes) getSqlSession().selectOne("getBuscarAuxiliar", docente);
    }
//FIN - METODOS ADICIONADOS POR LA UAP

    @Override
    public List<Docentes> getDetallefotoadjunto(Docentes docente) throws DataAccessException {
        return getSqlSession().selectList("getDetallefotoadjunto", docente); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int setRegistrarDocenteAdjuntos(Docentes docente) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarDocenteAdjuntos", docente);
        return i.intValue();
    }

    @Override
    public int setActualizarDocenteAdjuntos(Docentes docente) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setActualizarDocenteAdjuntos", docente);
        return i.intValue();
    }

    @Override
    public List<Docentes> getBuscarListaDocentesCorreo(String Correo) throws DataAccessException {
        return getSqlSession().selectList("getBuscarListaDocentesCorreo", Correo); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Docentes> GetListaNotificacionDocente(ParametrosBusqueda buscar) throws DataAccessException {
        return getSqlSession().selectList("GetListaNotificacionDocente", buscar);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Docentes> getListarDocentes(Docentes docente) throws DataAccessException {
        return getSqlSession().selectList("getListarDocentes", docente);
    }

    @Override
    public List<Docentes> getDocenteDesignadosCarrera(Asignaciones asignacion) {
        return getSqlSession().selectList("getDocenteDesignadosCarrera", asignacion);
    }

}
