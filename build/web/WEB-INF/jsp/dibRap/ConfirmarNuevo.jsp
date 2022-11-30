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
                    <h1><i class="far fa-address-card"></i>&nbsp;Agregando <c:out value="${tabla.etiqueta}" /></h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <form name='forma' method="post" action="<c:url value='/dibRap/registrarNuevo.fautapo'/>">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
                            <input type="hidden" name="t" value='<c:out value="${tabla.id_tabla}"/>' >
                            <input type="hidden" name="e" value='<c:out value="${id_enlace}"/>' >
                            <input type="hidden" name="p" value="<c:out value='${permiso}' />">
                            <input type="hidden" name="f" value="<c:out value='${condicion}' />">
                            <input type="hidden" name="a" value="<c:out value='${id_actividad}' />">
                            <div class="col table-responsive">
                                <table id="tablagrupo" class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th colspan="3" align="center">CONFIRME LOS DATOS</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="listaCampos" items="${listaCampos}" varStatus="contador">
                                            <c:if test="${listaCampos.x == 1}" >
                                                <tr>
                                                </c:if>
                                                <td class="etiqueta"><c:out value="${listaCampos.etiqueta}"/></td>
                                                <td class="etiqueta">::</td>
                                                <td>
                                                    <!--  INICIO JOJO  -->
                                                    <c:if test="${!empty listaCampos.combo}">
                                                        <c:out value="${listaCampos.detalle}"/>
                                                    </c:if>
                                                    <c:if test="${empty listaCampos.combo}">
                                                        <c:out value="${listaCampos.valores}"/>
                                                    </c:if>
                                                    <!--  FIN JOJO  -->
                                                    <input type="hidden" name='<c:out value="${listaCampos.campo}"/>' value='<c:out value="${listaCampos.valores}" />' >
                                                </td>
                                                <!-- /tr -->
                                            </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="tile-footer">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3">
                                        <button class="btn btn-primary" type='submit'  value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Aceptar</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="#" id="btnsalir"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                    </div>
                                </div>
                            </div>
                            <div class="nota">
                                A los campos '<font color='red'>&lt;NULL&gt;</font>' se les asignar&aacute; un valor por defecto.
                            </div>
                        </form>  
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script> 
        <script src="<c:url value='/Public/Js/plugins/select2.min.js'/>" type="text/javascript"></script>
        <script src="<c:url value="/Public/Js/app/grupo/retroceder.js"/>" type="module"></script>
    </body>
</html>

