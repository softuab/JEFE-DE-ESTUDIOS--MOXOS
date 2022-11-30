package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Personas;

/**
 * @autor FAUTAPO
 * @fec_registro 2006-03-23
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2006-03-23
 */
public interface PersonasDao {

    Personas getBuscarPersonaUsuario(Personas persona) throws DataAccessException;

    Personas getBuscarPersona(Personas persona) throws DataAccessException;
    //INICIO - MI

    Personas getPrsBuscarPersona(Personas persona) throws DataAccessException;

    Personas getPrsBuscarPersonaDocente(int id_docente) throws DataAccessException;

    //FIN - MI
    //INICIO SEGUNDA PARTE
    //Listar Paises
    List getListarPaises() throws DataAccessException;

    List getListarDepartamentos(Personas persona) throws DataAccessException;

    List getListarProvincias(Personas persona) throws DataAccessException;

    List getListarLocalidades(Personas persona) throws DataAccessException;

    List getListarLocalidadesTodas() throws DataAccessException;
    //Listar Tipos

    List getListarTiposSexos() throws DataAccessException;

    List getListarTiposEstadosCiviles() throws DataAccessException;

    List getListarTiposEmpresasTelef() throws DataAccessException;

    List getListarTiposEstudiantes() throws DataAccessException;

    Personas getBuscarTipoEstudiante(Personas persona) throws DataAccessException;

    List getListarTiposGraduaciones() throws DataAccessException;

    List getListarTiposInstituciones() throws DataAccessException;

    List getListarColegiosTipoIns(Personas persona) throws DataAccessException;

    List getListarTiposTurnos() throws DataAccessException;

    List getListarTiposProblemasRol(Personas persona) throws DataAccessException;
    //Registrar

    int setRegistrarPersona(Personas persona) throws DataAccessException;

    int setRegistrarPrsColegio(Personas persona) throws DataAccessException;

    int setRegistrarPrsClasificacion(Personas persona) throws DataAccessException;

    int setRegistrarPrsDocumentos(Personas persona) throws DataAccessException;

    int setRegistrarPrsCompromisos(Personas persona) throws DataAccessException;

    List getListarPrsDocumentosPersona(Personas persona) throws DataAccessException;

    Personas getBuscarTipoClasificacionPersona(Personas persona) throws DataAccessException;

    List getListarTiposCompromisos() throws DataAccessException;

    Personas getBuscarPersonaColegio(Personas persona) throws DataAccessException;

    List getPrsListarPersonasDip(Personas persona) throws DataAccessException;
    //Items Personas

    Personas getBuscarItemPersona(Personas persona) throws DataAccessException;

    List getListarItemsPersonasDip(Personas persona) throws DataAccessException;

    Personas getBuscarItemsUsuario(Personas persona) throws DataAccessException;
    //Listar PrsCompromisos

    List getListarPrsCompromisosPersona(Personas persona) throws DataAccessException;

    List getListarPrsDocumentosClasificacion(Personas persona) throws DataAccessException;

    int getBuscarPrsDocumentacionCompleta(Personas persona) throws DataAccessException;

    //Fin Listar PrsCompromisos
    //FIN SEGUNDA PARTE
    Personas getMiBuscarCompromiso(Personas persona) throws DataAccessException;

    int getMiPrsNroCompromisos(Personas persona) throws DataAccessException;

    //Listar Personas
    List getListarPersonas(Personas persona) throws DataAccessException;

//INICIO - METODOS ADICIONADOS POR LA UAP
    Personas getEstBuscarEstudianteDocente(Personas persona) throws DataAccessException;

    // Listado de Curso de Preparatoria de Ingles Otros
    List getListarCursoPreInglesOtros(Personas persona) throws DataAccessException;

    List getListarCursoPsicoOtros(Personas persona) throws DataAccessException;

    List<Personas> GetListaPersonasHabilitadas(String buscar) throws DataAccessException;
//FIN - METODOS ADICIONADOS POR LA UAP

}
