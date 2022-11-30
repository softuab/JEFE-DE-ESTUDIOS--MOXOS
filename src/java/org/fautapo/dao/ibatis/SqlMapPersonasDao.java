package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.PersonasDao;
import org.fautapo.domain.Estudiantes;
import org.fautapo.domain.Personas;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-23
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-23
 */
public class SqlMapPersonasDao extends SqlSessionDaoSupport implements PersonasDao {

    public Personas getBuscarPersonaUsuario(Personas persona) throws DataAccessException {
        return (Personas) getSqlSession().selectOne("getBuscarPersonaUsuario", persona);
    }

    public Personas getBuscarPersona(Personas persona) throws DataAccessException {
        return (Personas) getSqlSession().selectOne("getBuscarPersona", persona);
    }

    // INICIO - MI
    public Personas getPrsBuscarPersona(Personas persona) throws DataAccessException {
        return (Personas) getSqlSession().selectOne("getPrsBuscarPersona", persona);
    }
    // FIN - MI

    //Inicio MI segunda Parte
    //Listar Paises
    public List getListarPaises() throws DataAccessException {
        return getSqlSession().selectList("getListarPaises", null);
    }

    public List getListarDepartamentos(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getListarDepartamentos", persona);
    }

    public List getListarProvincias(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getListarProvincias", persona);
    }

    public List getListarLocalidades(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getListarLocalidades", persona);
    }

    public List getListarLocalidadesTodas() throws DataAccessException {
        return getSqlSession().selectList("getListarLocalidadesTodas", null);
    }

    //Listar Tipos
    public List getListarTiposSexos() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposSexos", null);
    }

    public List getListarTiposEstadosCiviles() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposEstadosCiviles", null);
    }

    public List getListarTiposEmpresasTelef() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposEmpresasTelef", null);
    }

    public List getListarTiposEstudiantes() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposEstudiantes", null);
    }

    public Personas getBuscarTipoEstudiante(Personas persona) throws DataAccessException {
        return (Personas) getSqlSession().selectOne("getBuscarTipoEstudiante", persona);
    }

    public List getListarTiposGraduaciones() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposGraduaciones", null);
    }

    public List getListarTiposInstituciones() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposInstituciones", null);
    }

    public List getListarColegiosTipoIns(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getListarColegiosTipoIns", persona);
    }

    public List getListarTiposTurnos() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposTurnos", null);
    }

    public List getListarTiposProblemasRol(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getListarTiposProblemasRol", persona);
    }

    //Registrar
    public int setRegistrarPersona(Personas persona) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarPersona", persona);
        return i.intValue();
    }

    public int setRegistrarPrsColegio(Personas persona) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarPrsColegio", persona);
        return i.intValue();
    }

    public int setRegistrarPrsClasificacion(Personas persona) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarPrsClasificacion", persona);
        return i.intValue();
    }

    public int setRegistrarPrsDocumentos(Personas persona) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarPrsDocumentos", persona);
        return i.intValue();
    }

    public int setRegistrarPrsCompromisos(Personas persona) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setRegistrarPrsCompromisos", persona);
        return i.intValue();
    }

    public List getListarPrsDocumentosPersona(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getListarPrsDocumentosPersona", persona);
    }

    public Personas getBuscarTipoClasificacionPersona(Personas persona) throws DataAccessException {
        return (Personas) getSqlSession().selectOne("getBuscarTipoClasificacionPersona", persona);
    }

    public List getListarTiposCompromisos() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposCompromisos", null);
    }

    public Personas getBuscarPersonaColegio(Personas persona) throws DataAccessException {
        return (Personas) getSqlSession().selectOne("getBuscarPersonaColegio", persona);
    }
    //Persona

    public List getPrsListarPersonasDip(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getPrsListarPersonasDip", persona);
    }

    //Persona items
    public List getListarItemsPersonasDip(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getListarItemsPersonasDip", persona);
    }

    public Personas getBuscarItemPersona(Personas persona) throws DataAccessException {
        return (Personas) getSqlSession().selectOne("getBuscarItemPersona", persona);
    }

    public Personas getBuscarItemsUsuario(Personas persona) throws DataAccessException {
        return (Personas) getSqlSession().selectOne("getBuscarItemsUsuario", persona);
    }

    //Listar PrsCompromisos 
    public List getListarPrsCompromisosPersona(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getListarPrsCompromisosPersona", persona);
    }

    public List getListarPrsDocumentosClasificacion(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getListarPrsDocumentosClasificacion", persona);
    }

    public int getBuscarPrsDocumentacionCompleta(Personas persona) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getBuscarPrsDocumentacionCompleta", persona);
        return i.intValue();
    }

    //Fin Listar PrsCompromisos 
    //Fin MI segunda Parte
    public Personas getMiBuscarCompromiso(Personas persona) throws DataAccessException {
        return (Personas) getSqlSession().selectOne("getMiBuscarCompromiso", persona);
    }

    public int getMiPrsNroCompromisos(Personas persona) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("getMiPrsNroCompromisos", persona);
        return i.intValue();
    }

    //Listar Personas
    public List getListarPersonas(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getListarPersonas", persona);
    }

//INICIO - METODOS ADICIONADOS POR LA UAP
    public Personas getEstBuscarEstudianteDocente(Personas persona) throws DataAccessException {
        return (Personas) getSqlSession().selectOne("getEstBuscarEstudianteDocente", persona);
    }

    // Listado de Curso de Preparatoria de Ingles Estudiantes Otros
    public List getListarCursoPreInglesOtros(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getListarCursoPreInglesOtros", persona);
    }

    public List getListarCursoPsicoOtros(Personas persona) throws DataAccessException {
        return getSqlSession().selectList("getListarCursoPsicoOtros", persona);
    }
//FIN - METODOS ADICIONADOS POR LA UAP

    @Override
    public Personas getPrsBuscarPersonaDocente(int id_docente) throws DataAccessException {
        return (Personas) getSqlSession().selectOne("getPrsBuscarPersonaDocente", id_docente);
    }

    @Override
    public int getBuscarPrsDocumentacionCompletaEstudiante(Estudiantes persona) throws DataAccessException {
        return getSqlSession().selectOne("getBuscarPrsDocumentacionCompletaEstudiante", persona);
    } 
}
