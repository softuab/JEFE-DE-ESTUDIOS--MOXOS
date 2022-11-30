package org.fautapo.dao.ibatis;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.fautapo.dao.PlanesDao;
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
public class SqlMapPlanesDao extends SqlSessionDaoSupport implements PlanesDao {

    public List getPrgListarPlanes(Programas programa) throws DataAccessException {
        return getSqlSession().selectList("getPrgListarPlanes", programa);
    }

    public List getFclListarPlanes(Facultades facultad) throws DataAccessException {
        return getSqlSession().selectList("getFclListarPlanes", facultad);
    }

    public List getUnvListarPlanes(Universidades universidad) throws DataAccessException {
        return getSqlSession().selectList("getUnvListarPlanes", universidad);
    }

    public List getUnvGrdListarPlanes(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getUnvGrdListarPlanes", plan);
    }

    public List getPlnListarMateriasNivel(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getPlnListarMateriasNivel", plan);
    }

    public int getPlnListarNroNiveles(Planes plan) throws DataAccessException {
        return ((Integer) getSqlSession().selectOne("getPlnListarNroNiveles", plan)).intValue();
    }

    public List getPlnListarMateriasRequisitos(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getPlnListarMateriasRequisitos", plan);
    }

    public List getPlnListarMateriasNroRequisitos(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getPlnListarMateriasNroRequisitos", plan);
    }

    //ADMINISTRAR HORARIOS
    public List getListarPlanProgramaModeloAhorro(Modelos_ahorros materia) throws DataAccessException {
        return getSqlSession().selectList("getListarPlanProgramaModeloAhorro", materia);
    }

    public Planes getMtrBuscarPlanPrograma(Planes plan) throws DataAccessException {
        return (Planes) getSqlSession().selectOne("getMtrBuscarPlanPrograma", plan);
    }
    //FIN ADMINISTRAR HORARIOS

    //PGRAMACIONES COMO ESTUDIANTE
    public List getMncListarMenciones(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getMncListarMenciones", plan);
    }

    public int setEstRegistrarMencionEstudiante(Planes plan) throws DataAccessException {
        Integer i = (Integer) getSqlSession().selectOne("setEstRegistrarMencionEstudiante", plan);
        return i.intValue();
    }
    //FIN PGRAMACIONES COMO ESTUDIANTE

