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
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/Card.css'/>"> 
    </head>
    <body class="app sidebar-mini">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Administraci&oacute;n de usuarios - Eliminar</h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12"> 
                    <div class="Card-Informacion">
                        <div class="card border-secondary mb-3" style="max-width: 18rem;">
                            <div class="card-header text-center"><i class="fas fa-info-circle"></i>&nbsp;&nbsp;AVISO</div>
                            <div class="card-body text-secondary">  
                                <p class="card-text">Desea Eliminar este estudiante ${model.accion}?</p>
                                <form:form method="post" modelAttribute="model" action="${pageContext.request.contextPath}/${ruta}"> 
                                    <form:hidden path="id_usuario_estudiante"/>
                                    <form:hidden path="id_persona"/>  
                                    <button class="btn btn-primary" type='submit' value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="${pageContext.request.contextPath}/estudiante/retornarlistarUsuarios.fautapo?status=alert-danger&message=Se cancelo la eliminacion del registro del usuario ${model.accion}" id="btnsalir" ><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancelar</a>
                                </form:form>
                            </div>
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
    </body>
</html>