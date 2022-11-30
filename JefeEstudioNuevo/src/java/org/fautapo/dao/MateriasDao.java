package org.fautapo.dao;

import java.util.List;
import org.fautapo.domain.AreasConocimientoMaterias;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Materias;
import org.fautapo.domain.Planes;
import org.fautapo.util.ListViewItem;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
 */
public interface MateriasDao {
    //PLANES

    List getPlnListarMaterias(Planes plan) throws DataAccessException;
    //FIN PLANES

    //LIBRETAS
    Materias getMtrBuscarMateria(Materias materia) throws DataAccessException;
    // FIN LIBRETAS

    //EST_ PROGRAMACIONES
    List getEstPrgListarProgramacionMateriasAut(Materias materia) throws DataAccessException;

    List getDptoListarMateriaGrupo(Materias materia) throws DataAccessException;

    List getPstPrgListarProgramacionMateriasAut(Materias materia) throws DataAccessException;
    //FIN EST_ PROGRAMACIONES

    //PROGRAMACIONES COMO ESTUDIANTE
    List getEstListarProgramacionMateriasReq(Materias materia) throws DataAccessException;
    //FIN PROGRAMACIONES COMO ESTUDIANTE

    //Programacion automatica
    Materias getDptoListarMateriaGrupoMinimo(Materias materia) throws DataAccessException;
    //Fin Programacion automatica

    List getListarMateriasGradoPlanPrograma(Materias materia) throws DataAccessException;

    //INICIO - Admin Materias
    List getListarMateriasPorDepartamento(Materias materia) throws DataAccessException;

    List getListarMateriasPorSigla(Materias materia) throws DataAccessException;

    List getListarMateriasPorMateria(Materias materia) throws DataAccessException;

    Materias getMtrBuscarTipoMateria(Materias materia) throws DataAccessException;

    List getMtrListarTiposMaterias() throws DataAccessException;

    int setRegistrarMateria(Materias materia) throws DataAccessException;

    int setEliminarMateria(Materias materia) throws DataAccessException;

    int getBuscar_nro_excepcion_calendario(Materias materia) throws DataAccessException;

    //FIN - Admin Materias  
    List<AreasConocimientoMaterias> GetListaAreasConocimientoMaterias(Materias materia) throws DataAccessException;

    AreasConocimientoMaterias GetAreasConocimientoMaterias(Integer id_areas_materias) throws DataAccessException;

    List<ListViewItem> GetListaMateriasPlan(Materias materia) throws DataAccessException;

    Integer InsertarAreaConocimiento(AreasConocimientoMaterias materia) throws DataAccessException;

    Integer ActualizarAreaConocimiento(AreasConocimientoMaterias materia) throws DataAccessException;

    Integer EliminarAreaConocimiento(AreasConocimientoMaterias materia) throws DataAccessException;

    List<ListViewItem> GetListaPlanes(Integer id_programa) throws DataAccessException;
}
