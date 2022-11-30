<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
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
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/Card.css'/>"> 
    </head>
    <body class="app sidebar-mini rtl">
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
                    <p>Modificacion de contraseña</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">

                        <div class="Card-Informacion">
                            <div class="card border-secondary mb-3" style="max-width: 18rem;">
                                <div class="card-header"><i class="fas fa-info-circle"></i>&nbsp;&nbsp;RECOMENDACIONES:</div>
                                <div class="card-body text-secondary"> 
                                    <form action="<c:url value="/cambioPinDocente/ingresarNuevoPin.fautapo"/>" method="POST">
                                        <p class="card-text"> 
                                            <b><font color="red">Atenci&oacute;n señor(a) docente:</font></b><c:out value="${nombres}"/><br/>
                                            <b><font color="red">*</font></b> Utilize caracteres validos [A-Z],[a-z] y [1-9].<br/>
                                            <b><font color="red">*</font></b> No utilize palabras del diccionario ni nombres propios.<br/>
                                            <b><font color="red">*</font></b> Invente una palabra que pueda recordar.<br/>
                                            <b><font color="red">*</font></b> Componga palabras e inserte números.<br/>
                                        </p>
                                        <div class="text-center"> <input class="btn btn-primary" type=submit value="Buscar"></div>
                                    </form>
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






