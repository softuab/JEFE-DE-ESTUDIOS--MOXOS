package org.fautapo.dao.ibatis;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.GruposDao;
import org.fautapo.domain.DepartamentoGrupos;
import org.fautapo.domain.Grupos;
import org.fautapo.domain.Materias;
import org.fautapo.domain.ParametrosBusqueda;

public class SqlMapGruposDao extends SqlSessionDaoSupport implements GruposDao {

    //Administrar Horarios
    public List getDptoListarGruposMateria(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("getDptoListarGruposMateria", materia);
    }

    public Grupos getDptoBuscarGrupo(Grupos grupo) throws DataAccessException {
        return (Grupos) getSqlSession().selectOne("getDptoBuscarGrupo", grupo);
    }
    //Fin Administrar horarios
    //Cambio de grupo

    public List getListarEstudiantesGrupos(Grupos grupo) throws DataAccessException {
        return getSqlSession().selectList("getListarEstudiantesGrupos", grupo);
    }

    public Grupos setCambiarGrupoEstudiante(Grupos grupo) throws DataAccessException {
        return (Grupos) getSqlSession().selectOne("setCambiarGrupoEstudiante", grupo);
    }
    //Fin Cambio de grupo

    //est_programaciones
    public Grupos getGrpBuscarGrupo(Grupos grupo) throws DataAccessException {
        return (Grupos) getSqlSession().selectOne("getGrpBuscarGrupo", grupo);
    }

    public Grupos getDptoBuscarCupoRestanteGrupo(Grupos grupo) throws DataAccessException {
        return (Grupos) getSqlSession().selectOne("getDptoBuscarCupoRestanteGrupo", grupo);
    }

    //  inicio - GRUPOS jojo
    public List getPrgListarGrupos(Grupos grupo) throws DataAccessException {
        return getSqlSession().selectList("getPrgListarGrupos", grupo);
    }

    public List getMtrListarGruposNoAsignados(Grupos grupo) throws DataAccessException {
        return getSqlSession().selectList("getMtrListarGruposNoAsignados", grupo);
    }
    
    public List getMtrListarGruposNoAsignadosCompletos(Grupos grupo) throws DataAccessException {
        return getSqlSession().selectList("getMtrListarGruposNoAsignadosCompletos", grupo);
    }

    public Grupos getMiDptoBuscarGrupo(Grupos grupo) throws DataAccessException {
        return (Grupos) getSqlSession().selectOne("getMiDptoBuscarGrupo", grupo);
    }
    //  fin - GRUPOS jojo

    //dct_asignacion
    public List getDptoListarGruposMateriaTipoEvaluacion(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("getDptoListarGruposMateriaTipoEvaluacion", materia);
    }

    public List getDptoListarGruposMateriaTipoEvaluacionDesignado(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("getDptoListarGruposMateriaTipoEvaluacionDesignado", materia);
    }

//INICIO - METODOS ADICIONADOS POR LA UAP
    //aux_asignacion
    public List getDptoListarGruposMateriaTipoEvaluacionAuxiliares(Materias materia) throws DataAccessException {
        return getSqlSession().selectList("getDptoListarGruposMateriaTipoEvaluacionAuxiliares", materia);
    }
//FIN - METODOS ADICIONADOS POR LA UAP

    @Override
    public int RegistrarDepartamentosGrupo(DepartamentoGrupos grupos) throws DataAccessException {
        Integer insertedId = (Integer) getSqlSession().insert("RegistrarDepartamentosGrupo", grupos);
        return insertedId;
    }

    public List<DepartamentoGrupos> getDepartamentosGrupos(DepartamentoGrupos grupos) throws DataAccessException {
        return getSqlSession().selectList("getDepartamentosGrupos", grupos);
    }

    @Override
    public void ActualizarDepartamentosGrupo(DepartamentoGrupos grupos) throws DataAccessException {
        getSqlSession().update("ActualizarDepartamentosGrupo", grupos);
    }

    @Override
    public void EliminarGrupo(DepartamentoGrupos grupos) throws DataAccessException {
        getSqlSession().update("EliminarGrupo", grupos);
    }

    public List<DepartamentoGrupos> getGrupos_Permitidos(ParametrosBusqueda busqueda) throws DataAccessException {
        return getSqlSession().selectList("getGrupos_Permitidos", busqueda);
    }

}
