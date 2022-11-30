package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.ProgramasDao;
import org.fautapo.domain.Programas;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Universidades;
import org.fautapo.domain.Usuarios;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
 */
public class SqlMapProgramasDao extends SqlSessionDaoSupport implements ProgramasDao {

    public Programas getPrgBuscarPrograma(Programas programa) throws DataAccessException {
        return (Programas) getSqlSession().selectOne("getPrgBuscarPrograma", programa);
    }

    public List getFclListarProgramas(Facultades facultad) throws DataAccessException {
        return getSqlSession().selectList("getFclListarProgramas", facultad);
    }

    public List getUnvListarProgramas(Universidades universidad) throws DataAccessException {
        return getSqlSession().selectList("getUnvListarProgramas", universidad);
    }

    public List getUnvListarProgramasPost(Universidades universidad) throws DataAccessException {
        return getSqlSession().selectList("getUnvListarProgramasPost", universidad);
    }

    //AQUI EST PROGRAMACIONES 
    public Programas getPrdBuscarPrgPeriodo(Programas programa) throws DataAccessException {
        return (Programas) getSqlSession().selectOne("getPrdBuscarPrgPeriodo", programa);
    }

    public List getPrgBuscarDetalles(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("getPrgBuscarDetalles", programa);
    }

    public Programas getMdlBuscarMateriaAhorro(Programas programa) throws DataAccessException {
        return (Programas) getSqlSession().selectOne("getMdlBuscarMateriaAhorro", programa);
    }

    @Override
    public void setEstProgramacionMateria(Programas programa) throws DataAccessException {
        getSqlSession().insert("setEstProgramacionMateria", programa);
    }

    public int setPstProgramacionMateria(Programas programa) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setPstProgramacionMateria", programa);
        return i.intValue();
    }

    public List getTpsListarProgramaciones() throws DataAccessException {
        return getSqlSession().selectList("getTpsListarProgramaciones", null);
    }

    public Programas getTpsBuscarProgramacion(Programas programa) throws DataAccessException {
        return (Programas) getSqlSession().selectOne("getTpsBuscarProgramacion", programa);
    }

    //ADMINISTRAR HORARIOS
    public List getListarProgramasAcceso(Usuarios usuario) throws DataAccessException {
        return getSqlSession().selectList("getListarProgramasAcceso", usuario);
    }

    public List getMtrListarPlanesPrograma(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("getMtrListarPlanesPrograma", programa);
    }
    //FIN ADMINISTRAR HORARIOS  

    //PROGRAMACIONES COMO ESTUDIANTE
    public int getBuscarNivelMaximoPlanesEst(Programas programa) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getBuscarNivelMaximoPlanesEst", programa);
        return i.intValue();
    }

    public List getZchListarChoqueMaterias(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("getZchListarChoqueMaterias", programa);
    }

    public List getZchListarChoquePeriodos(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("getZchListarChoquePeriodos", programa);
    }

    public List setEstListarProgramarMaterias(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("setEstListarProgramarMaterias", programa);
    }
    //FIN PROGRAMACIONES COMO ESTUDIANTE
    //RETIRO ADICION DE MATERIAS

    public List getEstListarProgramacionesEstudiante(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("getEstListarProgramacionesEstudiante", programa);
    }

    public List setEstPrgRetirarProgramacionesMaterias(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("setEstPrgRetirarProgramacionesMaterias", programa);
    }

    public List setEstPrgRegistrarListarCambiarGrupos(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("setEstPrgRegistrarListarCambiarGrupos", programa);
    }
    //FIN RETIRO ADICION DE MATERIAS

    //MI SEGUNDA PARTE
    public List getListarTiposAdmisiones() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposAdmisiones", null);
    }

    public List getListarTiposAdmisionesPost() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposAdmisionesPost", null);
    }

    public List getListarTiposAdmisionesPrograma(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("getListarTiposAdmisionesPrograma", programa);
    }

    public List getListarTiposAdmisionesProgramaLiberacion(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("getListarTiposAdmisionesProgramaLiberacion", programa);
    }

    //Buscar programa de estudiante
    public Programas getPrgBuscarProgramaEstudiante(Programas programa) throws DataAccessException {
        return (Programas) getSqlSession().selectOne("getPrgBuscarProgramaEstudiante", programa);
    }
    //fin Buscar programa de estudiante

    public List getListarGradosProgramas(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("getListarGradosProgramas", programa);
    }

    // FIN MI SEGUNDA PARTE
    @Override
    public List<Programas> getEstListarNotaMinimaporPrograma(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("getEstListarNotaMinimaporPrograma", programa);
    }

}
