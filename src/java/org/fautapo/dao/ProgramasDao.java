package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
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

public interface ProgramasDao {

    Programas getPrgBuscarPrograma(Programas programa) throws DataAccessException;

    List getFclListarProgramas(Facultades facultad) throws DataAccessException;

    List getUnvListarProgramas(Universidades universidad) throws DataAccessException;

    List getUnvListarProgramasPost(Universidades universidad) throws DataAccessException;

    // PROGRAMACIONES
    Programas getPrdBuscarPrgPeriodo(Programas programa) throws DataAccessException;

    List getPrgBuscarDetalles(Programas programa) throws DataAccessException;

    Programas getMdlBuscarMateriaAhorro(Programas programa) throws DataAccessException;

    void setEstProgramacionMateria(Programas programa) throws DataAccessException;

    int setPstProgramacionMateria(Programas programa) throws DataAccessException;

    List getTpsListarProgramaciones() throws DataAccessException;

    Programas getTpsBuscarProgramacion(Programas programa) throws DataAccessException;
    //FIN PROGRAMACIONES  

    //ADMINISTRAR HORARIOS
    List getListarProgramasAcceso(Usuarios usuario) throws DataAccessException;

    List getMtrListarPlanesPrograma(Programas programa) throws DataAccessException;
    //FIN ADMINISTRAR HORARIOS

    //PROGRAMACIONES COMO ESTUDIANTE
    int getBuscarNivelMaximoPlanesEst(Programas programa) throws DataAccessException;

    List getZchListarChoqueMaterias(Programas programa) throws DataAccessException;

    List getZchListarChoquePeriodos(Programas programa) throws DataAccessException;

    List setEstListarProgramarMaterias(Programas programa) throws DataAccessException;
    //RETIRO ADICION DE MATERIAS COMO AUTORIDAD

    List getEstListarProgramacionesEstudiante(Programas programa) throws DataAccessException;

    List setEstPrgRetirarProgramacionesMaterias(Programas programa) throws DataAccessException;

    List setEstPrgRegistrarListarCambiarGrupos(Programas programa) throws DataAccessException;

    //MI SEGUNDA PARTE
    List getListarTiposAdmisiones() throws DataAccessException;

    List getListarTiposAdmisionesPost() throws DataAccessException;

    List getListarTiposAdmisionesPrograma(Programas programa) throws DataAccessException;

    List getListarTiposAdmisionesProgramaLiberacion(Programas programa) throws DataAccessException;

    //Buscar programa de estudiante
    Programas getPrgBuscarProgramaEstudiante(Programas programa) throws DataAccessException;
    //fin Buscar programa de estudiante

    List getListarGradosProgramas(Programas programa) throws DataAccessException;

    //FIN MI SEGUNDA PARTE
    List<Programas> getEstListarNotaMinimaporPrograma(Programas programa) throws DataAccessException;

}
