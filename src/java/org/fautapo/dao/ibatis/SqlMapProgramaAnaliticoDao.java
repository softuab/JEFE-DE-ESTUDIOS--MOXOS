/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.fautapo.dao.ibatis;

import java.util.List;
import org.fautapo.dao.ProgramaAnaliticoDao;
import org.fautapo.domain.BiBliografia;
import org.fautapo.domain.Contenidos;
import org.fautapo.domain.Cronograma;
import org.fautapo.domain.DistribucionTiempos;
import org.fautapo.domain.FormasDistribucion;
import org.fautapo.domain.FormasOrganizacion;
import org.fautapo.domain.FormasTrabajoAula;
import org.fautapo.domain.ProgramaAnalitico;
import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;

/**
 *
 * @author DBMENESESJ
 */
public class SqlMapProgramaAnaliticoDao extends SqlSessionDaoSupport implements ProgramaAnaliticoDao {

    @Override
    public List<ProgramaAnalitico> GetListarDatosCaratula(int id_asignacion) throws DataAccessException {
        return getSqlSession().selectList("GetListarDatosCaratula", id_asignacion);
    }

    @Override
    public List<ProgramaAnalitico> GetListarMateriaProgramaAnalitico(int id_asignacion) throws DataAccessException {
        return getSqlSession().selectList("GetListarMateriaProgramaAnalitico", id_asignacion);
    }

