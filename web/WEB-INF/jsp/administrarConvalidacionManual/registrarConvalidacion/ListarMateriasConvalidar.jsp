<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head> 
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="imagetoolbar" content="no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <title>Sistema Integrado - Moxos</title>
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>">
    </head>
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;MATERIAS DEL PLAN A CONVALIDAR</h1>
                    <p>Gestión: <c:out value="${gestion}"/> Periodo: <c:out value="${periodo}"/> Programa: <c:out value="${datosEstudiante.programa}"/></p>
                    <p>${usuario}</p> 
                </div>
            </div>
            <div class="row">
                <div class="col-12 ">
                    <div class="tile">
                        <section class="invoice">
                            <form:form method="post" modelAttribute="model" action="${pageContext.request.contextPath}/convalidacionManual/confirmarMateriasConvalidar.fautapo">
                                <input type="hidden" id="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="gestion" value="<c:out value='${gestion}'/>">
                                <input type="hidden" name="periodo" value="<c:out value='${periodo}'/>">
                                <input type="hidden" name="id_estudiante" value="<c:out value='${datosEstudiante.id_estudiante}'/>">
                                <input type="hidden" name="id_tipo_convalidacion"  value="<c:out value="${buscarTipoConv.id_tipo_convalidacion}"/>" >
                                <div class="row mb-4">
                                    <div class="col-6">
                                        <h3 class="page-header">Los campos con <font color='red'>(*)</font>, son obligatorios.</h3>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col-6">
                                        <h3 class="page-header">Convalidación Manual</h3>
                                    </div>
                                </div>
                                <div class="row invoice-info">
                                    <div class="col-6">
                                        <address>
                                            <strong>R.U.::</strong><c:out value="${datosEstudiante.id_estudiante}"/><br>
                                            <strong>NOMBRES:: </strong><c:out value="${datosEstudiante.paterno}"/> &nbsp; <c:out value="${datosEstudiante.materno}"/> &nbsp; <c:out value="${datosEstudiante.nombres}"/><br>
                                            <strong>PLAN:: </strong><c:out value="${datosEstudiante.id_plan}"/><br>
                                        </address>
                                    </div>
                                    <div class="col-6">
                                        <address>
                                            <strong>PROGRAMA:: </strong><c:out value="${datosEstudiante.programa}"/><br>
                                            <strong>GESTIÓN:: </strong><c:out value="${gestion}"/><br>
                                            <strong>PERIODO:: </strong><c:out value="${periodo}"/><br>
                                        </address>
                                    </div>
                                </div>
                                <hr>
                                <div class="row invoice-info">
                                    <div class="col-12">
                                        <div class="form-group row">
                                            <label class="control-label col-3"><strong>R.U. ::</strong></label>
                                            <div class="col-9">
                                                <c:out value="${datosEstudiante.id_estudiante}"/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label col-3"><strong>TIPO DE CONVALIDACIÓN ::</strong></label>
                                            <div class="col-9">
                                                <c:out value="${buscarTipoConv.tipo_convalidacion}"/>
                                            </div>
                                        </div>
                                        <c:if test="${buscarTipoConv.id_tipo_convalidacion ==1}" >
                                            <input type="hidden" name="id_programa" value="<c:out value='${datosEstudiante.id_programa}'/>">
                                            <div class="form-group row">
                                                <label class="control-label col-3"><strong>UNIVERSIDAD ::</strong></label>
                                                <div class="col-8">
                                                    <select class="form-control" id="id_universidad" name="id_universidad" required>
                                                        <c:forEach var="lista" items="${lUniversidades}" >
                                                            <option value='<c:out value="${lista.id_universidad}"/>' <c:if test="${lista.id_universidad == 0}">selected</c:if> >
                                                                <c:out value="${lista.universidad}"/> 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${buscarTipoConv.id_tipo_convalidacion ==2}" >
                                            <div class="form-group row">
                                                <label for="id_facultad" class="control-label col-3"><strong>FACULTAD</strong></label>
                                                <div class="col-8">
                                                    <form:select path="id_facultad"  data-url="${pageContext.request.contextPath}/cargarcarreras.fautapo"   class="form-control" required="true">
                                                        <option value="" disabled selected>Seleccionar facultad</option>
                                                        <form:options items="${lFacultades}" itemValue="id_facultad" itemLabel="facultad"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label for="id_programa" class="control-label col-3"><strong>PROGRAMA</strong></label>
                                                <div id="busquedaoferta" class="col-8"></div>
                                            </div>
                                        </c:if>
                                        <c:if test="${buscarTipoConv.id_tipo_convalidacion ==3}" >
                                            <input type="hidden" name="id_programa" value="<c:out value='${datosEstudiante.id_programa}'/>">
                                            <div class="form-group row">
                                                <label class="control-label col-3"><strong>PLAN ORIGEN <font color='red'>(*)</font> ::</strong></label>
                                                <div class="col-8" required>
                                                    <input name="plan_origen"  id="plan_origen" type="text" class="form-control" required>
                                                </div>
                                            </div>
                                        </c:if> 
                                        <div class="form-group row">
                                            <label class="control-label col-3"><strong>RESOLUCI&Oacute;N <font color='red'>(*)</font> ::</strong></label>
                                            <div class="col-8" required>
                                                <input name="resolucion" id="resolucion"class="form-control" type="text"   required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-12 table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>NRO.</th>
                                                    <th>SIGLA <br> ORIGEN</th>
                                                    <th>MATERIA <br> ORIGEN</th>
                                                    <th>SIGLA<br>ACTUAL</th>
                                                    <th>MATERIA<br>ACTUAL</th>
                                                    <th>MODALIDAD<br></th>
                                                    <th>% SIMILITUD</th>
                                                    <th>NOTA</th>
                                                    <th>GESTION</th>
                                                    <th>PERIODO</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="lista" items="${lMateriasSeleccionadas}" varStatus="contador">
                                                    <tr>
                                                        <td><c:out value="${contador.count}"/></td>
                                                        <td><input  class="form-control" type="text" name="sigla_origen<c:out value="${lista.id_materia}"/>" size="6" required></td>
                                                        <td><input  class="form-control" type="text" name="materia_origen<c:out value="${lista.id_materia}"/>" size="6" required=""></td>
                                                        <td><c:out value="${lista.sigla}"/></td>
                                                        <td><c:out value="${lista.materia}"/>
                                                            <input type="hidden" name="id_materia<c:out value="${lista.id_materia}"/>" value="<c:out value="${lista.id_materia}"/>">
                                                            <input type="hidden" name="id_materia_conv" value="<c:out value="${lista.id_materia}"/>">
                                                        </td>
                                                        <td>
                                                            <select  class="form-control" name="id_tipo_materia<c:out value='${lista.id_materia}'/>">
                                                                <c:forEach var="listaT" items="${lTiposMaterias}" >
                                                                    <option value='<c:out value="${listaT.id_tipo_materia}"/>' <c:if test="${listaT.id_tipo_materia == id_tipo_materia}">selected</c:if> >
                                                                        <c:out value="${listaT.tipo_materia}"/> 
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </td>
                                                        <td><input class="form-control" type="number" name="similitud<c:out value="${lista.id_materia}"/>"   onblur="validar(similitud<c:out value="${lista.id_materia}"/>, '9')"  size="3" maxlength="3" required></td>
                                                        <td><input class="form-control" type="number" name="nota_origen<c:out value="${lista.id_materia}"/>"  id='nota<c:out value="${lista.id_materia}"/>'  onblur="validar(nota_origen<c:out value="${lista.id_materia}"/>, '9');" onKeyUp="cargar_nota(nota_origen<c:out value="${lista.id_materia}"/>);"  size="3" maxlength="3" required></td>
                                                        <td><c:out value="${gestion}"/></td>
                                                        <td><c:out value="${periodo}"/></td>
                                                    </tr>  
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tile-footer">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-3">
                                            <button class="btn btn-primary" type='submit'  value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                            <form method="post" id="frmsalir" action="${pageContext.request.contextPath}/convalidacionManual/listarPlanEstudiante.fautapo">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="gestion" value="<c:out value='${gestion}'/>">
                                <input type="hidden" name="periodo" value="<c:out value='${periodo}'/>">
                                <input type="hidden" name="id_programa" value="<c:out value='${id_programa}'/>">
                                <input type="hidden" name="id_facultad" value="<c:out value='${id_facultad}'/>">
                                <input type='hidden' name="id_estudiante"  value="<c:out value="${datosEstudiante.id_estudiante}"/>" >
                            </form>
                        </section>
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/jquery.dataTables.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/dataTables.bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/funciones.js'/>"></script>
        <script src="<c:url value='/Public/Js/app/Convalidacion/mainfacultad.js'/>" type="module"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
        <script>
                                                            function cargar_nota(objeto) {
                                                                var nota_entrada = objeto.value;
                                                                if (nota_entrada > 100) {
                                                                    //alert("ENTRANDO PO SI--->"+ objeto.value);
                                                                    swal("Oops!", "El dato introducido: '" + objeto.value + "'  es mayor al permitido. Introduzca un número del 0 al 100", "error");
                                                                    // alert("La dato introducido: '" + objeto.value + "'  es mayor al permitido. Introduzca un número del 0 al 100");
                                                                    objeto.value = "";
                                                                }
                                                            }
                                                            iniciar();

        </script>  
    </body>
</html>