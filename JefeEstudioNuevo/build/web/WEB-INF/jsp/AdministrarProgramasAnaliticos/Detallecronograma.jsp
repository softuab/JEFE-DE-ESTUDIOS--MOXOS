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
        <script src="<c:url value='/Public/App/ProgramaAnalitico/maincronograma.js'/>"></script>        
    </head>
    <body> 
        <br/>
        <div id="contenidocronograma">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#idModalCronograma">
                <i class="fas fa-plus"></i> Registrar cronograma
            </button>
            <br/><br/>
            <span class="d-block p-2 bg-primary text-white"><i class="fas fa-address-card"></i>&nbsp;Cronograma</span>
            <div id="no-more-tables"> 
                <table id="id_tbl_cronograma" class="col-md-12 table-bordered table-striped table-condensed cf">
                    <thead class="cf">
                        <tr>
                            <th>INICIO</th>
                            <th>FIN</th>
                            <th>TIPO DE CLASE</th>
                            <th>TITULO DE CLASE</th>
                            <th>TIEMPO A EMPLEAR(HRS)</th>
                            <th>OBSERVACION</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cronograma" items="${cronograma}" varStatus="contador">
                            <tr>
                                <td data-title="INICIO">
                                    <c:out value="${cronograma.descripcion_inicio}"/>
                                </td>
                                <td data-title="FIN">
                                    <c:out value="${cronograma.descripcion_fin}"/>
                                </td>
                                <td data-title="TIPO DE CLASE">
                                    <c:out value="${cronograma.tipo_de_clase}"/>
                                </td>
                                <td data-title="TITULO DE CLASE">
                                    <c:out value="${cronograma.titulo_de_clase}"/>
                                </td>
                                <td data-title="TIEMPO A EMPLEAR(HRS)">
                                    <c:out value="${cronograma.tiempo_a_emplear}"/>
                                </td>
                                <td data-title="OBSERVACION">
                                    <c:out value="${cronograma.observaciones}"/>
                                </td>
                                <td data-title="">
                                    <div class="btn-group mr-2" role="group" aria-label="First group">
                                        <button type="button" class="btn btn-primary" data-cronograma="detail" data-edit="${cronograma.id_prg_a_cronograma}">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-cronograma="delete" data-delete="${cronograma.id_prg_a_cronograma}">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="modal fade" id="idModalCronograma" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">DATOS CRONOGRAMA</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="id_cronograma_dct_programa_analitico" value="${id_dct_programa_analitico}"/>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text"  id="idinicio" placeholder="inicio de la actividad">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" id="idfin" placeholder="fin de la actividad">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="idtipo_de_clase" placeholder="Tipo de clase">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="idtitulo_de_clase" placeholder="Titulo de Clase">
                                        </div>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="idtiempo_a_emplear" placeholder="Tiempo a emplear expresado en horas">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="idobservaciones" placeholder="Observaciones">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                            <button type="button" id="guardarbibliografia" class="btn btn-primary" data-cronograma="insert">Guardar Cambios</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="myModal_cronograma">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">DATOS CRONOGRAMA</h4>
                            <button type="button" class="close" data-dismiss="modal">×</button>
                        </div>

                        <!-- Modal body -->
                        <div id="content_cronograma" class="modal-body">

                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                            <button type="button" id="guardardatoseditadoscronograma" class="btn btn-primary" data-cronograma="update">Guardar Cambios</button>
                        </div>

                    </div>
                </div>
            </div>
            <script>
                var config;
                config = {
                    locale: 'es-es',
                    uiLibrary: 'bootstrap4'
                };
                $('#idinicio').datepicker(config);
                $('#idfin').datepicker(config);
            </script>
        </div>
    </body>
</html>