    @Override
    public int PermitirRegistroPrograma(ProgramaAnalitico programaAnalitico) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("PermitirRegistroPrograma", programaAnalitico);
        return i.intValue();
    }

    @Override
    public List<ProgramaAnalitico> GetListarPrerequisitoMateria(ProgramaAnalitico programaAnalitico) throws DataAccessException {
        return getSqlSession().selectList("GetListarPrerequisitoMateria", programaAnalitico);
    }

    @Override
    public int RegistrarProgromaAnalitico(ProgramaAnalitico programaAnalitico) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("RegistrarProgromaAnalitico", programaAnalitico);
        return i.intValue();
    }

    @Override
    public List<ProgramaAnalitico> GetListaProgramaanalitico(ProgramaAnalitico programaAnalitico) throws DataAccessException {
        return getSqlSession().selectList("GetListaProgramaanalitico", programaAnalitico);
    }

    @Override
    public int ActualizarProgramaAnalitico(ProgramaAnalitico programaAnalitico) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("ActualizarProgramaAnalitico", programaAnalitico);
        return i.intValue();
    }

    @Override
    public List<ProgramaAnalitico> GetProgramaanalitico(ProgramaAnalitico programaAnalitico) throws DataAccessException {
        return getSqlSession().selectList("GetProgramaanalitico", programaAnalitico);
    }

    @Override
    public int ActualizarBibliografia(BiBliografia bibliografia) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("ActualizarBibliografia", bibliografia);
        return i.intValue();
    }

    @Override
    public int RegistrarBibliografia(BiBliografia bibliografia) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("RegistrarBibliografia", bibliografia);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int EliminarBibliografia(BiBliografia bibliografia) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("EliminarBibliografia", bibliografia);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<BiBliografia> GetListarBibliografia(BiBliografia bibliografia) throws DataAccessException {
        return getSqlSession().selectList("GetListarBibliografia", bibliografia);//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<BiBliografia> GetBibliografia(BiBliografia bibliografia) throws DataAccessException {
        return getSqlSession().selectList("GetBibliografia", bibliografia); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int ActualizarCronograma(Cronograma cronograma) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("ActualizarCronograma", cronograma);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int RegistrarCronograma(Cronograma cronograma) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("RegistrarCronograma", cronograma);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int EliminarCronograma(Cronograma cronograma) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("EliminarCronograma", cronograma);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Cronograma> GetListarCronograma(Cronograma cronograma) throws DataAccessException {
        return getSqlSession().selectList("GetListarCronograma", cronograma); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Cronograma> GetCronograma(Cronograma cronograma) throws DataAccessException {
        return getSqlSession().selectList("GetCronograma", cronograma); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int ActualizarObjetivo_Instructivo(Contenidos contenidos) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("ActualizarObjetivo_Instructivo", contenidos);
        return i.intValue();//To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int RegistrarObjetivo_Instructivo(Contenidos contenidos) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("RegistrarObjetivo_Instructivo", contenidos);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int EliminarObjetivo_Instructivo(Contenidos contenidos) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("EliminarObjetivo_Instructivo", contenidos);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Contenidos> GetListarContenido(Contenidos contenidos) throws DataAccessException {
        return getSqlSession().selectList("GetListarContenido", contenidos);  //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Contenidos> GetContenido(Contenidos contenidos) throws DataAccessException {
        return getSqlSession().selectList("GetContenido", contenidos);  //To change body of generated methods, choose Tools | Templates.
    }

    /* distribucion de tiempos*/
    @Override
    public List<FormasOrganizacion> GetListarformas() throws DataAccessException {
        return getSqlSession().selectList("GetListarformas"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<FormasTrabajoAula> GetListarformastrabajoaula() throws DataAccessException {
        return getSqlSession().selectList("GetListarformastrabajoaula"); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Contenidos> GetListarformascontenido(Contenidos contenidos) throws DataAccessException {
        return getSqlSession().selectList("GetListarformascontenido", contenidos); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<DistribucionTiempos> GetListarDistribucionTiempos(DistribucionTiempos distribuciontiempos) throws DataAccessException {
        return getSqlSession().selectList("GetListarDistribucionTiempos", distribuciontiempos); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<DistribucionTiempos> GetDistribucionTiempos(DistribucionTiempos distribuciontiempos) throws DataAccessException {
        return getSqlSession().selectList("GetDistribucionTiempos", distribuciontiempos); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int RegistrarDistribucionTiempos(DistribucionTiempos distribuciontiempos) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("RegistrarDistribucionTiempos", distribuciontiempos);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int ActualizarDistribucionTiempos(DistribucionTiempos distribuciontiempos) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("ActualizarDistribucionTiempos", distribuciontiempos);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int EliminarDistribucionTiempos(DistribucionTiempos distribuciontiempos) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("EliminarDistribucionTiempos", distribuciontiempos);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<FormasDistribucion> GetListarFormasDistribucion(FormasDistribucion formasdistribucion) throws DataAccessException {
        return getSqlSession().selectList("GetListarFormasDistribucion", formasdistribucion); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<FormasDistribucion> GetFormasDistribucion(FormasDistribucion formasdistribucion) throws DataAccessException {
        return getSqlSession().selectList("GetFormasDistribucion", formasdistribucion); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int RegistrarFormasDistribucion(FormasDistribucion formasdistribucion) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("RegistrarFormasDistribucion", formasdistribucion);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int ActualizarFormasDistribucion(FormasDistribucion formasdistribucion) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("ActualizarFormasDistribucion", formasdistribucion);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int EliminarFormasDistribucion(FormasDistribucion formasdistribucion) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("EliminarFormasDistribucion", formasdistribucion);
        return i.intValue(); //To change body of generated methods, choose Tools | Templates.

    }

    /* fin distribucion de tiempos*/
    @Override
    public ProgramaAnalitico GetDatosCaratula(int id_dct_programa_analitico) throws DataAccessException {
        ProgramaAnalitico i = (ProgramaAnalitico) getSqlSession().selectOne("GetDatosCaratula", id_dct_programa_analitico);
        return i;
    }

    @Override
    public List<FormasOrganizacion> GetListarformasProgramaAnalitico(int id_dct_programa_analitico) throws DataAccessException {
        return getSqlSession().selectList("GetListarformasProgramaAnalitico", id_dct_programa_analitico); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<FormasTrabajoAula> GetListarformastrabajoaulaProgramaAnalitico(int id_dct_programa_analitico) throws DataAccessException {
        return getSqlSession().selectList("GetListarformastrabajoaulaProgramaAnalitico", id_dct_programa_analitico); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<FormasDistribucion> GetDetalleHorasFormasDistribucion(int id_dct_programa_analitico) throws DataAccessException {
         return getSqlSession().selectList("GetDetalleHorasFormasDistribucion", id_dct_programa_analitico); //To change body of generated methods, choose Tools | Templates.
    }
 
}
