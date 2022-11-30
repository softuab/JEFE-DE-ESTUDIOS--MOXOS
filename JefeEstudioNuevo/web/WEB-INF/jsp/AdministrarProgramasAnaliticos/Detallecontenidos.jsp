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
        <script src="<c:url value='/Public/App/ProgramaAnalitico/mainContenidos.js'/>"></script>        
    </head>
    <body> 
        <br/>
        <div id="contenidocontenido">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#idModalcontenido">
                <i class="fas fa-plus"></i> Registrar contenidos
            </button>
            <br/><br/>
            <span class="d-block p-2 bg-primary text-white"><i class="fas fa-address-card"></i>&nbsp;contenido</span>
            <div id="no-more-tables"> 
                <table id="id_tbl_contenido" class="col-md-12 table-bordered table-striped table-condensed cf">
                    <thead class="cf">
                        <tr>
                            <th>CONTENIDO</th>
                            <th>OBJETIVO <br/> INSTRUCTIVO</th>
                            <th>CONOCIMIENTOS</th>
                            <th>HABILIDADES</th>
                            <th>VALORES</th>
                            <th>OPCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="contenidos" items="${contenidos}" varStatus="contador">
                            <tr>
                                <td data-title="CONTENIDO">
                                    <c:out value="${contenidos.contenido}"/>
                                </td>
                                <td data-title="OBJETIVO INSTRUCTIVO">
                                    ${contenidos.objetivo_instructivo}
                                </td>
                                <td data-title="CONOCIMIENTOS">
                                    ${contenidos.conocimientos}
                                </td>
                                <td data-title="HABILIDADES">
                                    ${contenidos.habilidades}
                                </td>
                                <td data-title="VALORES">
                                    ${contenidos.valores}
                                </td>
                                <td data-title="OPCIONES">
                                    <div class="btn-group mr-2" role="group" aria-label="First group">
                                        <button type="button" class="btn btn-primary" data-contenido="detail" data-edit="${contenidos.id_prg_a_contenido}">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-contenido="delete" data-delete="${contenidos.id_prg_a_contenido}">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="modal fade" id="idModalcontenido" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">DATOS CONTENIDOS</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="id_contenido_dct_programa_analitico" value="${id_dct_programa_analitico}"/>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="contenido" placeholder="Contenido">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="objetivo_instructivo">Objetivo Instructivo:</label>
                                            <textarea  class="form-control" rows="5" id="objetivo_instructivo"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="conocimientos">Conocimientos:</label>
                                            <textarea  class="form-control" rows="5" id="conocimientos"></textarea> 
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="habilidades">Habilidades:</label>
                                            <textarea  class="form-control" rows="5" id="habilidades"></textarea> 
                                        </div>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="valores">valores:</label>
                                            <textarea  class="form-control" rows="5" id="valores"></textarea>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                            <button type="button" id="guardarcontenido" class="btn btn-primary" data-contenido="insert">Guardar Cambios</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="myModal_contenido">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">DATOS CRONOGRAMA</h4>
                            <button type="button" class="close" data-dismiss="modal">×</button>
                        </div>
                        <div id="content_contenido" class="modal-body">
                            <input type="hidden" id="id_prg_a_contenido_edit"/>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="contenido_edit" placeholder="Contenido">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="objetivo_instructivo">Objetivo Instructivo:</label>
                                            <textarea  class="form-control" rows="5" id="objetivo_instructivo_edit"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="conocimientos">Conocimientos:</label>
                                            <textarea  class="form-control" rows="5" id="conocimientos_edit"></textarea> 
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="habilidades">Habilidades:</label>
                                            <textarea  class="form-control" rows="5" id="habilidades_edit"></textarea> 
                                        </div>
                                    </div>
                                </div>
                                <div class="row"> 
                                    <div class="col">
                                        <div class="form-group">
                                            <label for="valores">valores:</label>
                                            <textarea  class="form-control" rows="5" id="valores_edit"></textarea>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                            <button type="button" id="guardardatoseditadoscontenido" class="btn btn-primary" data-contenido="update">Guardar Cambios</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
