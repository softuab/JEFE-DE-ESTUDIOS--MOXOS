<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset=UTF-8">
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
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i> Administrar Designaciones</h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <!-- <div class="row">
                 <div class="col-sm-12">
                     <div class="tile">
                         <form name=formavolver<c:out value="${contador.count}"/> method=post action='<c:url value="/docentes/verProgramaPlanAsignacion.fautapo"/>'>
                             <input type="hidden" name="id_programa" value="<c:out value='${id_programa}'/>">
                             <input type="hidden" name="id_prg_plan"     value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
                             <input type="hidden" name="gestion"     value="<c:out value='${gestion}'/>">
                             <input type="hidden" name="periodo"     value="<c:out value='${periodo}'/>">	
                             <input type="hidden" name="ibuscarResultadoFaseResolucion"     value="<c:out value='${ibuscarResultadoFaseResolucion}'/>">		  
                             <input type="hidden" name="bandera"     value='1'>
                         </form>
                     </div>
                 </div>
             </div> -->
            <div class="Card-Informacion">
                <div class="card border-secondary mb-3" style="max-width: 18rem;">
                    <div class="card-header text-center"><i class="fas fa-info-circle"></i>&nbsp;&nbsp;AVISO</div>
                    <div class="card-body text-secondary">  
                        <p class="card-text text-center"> 
                            <c:out value="${mensaje}"/><br/></p>

                        <c:if test="${mensaje != null}">
                            <center><div class="cuadroAviso"><c:out value="${mensaje}"/></div> </center>
                            </c:if>
                            <c:if test="${datosAsignacion.id_fase_resolucion >= 1}">
                            <center><div class="cuadroAviso">Usted ya realiz&oacute; el Pre-Cierre de Libreta</div> </center>
                            </c:if>
                        <p class="card-text text-center">
                            LA FASE DE DESIGNACION HA SIDO AVANZADA CON EXITO!!<br><br>
                            <a class="btn btn-primary text-center" href="<c:url value='/docentes/entradaAsignacioDocente.fautapo'/>" style="max-width: 28rem;"><strong>Volver</strong></a>
                        </p>
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value='/Public/Js/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/jquery/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/Js/bootstrap.min.js'/>"></script>
    </body>
</html>