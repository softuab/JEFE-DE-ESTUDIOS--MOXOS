package org.fautapo.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.fautapo.domain.Planes;
import org.fautapo.domain.Programas;
import org.fautapo.domain.Facultades;
import org.fautapo.domain.Universidades;
import org.fautapo.domain.Modelos_ahorros;
import org.fautapo.model.ConvalidacionModel;
import org.fautapo.model.ItemFacult;
import org.fautapo.model.ItemModel;

/**
 * @autor FAUTAPO
 * @fec_registro 2005-11-01
 * @ult_usuario FAUTAPO
 * @fec_modificacion 2005-11-01
 */
public interface PlanesDao {

    List getPrgListarPlanes(Programas programa) throws DataAccessException;

    List getFclListarPlanes(Facultades facultad) throws DataAccessException;

    List getUnvListarPlanes(Universidades universidad) throws DataAccessException;

    List getPlnListarMateriasNivel(Planes plan) throws DataAccessException;

    int getPlnListarNroNiveles(Planes plan) throws DataAccessException;

    List getPlnListarMateriasRequisitos(Planes plan) throws DataAccessException;

    List getPlnListarMateriasNroRequisitos(Planes plan) throws DataAccessException;

    List getUnvGrdListarPlanes(Planes plan) throws DataAccessException;
    //ADMINISTRAR HORARIOS

    List getListarPlanProgramaModeloAhorro(Modelos_ahorros materia) throws DataAccessException;

    Planes getMtrBuscarPlanPrograma(Planes plan) throws DataAccessException;
    //FIN ADMINISTRAR HORARIOS
    //PROGRAMACION COMO ESTUDIANTE

    List getMncListarMenciones(Planes plan) throws DataAccessException;

    int setEstRegistrarMencionEstudiante(Planes plan) throws DataAccessException;
    //FIN PROGRAMACION COMO ESTUDIANTE

    //MI SEGUNDA PARTE
    List getListarTiposGrados() throws DataAccessException;

    Planes getBuscarTiposGrados(Planes plan) throws DataAccessException;

    List getListarPrgPlanesActual(Planes plan) throws DataAccessException;
    // FIN SEGUNDA PARTE
    // INICIO - Convalidacion automatica

    List getListarMateriasPlanGrupo(Planes plan) throws DataAccessException;

    List getListarMateriasPlanGrupoCantidad(Planes plan) throws DataAccessException;

    List getListarMateriasPlan(Planes plan) throws DataAccessException;

    List getListarMateriasPlanAnterior(Planes plan) throws DataAccessException;

    List getListarMateriasPlanAnterior2(Planes plan) throws DataAccessException;

    List getListarMateriasPlanConvalidado(Planes plan) throws DataAccessException;

    int setRegistrarMtrPlan(Planes plan) throws DataAccessException;

    int setEliminarMtrPlan(Planes plan) throws DataAccessException;

    Planes getMncBuscarMencion(Planes plan) throws DataAccessException;

    Planes getBuscarMateriaPlan(Planes plan) throws DataAccessException;
    // FIN - Convalidacion automatica

    //INICIO- Admin Planes de Estudio
    List getListarMateriasPlanRequisitos(Planes plan) throws DataAccessException;

    List getListarMateriasElectivasPlan(Planes plan) throws DataAccessException;

    List getListarMateriasPlanMencion(Planes plan) throws DataAccessException;

    List getListarMateriasRequisitos(Planes plan) throws DataAccessException;

    List getListarMateriasNoRequisitos(Planes plan) throws DataAccessException;

    List getListarMateriasConvalidadas(Planes plan) throws DataAccessException;

    List getListarMateriasNoConvalidadas(Planes plan) throws DataAccessException;

    List getListarMateriasNoPlan(Planes plan) throws DataAccessException;

    List getPlnListarTiposMaterias() throws DataAccessException;

    Planes getPlnBuscarTipoMateria(Planes plan) throws DataAccessException;

    Planes getBuscarPrgPlan(Planes plan) throws DataAccessException;

    Planes getBuscarPrgPlan2(Planes plan) throws DataAccessException;

    Planes getBuscarMtrPlan(Planes plan) throws DataAccessException;

    int setModificarMtrPlan(Planes plan) throws DataAccessException;
    //FIN - Admin Planes de Estudio

    List getListarPrgPlanesVestibulares() throws DataAccessException;

    List getListarPrgPlanesUniversitarios() throws DataAccessException;

    Planes getBuscarMaxPrgPlanActual(Planes plan) throws DataAccessException;
    //Plan por id_tipo_grado

    List getListarMateriasPlanTipoGrado(Planes plan) throws DataAccessException;
    //Convalidacion Manual

    List getListarTiposConvalidaciones() throws DataAccessException;

    Planes getBuscarTipoConvalidacion(Planes plan) throws DataAccessException;

    int setRegistrarConvalidacionManual(Planes plan) throws DataAccessException;

    int setRegistrarDetallesConvalidacionManual(Planes plan) throws DataAccessException;
    //Autorizar Convalidacion Manual

    List getListarConvalidacionManualPrograma(Planes plan) throws DataAccessException;

    List getListarConvalidacionManualPrograma2(Planes plan) throws DataAccessException;

    Planes getBuscarConvalidacionManual(Planes plan) throws DataAccessException;

    List getListarCnvDetallesConvalidacion(Planes plan) throws DataAccessException;

    List getListarCnvDetallesConvalidacion2(Planes plan) throws DataAccessException;

    List getListarNotasCruceCnvDetalles(Planes plan) throws DataAccessException;

    int setRegistrarEstNotasConvalidacionManual(Planes plan) throws DataAccessException;

    int setEliminarCnvDetalle(Planes plan) throws DataAccessException;

    List<Planes> getListarMateriasElectivasOptativasPlan(Planes plan) throws DataAccessException;

    List<ItemFacult> GetCarrerasOrfertadas(ConvalidacionModel model) throws DataAccessException;

    List<ItemFacult> GetCarrerasConvalidar(ConvalidacionModel model) throws DataAccessException;
    //Fin Convalidacion Manual

}
