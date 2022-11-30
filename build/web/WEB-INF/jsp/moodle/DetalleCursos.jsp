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
        <META name="_csrf" content="${_csrf.token}"/>
        <META name="_csrf_header" content="${_csrf.headerName}"/>
        <title>Sistema Integrado - Moxos</title>
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/Css/FontAwesome/css/fontawesome-all.css'/>">  
    </head>
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i> Administraci&oacute;n de Grupos</h1>
                    <p>Programa: <c:out value="${programa.programa}"/>  Gestíon: <c:out value="${gestion}"/> Periodo: <c:out value="${periodo}"/></p>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12"> 
                    <div class="tile">
                        <div class="tile-title-w-btn">
                            <h3 class="title">DETALLE CURSOS DOCENTES</h3>
                        </div>
                        <div class="tile-body">
                            <strong>Nombre Completo: </strong>${nombres}<br>
                            <strong>Materias: </strong>${sigla} - ${materias} - ${grupo}<br>
                            <strong>Matriculados: </strong>${cantiadadmatriculados}<br>
                            <strong>Recursos Subidos: </strong>${cantiadadrecursosPedagogicos}<br>
                            <strong>Cuestionarios: </strong>${cantiadadcuestionarioPedagogicos}<br>
                            <strong>Encuestas: </strong>${cantiadadNumeroEncuestasPedagogicos}<br>
                            <strong>Tareas Subidas: </strong>${cantiadadtareasPedagogicos}<br>
                            <strong>Enlaces: </strong>${cantiadadenlacesPedagogicos}<br>
                            <strong>Etiquetas: </strong>${cantiadadetiquetasPedagogicos}<br>
                            <strong>VideoConferencias: </strong>${cantiadadnumeroMettPedagogicos}<br>
                            <strong>Planfica Clases en Moodle: </strong>${cantiadadPlanificarCursos}<br>
                            <strong>Detalle Cursos: </strong><a class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">Ver Detalle </a><br>
                        </div>
                    </div>
                </div>
            </div>
          
        </main>
    </form>
    <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
    <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/main.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/jquery.dataTables.min.js'/>"></script>
    <script src="<c:url value='/Public/Js/plugins/dataTables.bootstrap.min.js'/>"></script>
    <script type="text/javascript">$('#tablagrupo').DataTable();</script>
</body>
</html>