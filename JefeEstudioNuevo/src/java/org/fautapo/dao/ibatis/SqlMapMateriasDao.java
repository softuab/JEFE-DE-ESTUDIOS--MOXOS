package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.MateriasDao;
import org.fautapo.domain.AreasConocimientoMaterias;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Materias;
import org.fautapo.util.ListViewItem;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
 */
public class SqlMapMateriasDao extends SqlSessionDaoSupport implements MateriasDao {

    //PLANES
    public List getPlnListarMaterias(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getPlnListarMaterias", plan);
    }
    // FIN PLANES

    //LIBRETAS
    public Materias getMtrBuscarMateria(Materias materia) throws DataAccessException {
        return (Materias) getSqlSession().selectOne("getMtrBuscarMateria", materia);
    }
    //FIN LIBRETAS

    //EST_PROGRAMACIONEEstIANTE
    public List getEstPrgListarProgramacionMateriasAut(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("getEstPrgListarProgramacionMateriasAut", materia);
    }

    public List getDptoListarMateriaGrupo(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("getDptoListarMateriaGrupo", materia);
    }

    public List getPstPrgListarProgramacionMateriasAut(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("getPstPrgListarProgramacionMateriasAut", materia);
    }
    // FIN EST_PROGRAMACIONEEstIANTE

    //PRORAMACIONES COMO ESTUDIANTE
    public List getEstListarProgramacionMateriasReq(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("getEstListarProgramacionMateriasReq", materia);
    }
    //FIN PRORAMACIONES COMO ESTUDIANTE

    //Programacion automatica
    public Materias getDptoListarMateriaGrupoMinimo(Materias materia) throws DataAccessException {
        return (Materias) getSqlSession().selectOne("getDptoListarMateriaGrupoMinimo", materia);
    }
    //Fin Programacion automatica

    public List getListarMateriasGradoPlanPrograma(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasGradoPlanPrograma", materia);
    }

    //INICIO - Admin Materias
    public List getListarMateriasPorDepartamento(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasPorDepartamento", materia);
    }

    public List getListarMateriasPorSigla(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasPorSigla", materia);
    }

    public List getListarMateriasPorMateria(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasPorMateria", materia);
    }

    public Materias getMtrBuscarTipoMateria(Materias materia) throws DataAccessException {
        return (Materias) getSqlSession().selectOne("getMtrBuscarTipoMateria", materia);
    }

    public List getMtrListarTiposMaterias() throws DataAccessException {
        return getSqlSession().selectList("getMtrListarTiposMaterias", null);
    }

    public int setRegistrarMateria(Materias materia) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarMateria", materia);
        return i.intValue();
    }

    public int setEliminarMateria(Materias materia) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setEliminarMateria", materia);
        return i.intValue();
    }

    public int getBuscar_nro_excepcion_calendario(Materias materia) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getBuscar_nro_excepcion_calendario", materia);
        return i.intValue();
    }

    //FIN - Admin Materias  
    @Override
    public List<AreasConocimientoMaterias> GetListaAreasConocimientoMaterias(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("GetListaAreasConocimientoMaterias", materia);
    }

    @Override
    public List<ListViewItem> GetListaMateriasPlan(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("GetListaAreasConocimientoMaterias", materia);
    }

    @Override
    public Integer InsertarAreaConocimiento(AreasConocimientoMaterias materia) throws DataAccessException {
        return getSqlSession().insert("InsertarAreaConocimiento", materia);
    }

    @Override
    public Integer ActualizarAreaConocimiento(AreasConocimientoMaterias materia) throws DataAccessException {
        return getSqlSession().update("ActualizarAreaConocimiento", materia);
    }

    @Override
    public Integer EliminarAreaConocimiento(AreasConocimientoMaterias materia) throws DataAccessException {
        return getSqlSession().update("EliminarAreaConocimiento", materia);
    }

    @Override
    public AreasConocimientoMaterias GetAreasConocimientoMaterias(Integer id_areas_materias) throws DataAccessException {
        return getSqlSession().selectOne("GetAreasConocimientoMaterias", id_areas_materias);
    }

    @Override
    public List<ListViewItem> GetListaPlanes(Integer id_programa) throws DataAccessException {
        return getSqlSession().selectList("GetListaPlanes", id_programa);
    }

}
