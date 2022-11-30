<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/TableResponsive.css'/>">
        <link href="<c:url value='/Public/datetime/css/gijgo.min.css'/>" rel="stylesheet" type="text/css"/>
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script>  
        <script src="<c:url value='/Public/datetime/js/gijgo.min.js'/>"></script>  
        <script src="<c:url value='/Public/datetime/js/messages/messages.es-es.min.js'/>"></script> 
        <script src="<c:url value='/Public/App/ProgramaAnalitico/mainDistribuciontiempos.js'/>"></script>        
    </head>
    <body> 
        <br/>
        <div id="contenidoDistribuciontiempos">
            <input type="hidden" id="id_Distribuciontiempos_dct_programa_analitico" value="${id_dct_programa_analitico}"/>
            <button type="button" class="btn btn-success" id="RegistrarDistribucionTiempos">
                <i class="fas fa-plus"></i> Registrar Distribucion de Tiempos
            </button>
            <br/><br/>
            <span class="d-block p-2 bg-primary text-white"><i class="fas fa-address-card"></i>&nbsp;contenido</span>
            <div id="no-more-tables"> 
                <table id="id_tbl_DistribucionTiempos" class="col-md-12 table-bordered table-striped table-condensed cf">
                    <thead class="cf">
                        <tr>
                            <th>CONTENIDO</th>
                            <th>TIPOLOGIA DE <br/> CLASES</th>
                            <th>TRABAJO FUERA DE AULA</th>
                            <th>TOTAL HORAS</th>
                            <th>OPCIONES</th>
                        </tr>
                    </thead>
                    <tbody id="cuerpotabladistribucion">
                        <c:forEach var="obj" items="${distribuciontiempos}" varStatus="contador">
                            <tr data-fila="padre" data-selected="">
                                <td data-title="CONTENIDO">
                                    <c:out value="${obj.contenidos.contenido}"/>
                                </td>
                                <td data-title="TIPOLOGIA DE CLASES">
                                    <table class="table table-hover">
                                        <thead class="cf">
                                            <tr>
                                                <th colspan="3"><button data-id='${obj.id_prg_a_distribucion}' class="btn btn-success btn-sm btn-lg btn-block" onclick="MostrarModal(this)"><i class="fas fa-plus"></i>Formas de organizacion</button></th>
                                            </tr>
                                        </thead>
                                        <tbody id='tbl_formasdistribucion${obj.id_prg_a_distribucion}'>
                                            <c:forEach var="formasdistribucion" items="${obj.formasdistribucion}" varStatus="contador">
                                                <tr data-fila="hijo"> 
                                                    <td>
                                                        <i class="fas fa-stopwatch"></i> ${formasdistribucion.formas.formas} ${formasdistribucion.horas} horas
                                                    </td>          
                                                    <td class="text-right text-nowrap">
                                                        <button class="btn btn-sm btn-info btnformas" data-formasorganizacion='detail' data-edit="${formasdistribucion.id_prg_a_formas_distribucion}"><i class="fas fa-pencil-alt"></i></button>
                                                        <button class="btn btn-sm btn-warning btnformas" data-formasorganizacion='delete' data-delete="${formasdistribucion.id_prg_a_formas_distribucion}"> <i class="far fa-trash-alt"></i> </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </td>
                                <td data-title="TRABAJO FUERA DE AULA">
                                    ${obj.formatrabajoaula.sigla_formas}-${obj.formatrabajoaula.formas}
                                </td>
                                <td data-title="TOTAL HORAS">
                                    ${obj.totalhoras} Hrs.
                                </td>
                                <td data-title="OPCIONES">
                                    <div class="btn-group mr-2" role="group" aria-label="First group">
                                        <button type="button" class="btn btn-primary" data-distribuciontiempos="detail" data-edit="${obj.id_prg_a_distribucion}">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-distribuciontiempos="delete" data-delete="${obj.id_prg_a_distribucion}">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="modal fade" id="idModalDistribuciontiempos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">DATOS DISTRIBUCION DE TIEMPOS</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <select class="custom-select" name="id_prg_a_contenido" id="id_prg_a_contenido" required>
                                            </select>
                                            <div class="invalid-feedback">Seleccion invalida debe seleccionar el contenido</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <select class="custom-select" name="id_prg_a_formas_trabajo_aula" id="id_prg_a_formas_trabajo_aula" required>
                                            </select>
                                            <div class="invalid-feedback">Seleccion invalida debe seleccionar el tipo de trabajo de aula</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                            <button type="button" id="guardarDistribuciontiempos" class="btn btn-primary" data-distribuciontiempos="insert">Guardar Cambios</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="idModalDistribuciontiemposEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">DATOS DISTRIBUCION DE TIEMPOS</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <input type="hidden" id="id_prg_a_distribucion" />
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <select class="custom-select" name="id_prg_a_contenido" id="id_prg_a_contenidodistribucion_edit" required>
                                            </select>
                                            <div class="invalid-feedback">Seleccion invalida debe seleccionar el contenido</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <select class="custom-select" name="id_prg_a_formas_trabajo_aula" id="id_prg_a_formas_trabajo_aula_edit" required>
                                            </select>
                                            <div class="invalid-feedback">Seleccion invalida debe seleccionar el tipo de trabajo de aula</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                            <button type="button" id="guardarDistribuciontiempos" class="btn btn-primary" data-distribuciontiempos="update">Guardar Cambios</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="idModalformasdistribucion">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">DATOS FORMAS DE ORGANIZACION</h4>
                            <button type="button" class="close" data-dismiss="modal">×</button>
                        </div>
                        <div id="content_contenido" class="modal-body">
                            <input type="hidden" id="id_prg_a_distribucion_formas" />
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <select class="custom-select" name="id_prg_a_formas" id="id_prg_a_formas" required>
                                            </select>
                                            <div class="invalid-feedback">Seleccion invalida debe seleccionar el contenido</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="horas" id="horas" placeholder="Horas de trabajo" onkeypress="return isNumber(event)">
                                        </div>
                                    </div>
                                </div>
                            </div>                           
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="CerrarVentatana()" >Salir</button>
                            <button type="button" id="guardardatoseditadoscontenido" class="btn btn-primary btnformas" data-formasorganizacion="insert">Guardar Cambios</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="idModalformasdistribucionEdit">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">DATOS FORMAS DE ORGANIZACION</h4>
                            <button type="button" class="close" data-dismiss="modal">×</button>
                        </div>
                        <div id="content_contenido" class="modal-body">
                            <input type="hidden" id="id_prg_a_formas_distribucion_edit" />
                            <input type="hidden" id="id_prg_a_distribucion_formas_distribucion" />
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <select class="custom-select" name="id_prg_a_formas_edit" id="id_prg_a_formas_edit" required>
                                            </select>
                                            <div class="invalid-feedback">Seleccion invalida debe seleccionar el contenido</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="horas_edit" id="horas_edit" placeholder="Horas de trabajo" onkeypress="return isNumber(event)">
                                        </div>
                                    </div>
                                </div>
                            </div>                           
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                            <button type="button" id="guardardatoseditadoscontenido" class="btn btn-primary btnformas" data-formasorganizacion="update">Guardar Cambios</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
