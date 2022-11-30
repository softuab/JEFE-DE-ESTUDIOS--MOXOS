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
        <link rel="stylesheet" href="<c:url value='/Public/Css/Card.css'/>"> 
    </head>
    <body>
        <section class="material-half-bg">
            <div class="cover"></div>
        </section>
        <section class="lockscreen-content">
            <div class="lock-box">
                <img class="rounded-circle user-image" src="${simagen}">
                <h4 class="text-center user-image"><c:out value="${nombres}"/></h4>
                <p class="text-center text-muted">Cambio Clave(PIN)</p>
                <form:form method="post" modelAttribute="model"
            </div>
        </section>



        <%@ include file="../../Superior.jsp" %>
        <jsp:useBean id="now" class="java.util.Date"/>
    <body onload='inicio(document.forma.clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />)'>
        <script language='JavaScript' SRC="./validar.js"></script>
    <body onload='inicio(document.forma.clave)'>

        <div class="titulo"> Cambio clave(PIN) </div>
        <br>

        <form name="forma" action="<c:url value="/cambioPinEstudiante/entrada.fautapo"/>" method="POST">
            <input type="hidden" name="hora"     value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
            <input type="hidden" name="bandera"  value="<c:out value="${bandera}"/>" >    
            <table class="formulario" >
                <tr>
                    <th colspan="3" align="center">Introduzca los datos</th>
                </tr>    
                <tr>
                    <td class="etiqueta">Estudiante</td>
                    <td class="etiqueta">::</td>
                    <td>
                        <c:out value="${nombres}"/>
                    </td>
                </tr>
                <tr>
                    <td class="etiqueta">Clave(PIN)</td>
                    <td class="etiqueta">::</td>
                    <td>
                        <input type="password" maxlength="30" name='clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />'>
                    </td>
                <tr>    
                    <td colspan="3" align="center"> <input class="siguiente" type="submit" name="buscar" value='Buscar'></td>
                </tr>
            </table>
        </form>
        <%@ include file="../../Inferior.jsp" %>

