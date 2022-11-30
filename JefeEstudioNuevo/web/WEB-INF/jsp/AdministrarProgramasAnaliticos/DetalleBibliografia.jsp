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
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script>  
        <script src="<c:url value='/Public/datatables/datatables.min.js'/>"></script>  
        <script src="<c:url value='/Public/App/ProgramaAnalitico/mainbibliografia.js'/>"></script>        
    </head>
    <body> 
        <br/>
        <div id="contenidobibliografia">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#idModalBibliografia">
                <i class="fas fa-plus"></i> Registrar bibliografia
            </button>
            <br/><br/>
            <span class="d-block p-2 bg-primary text-white"><i class="fas fa-address-card"></i>&nbsp;Bibliografia</span>
            <div id="no-more-tables"> 
                <table id="id_tbl_bibliografia" class="col-md-12 table-bordered table-striped table-condensed cf">
                    <thead class="cf">
                        <tr>
                            <th>TITULO</th>
                            <th>AUTHOR</th>
                            <th>LUGAR EDICION</th>
                            <th>AÑO</th>
                            <th>PAGINA</th>
                            <th>UBICACION</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="bibliografia" items="${bibliografias}" varStatus="contador">
                            <tr>
                                <td data-title="TITULO">
                                    <c:out value="${bibliografia.titulo}"/>
                                </td>
                                <td data-title="AUTHOR">
                                    <c:out value="${bibliografia.autor}"/>
                                </td>
                                <td data-title="LUGAR EDICION">
                                    <c:out value="${bibliografia.lugar_edicion}"/>
                                </td>
                                <td data-title="AÑO">
                                    <c:out value="${bibliografia.anio}"/>
                                </td>
                                <td data-title="PAGINA">
                                    <c:out value="${bibliografia.paginas}"/>
                                </td>
                                <td data-title="UBICACION">
                                    <c:out value="${bibliografia.ubicacion}"/>
                                </td>
                                <td data-title="">
                                    <div class="btn-group mr-2" role="group" aria-label="First group">
                                        <button type="button" class="btn btn-primary" data-bibliografia="detail" data-edit="${bibliografia.id_prg_a_bibliografia}">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-primary" data-bibliografia="delete" data-delete="${bibliografia.id_prg_a_bibliografia}">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="modal fade" id="idModalBibliografia" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">DATOS BIBLIOGRAFICOS</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="id_dct_programa_analitico" value="${id_dct_programa_analitico}"/>
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="titulo" placeholder="Titulo del libro">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="autor" placeholder="Author del libro">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="lugar_edicion" placeholder="Lugar de edicion del libro">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="anio" placeholder="Año">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="paginas" placeholder="Paginas">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="ubicacion" placeholder="Ubicacion del libro">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                            <button type="button" id="guardarbibliografia" class="btn btn-primary" data-bibliografia="insert">Guardar Cambios</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">DATOS BIBLIOGRAFICOS</h4>
                            <button type="button" class="close" data-dismiss="modal">×</button>
                        </div>

                        <!-- Modal body -->
                        <div id="content" class="modal-body">

                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                            <button type="button" id="guardardatoseditadosbibliografia" class="btn btn-primary" data-bibliografia="update">Guardar Cambios</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
