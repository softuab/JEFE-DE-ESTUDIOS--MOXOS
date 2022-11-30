<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" /> 
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        <title>Sistema Integrado -  Moxos</title>  
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>"> 
        <link rel="stylesheet" href="<c:url value='/Public/Css/Cardcalendar.css'/>" > 
    </head>
    <body class="app sidebar-mini rtl">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp; ${usuario}</h1>
                    <p>Detalle de calendarios de calificaciones por materias  en el periodo ${periodo}/${gestion}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron bg-warning">
                        
                        <h1 class="display-4"><img src="<c:url value='/imagenes/calendaricon.png'/>"/> Aviso, importante!</h1>
                        <hr class="my-4">
                        <p class="text-center"><b>Resolución Rectoral Nro 13-A/2017
                                27 de Enero de 2017
                                Reglamento de Introducción de Registro de Calificaciones de la U.A.B.</b></p>
                        <p> <b>Articulo 8</b>  <br/>
                            El incumplimiento de los plazos establecidos en el Calendario Académico
                            para cada periodo o gestión académica vigente, para el registro
                            de calificaciones serán consideradas a los docentes como una
                            infracción y estarán sujeras a sanciones discipliniarias de acuerdo
                            a lo establecido en el presente reglamento y reglamento de administración
                            de personal.</p>
                        <a class="btn btn-primary btn-lg" href="https://www.uabjb.edu.bo/uabjb/images//NORMATIVA/Reglamentoregistrocalificaciones.pdf" role="button">Leer mas..</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <c:forEach items="${ListaCarreraDetalle}" var="value">
                            <div class="row row-striped">
                                <div class="col-3 text-center">
                                    <h1 class="title"><span class="badge badge-secondary">${value.periodo}/${value.gestion}</span></h1>
                                </div>
                                <div class="col-9">
                                    <h5 class="text-uppercase"><strong>${value.titulo}</strong></h5>
                                    <ul class="list-inline">
                                        <li class="list-inline-item"><i class="far fa-calendar-alt"></i> ${value.fechainicio}</li>
                                            <c:if test="${value.fechainicio != value.fechafin}">
                                            <li class="list-inline-item"><i class="far fa-calendar-alt"></i> ${value.fechafin}</li>
                                            </c:if>	
                                        <li class="list-inline-item"><i class="fa fa-location-arrow" aria-hidden="true"></i> ${value.carrera}</li>
                                    </ul>
                                    <p>${value.observacion}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </main>

        <script src="<c:url value='/Public/jquery/jquery-3.3.1.slim.min.js'/>"></script>
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>"></script>         
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script> 

    </body>
</html>
