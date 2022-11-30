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
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Ver Plan de Estudios</h1>
                    <p>Programa: <c:out value="${programa.programa}"/> Plan: <c:out value="${datosPrgPlan.id_plan}"/></p>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-11">
                    <div class="tile">
                        <div class="table-responsive">
                            <c:set var="_nivel_ant" value="0"/>
                            <table class="tabla">
                                <tbody id="plancito">
                                    <c:forEach var="materia" items="${lMaterias}">
                                        <c:if test="${materia.nivel_academico!=_nivel_ant}"><tr><th><b>Nivel <c:out value="${materia.nivel_academico}"/></b></th></c:if>
                                            <td style="font-size: 9px; border: 1px solid black;" id="<c:out value="${materia.id_materia}"/>" name="celdilla" onClick="setMarcarRequisitos(this)">
                                                <c:out value="${materia.materia}"/><br><b><c:out value="${materia.sigla}"/></b>
                                            </td>
                                            <c:if test="${materia.nivel_academico!=_nivel_ant}"><c:set var="_nivel_ant" value="${materia.nivel_academico}"/></c:if>
                                        </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script language="JavaScript">
                                                var vRequisitos = new Array();
            <c:forEach var="lista" items="${lRequisitos}" varStatus="contador2">
                                                vRequisitos.push(new Array(${lista.id_materia},${lista.id_materia_ant}));
            </c:forEach>
                                                function setLimpiar() {
                                                    var celdillas = document.getElementsByName('celdilla');
                                                    for (var i = 0; i < celdillas.length; i++)
                                                        celdillas[i].className = '';
                                                }
                                                function setMarcarRequisitos(obj) {
                                                    setLimpiar();
                                                    obj.className = 'btn btn-primary btn-lg btn-block';
                                                    for (var i = 0; i < vRequisitos.length; i++)
                                                        if (vRequisitos[i][0] == obj.id)
                                                            document.getElementById(vRequisitos[i][1]).className = 'btn btn-warning btn-lg btn-block';
                                                }
        </script>
    </body>
</html>