    // MI SEGUNDA PARTE
    public List getListarTiposGrados() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposGrados", null);
    }

    public Planes getBuscarTiposGrados(Planes plan) throws DataAccessException {
        return (Planes) getSqlSession().selectOne("getBuscarTiposGrados", plan);
    }

    public List getListarPrgPlanesActual(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarPrgPlanesActual", plan);
    }

    //  FIN MI SEGUNDA PARTE
    // INICIO - Convalidacion Automatica
    public List getListarMateriasPlanGrupo(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasPlanGrupo", plan);
    }

    public List getListarMateriasPlanGrupoCantidad(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasPlanGrupoCantidad", plan);
    }

    public List getListarMateriasPlan(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasPlan", plan);
    }

    public List getListarMateriasPlanAnterior(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasPlanAnterior", plan);
    }

    public List getListarMateriasPlanAnterior2(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasPlanAnterior2", plan);
    }

    public List getListarMateriasPlanConvalidado(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasPlanConvalidado", plan);
    }

    public int setRegistrarMtrPlan(Planes plan) throws DataAccessException {
        return ((Integer) getSqlSession().selectOne("setRegistrarMtrPlan", plan)).intValue();
    }

    public int setEliminarMtrPlan(Planes plan) throws DataAccessException {
        return ((Integer) getSqlSession().selectOne("setEliminarMtrPlan", plan)).intValue();
    }

    public Planes getMncBuscarMencion(Planes plan) throws DataAccessException {
        return (Planes) getSqlSession().selectOne("getMncBuscarMencion", plan);
    }

    public Planes getBuscarMateriaPlan(Planes plan) throws DataAccessException {
        return (Planes) getSqlSession().selectOne("getBuscarMateriaPlan", plan);
    }
    // FIN - Convalidacion Automatica

    //INICIO- Admin Planes de Estudio
    public List getListarMateriasPlanRequisitos(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasPlanRequisitos", plan);
    }

    public List getListarMateriasElectivasPlan(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasElectivasPlan", plan);
    }

    public List getListarMateriasPlanMencion(Planes plan) throws DataAccessException {
        System.out.println("id_programa---------" + plan.getId_mencion());
        System.out.println("id_plan---------" + plan.getId_plan());
        System.out.println("id_tipo_grado---------" + plan.getId_tipo_grado());
        System.out.println("id_mencion---------" + plan.getId_mencion());
        return getSqlSession().selectList("getListarMateriasPlanMencion", plan);
    }

    public List getListarMateriasRequisitos(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasRequisitos", plan);
    }

    public List getListarMateriasNoRequisitos(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasNoRequisitos", plan);
    }

    public List getListarMateriasConvalidadas(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasConvalidadas", plan);
    }

    public List getListarMateriasNoConvalidadas(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasNoConvalidadas", plan);
    }

    public List getListarMateriasNoPlan(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasNoPlan", plan);
    }

    public List getPlnListarTiposMaterias() throws DataAccessException {
        return getSqlSession().selectList("getPlnListarTiposMaterias", null);
    }

    public Planes getPlnBuscarTipoMateria(Planes plan) throws DataAccessException {
        return (Planes) getSqlSession().selectOne("getPlnBuscarTipoMateria", plan);
    }

    public Planes getBuscarPrgPlan(Planes plan) throws DataAccessException {
        return (Planes) getSqlSession().selectOne("getBuscarPrgPlan", plan);
    }

    public Planes getBuscarPrgPlan2(Planes plan) throws DataAccessException {
        return (Planes) getSqlSession().selectOne("getBuscarPrgPlan2", plan);
    }

    public Planes getBuscarMtrPlan(Planes plan) throws DataAccessException {
        return (Planes) getSqlSession().selectOne("getBuscarMtrPlan", plan);
    }

    public int setModificarMtrPlan(Planes plan) throws DataAccessException {
        return ((Integer) getSqlSession().selectOne("setModificarMtrPlan", plan)).intValue();
    }
    //FIN - Admin Planes de Estudio

    public List getListarPrgPlanesVestibulares() throws DataAccessException {
        return getSqlSession().selectList("getListarPrgPlanesVestibulares", null);
    }

    public List getListarPrgPlanesUniversitarios() throws DataAccessException {
        return getSqlSession().selectList("getListarPrgPlanesUniversitarios", null);
    }

    public Planes getBuscarMaxPrgPlanActual(Planes plan) throws DataAccessException {
        return (Planes) getSqlSession().selectOne("getBuscarMaxPrgPlanActual", plan);
    }

    public List getListarMateriasPlanTipoGrado(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasPlanTipoGrado", plan);
    }

    //Convalidacion Manual
    public List getListarTiposConvalidaciones() throws DataAccessException {
        return getSqlSession().selectList("getListarTiposConvalidaciones", null);
    }

    public Planes getBuscarTipoConvalidacion(Planes plan) throws DataAccessException {
        return (Planes) getSqlSession().selectOne("getBuscarTipoConvalidacion", plan);
    }

    public int setRegistrarConvalidacionManual(Planes plan) throws DataAccessException {
        return ((Integer) getSqlSession().selectOne("setRegistrarConvalidacionManual", plan)).intValue();
    }

    public int setRegistrarDetallesConvalidacionManual(Planes plan) throws DataAccessException {
        return ((Integer) getSqlSession().selectOne("setRegistrarDetallesConvalidacionManual", plan)).intValue();
    }
    //Fin Convalidacion Manual

    //Autorizar Convalidacion Manual
    public List getListarConvalidacionManualPrograma(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarConvalidacionManualPrograma", plan);
    }

    public List getListarConvalidacionManualPrograma2(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarConvalidacionManualPrograma2", plan);
    }

    public Planes getBuscarConvalidacionManual(Planes plan) throws DataAccessException {
        return (Planes) getSqlSession().selectOne("getBuscarConvalidacionManual", plan);
    }

    public List getListarCnvDetallesConvalidacion(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarCnvDetallesConvalidacion", plan);
    }

    public List getListarCnvDetallesConvalidacion2(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarCnvDetallesConvalidacion2", plan);
    }

    public List getListarNotasCruceCnvDetalles(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarNotasCruceCnvDetalles", plan);
    }

    public int setRegistrarEstNotasConvalidacionManual(Planes plan) throws DataAccessException {
        return ((Integer) getSqlSession().selectOne("setRegistrarEstNotasConvalidacionManual", plan)).intValue();
    }

    public int setEliminarCnvDetalle(Planes plan) throws DataAccessException {
        return ((Integer) getSqlSession().selectOne("setEliminarCnvDetalle", plan)).intValue();
    }
    //Fin Autorizar Convalidacion Manual

    @Override
    public List<Planes> getListarMateriasElectivasOptativasPlan(Planes plan) throws DataAccessException {
        return getSqlSession().selectList("getListarMateriasElectivasOptativasPlan", plan);
    }

    @Override
    public List<ItemFacult> GetCarrerasOrfertadas(ConvalidacionModel model) throws DataAccessException {
        return getSqlSession().selectList("GetCarrerasOrfertadas", model);
    }
    @Override
    public List<ItemFacult> GetCarrerasConvalidar(ConvalidacionModel model) throws DataAccessException {
        return getSqlSession().selectList("GetCarrerasConvalidar", model);
    }

}
