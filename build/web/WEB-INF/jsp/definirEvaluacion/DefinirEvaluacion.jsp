<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="imagetoolbar" content="no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <title>Sistema Integrado -  Moxos</title>  
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/Card.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/CardProfile.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/TableData.css'/>">
        <!--<![endif]-->
    </head>
    <body  class="app sidebar-mini rtl">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
                    <p>${datosAsignacion.sigla} - ${materia} GRUPO ${datosAsignacion.grupo} -  ${periodo}/ ${gestion} </p>
                    <p><c:out value="${programa}"/> </p>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item">${datosAsignacion.fase}</li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <span class="d-block p-2 bg-primary text-white"><i class="fas fa-edit"></i> &nbsp; Tipo de Evaluaci&oacute;n :&nbsp;<c:out value="${datosAsignacion.tipo_evaluacion}"/></span>
                        <div class="row">
                            <div class="col">
                                <div id="data-tables" class="table-responsive">
                                    <form:form commandName="fevaluacion">

                                        <c:set var = "sumapoderado" value = "${0}"/>
                                        <table id="tbl_definirnotas" class="col-md-12 table-bordered table-striped table-condensed table-hover cf">
                                            <thead class="cf">
                                                <tr>
                                                    <th>Nro.</th>
                                                    <th>TIPO NOTA</th>
                                                    <th>C.A</th>
                                                    <th>CANTIDAD</th>
                                                    <th>P.A</th>
                                                    <th>PORCENTAJE</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="nota" items="${lTiposNotas}" varStatus="contador">
                                                    <tr>
                                                        <td><c:out value="${contador.count}"/></td>
                                                        <td><c:out value="${nota.tipo_nota}"/></td>
                                                        <td><c:out value="${nota.cantidad}"/></td>
                                                        <c:if test="${nota.cantidad==0}">
                                                            <td>
                                                                <input type="number" id="cantidad<c:out value="${nota.id_tipo_nota}"/>" value="<c:out value="${nota.cantidad}"/>" maxlenght="3" class="checkinput" size="3" onkeyup='ValidarSinumero(this.value, this, "btnaceptar", 1, 100)' required></td> 
                                                            </c:if>
                                                            <c:if test="${nota.cantidad>=1}">
                                                            <td>
                                                                <input type="number" id="cantidad<c:out value="${nota.id_tipo_nota}"/>" value="<c:out value="${nota.cantidad}"/>" class="invisible">
                                                                <c:out value="${nota.cantidad}"/></td> 
                                                            </c:if>

                                                        <td><c:out value="${nota.ponderacion}"/></td>

                                                        <c:if test="${nota.ponderacion==0}">
                                                            <td><input type="number" id="ponderacion<c:out value="${nota.id_tipo_nota}"/>" value="<c:out value="${nota.ponderacion}"/>" maxlenght="3" class="checkinput" size="3"  onkeyup='ValidarSinumero(this.value, this, "btnaceptar", 1, 100)' required></td>
                                                            </c:if>
                                                            <c:if test="${nota.ponderacion>=1}">
                                                            <td>
                                                                <input type="number" id="ponderacion<c:out value="${nota.id_tipo_nota}"/>" value="<c:out value="${nota.ponderacion}"/>" class="invisible">
                                                                <c:out value="${nota.ponderacion}"/></td>
                                                            </c:if>
                                                            <c:set var="sumapoderado" value="${sumapoderado +nota.ponderacion}"/>
                                                    </tr>
                                                </c:forEach>   
                                            </tbody>
                                        </table>

                                        <input type=hidden id="id_asignacion"      value="<c:out value="${id_asignacion}"/>" >        
                                        <input type=hidden id="id_programa"        value="<c:out value="${id_programa}"/>" >
                                        <input type=hidden id="id_fase"            value="<c:out value="${datosAsignacion.id_fase}"/>" >
                                        <input type=hidden id="id_tipo_evaluacion" value="<c:out value="${datosAsignacion.id_tipo_evaluacion}"/>" >
                                        <input type=hidden id="id_modelo_ahorro"   value="<c:out value="${datosAsignacion.id_modelo_ahorro}"/>" >
                                        <input type=hidden id="id_departamento"    value="<c:out value="${id_departamento}"/>" > 
                                        <div class="text-center"> 
                                            <c:if test="${sumapoderado!=100}">
                                                <input type="submit"  id="btnaceptar" class="btn btn-primary visible" value="Aceptar">
                                            </c:if>
                                            <c:if test="${sumapoderado==100}">
                                                <input type="submit"  id="btnaceptar" class="btn btn-primary invisible" value="Aceptar">
                                            </c:if>
                                        </div>
                                    </form:form> 
                                </div>
                            </div>
                            <div class="col">
                                <div class="Card-Informacion">
                                    <div class="card border-secondary mb-3" style="max-width: 18rem;">
                                        <div class="card-header"><i class="fas fa-info-circle"></i>&nbsp;&nbsp;ACLARACIONES:</div>
                                        <div class="card-body text-secondary"> 
                                            <p class="card-text"> 
                                                <b><font color="red">* TIPO NOTA:</font></b> Actividades a ser evaluadas.<br/>
                                                <b><font color="red">* C.A:</font></b> Cantidad actual de actividades a ser evaluadas.<br/>
                                                <b><font color="red">* CANTIDAD:</font></b> Numero de actividades a ser evaluadas.<br/>
                                                <b><font color="red">* P.A:</font></b> Ponderación actual de las actividades a ser evaluadas.<br/>
                                                <b><font color="red">* PORCENTAJE:</font></b> Valor porcentual de las actividades a ser evaluadas.<br/>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                    <input type="hidden" id="datosjson" value="<c:out value="${JsonTiposNotas}"/>">
                </div>
            </div>
        </main>
        <!-- Essential javascripts for application to work-->
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script> 
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/bootstrap-notify.min.js'/>"></script>
        <script src="<c:url value="/Public/SweetAlert2/sweetalert.min.js"/>"></script>
        <script src="<c:url value='/Public/App/Definirevaluacion/definirEvaluacin.js'/>"></script>
        <script src="<c:url value='/Public/Js/FuncionesOperaciones.js'/>"></script>
    </body>
</html>