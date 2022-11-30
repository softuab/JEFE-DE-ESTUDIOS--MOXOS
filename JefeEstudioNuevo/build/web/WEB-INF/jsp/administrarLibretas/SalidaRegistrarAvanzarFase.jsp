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
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>">  
        <link rel="stylesheet" href="<c:url value='/Public/Css/Card.css'/>"> 
    </head>
    <body> 
        <main class="app-content3">

            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
                    <p>${datosAsignacion.sigla} - ${datosAsignacion.materia} GRUPO ${datosAsignacion.grupo} </p>
                    <p><c:out value="${buscarPrograma.programa}"/> </p>
                    <p>Gestion: <c:out value="${datosAsignacion.gestion}"/> Periodo: <c:out value="${datosAsignacion.periodo}"/>  </p>
                </div>
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
                    <li class="breadcrumb-item">${datosAsignacion.fase}</li>
                </ul>
            </div>
            <div class="row">
                <div class="col-sm-12"> 
                    <div class="tile"> 
                        <div class="row">
                            <div class="col">
                                <div class="container">
                                    <c:if test="${mensaje != null}">
                                        <div class="Card-Informacion">
                                            <div class="card border-secondary mb-3" style="max-width: 18rem;">
                                                <div class="card-header"><i class="fas fa-exclamation-triangle"></i>&nbsp;&nbsp;ATENCION !!</div>
                                                <div class="card-body text-secondary"> 
                                                    <p class="card-text"> 
                                                        <c:out value="${mensaje}"/><br/>
                                                    </p>
                                                </div>
                                                <div class="card-footer text-center">
                                                    <div> 
                                                        <form name="formavolver" action="<c:url value="/definirEvaluacion/ListarAsignaciones.fautapo"/>" method="POST"
                                                            <input type="hidden" name="id_docente" value="<c:out value='${datosAsignacion.id_docente}'/>">
                                                            <input type="hidden" name="gestion"    value="<c:out value='${datosAsignacion.gestion}'/>">
                                                            <input type="hidden" name="periodo"    value="<c:out value='${datosAsignacion.periodo}'/>">	  
                                                            <input type="hidden" name="bandera"    value="1">
                                                            <input type="submit" name="volver" class="btn btn-primary" value="Retornar">
                                                        </form>  
                                                    </div>
                                                </div>
                                            </div>
                                        </div> 
                                    </c:if> 
                                </div> 
                            </div>
                        </div> 
                    </div> 

                </div>
            </div>
        </main>

        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script> 
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"></script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
    </body>
</html>
