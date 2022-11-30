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
    </head>
    <body class="app sidebar-mini rtl"> 
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
                    <h5> PROGRAMA ANALITICO DE ${materia} GRUPO ${grupo} ${periodo}/${gestion} </h5> 
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12"> 
                    <div class="tile">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <span class="d-block p-2 bg-secondary text-white"><i class="fas fa-address-card"></i>
                                        Imprimir caratula de Programa Analitico
                                    </span>
                                    <form name="formaguardar" method='get' action="<c:url value='CaratulaProgramaAnalitico.fautapo'/>">
                                        <input type=hidden name="id_dct_programa_analitico"    value="<c:out value="${id_dct_programa_analitico}"/>"> 
                                        <button type="submit" class="btn btn-primary btn-lg btn-block"><i class="fas fa-print"></i> &nbsp;Imprimir</button>
                                    </form>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <span class="d-block p-2 bg-secondary text-white"><i class="fas fa-address-card"></i>
                                        Imprimir documento Programa Analitico
                                    </span>
                                    <form name="formaguardar1" method='get' action="<c:url value='DetalleImprimirProgramaAnalitico.fautapo'/>">
                                        <input type=hidden name="id_dct_programa_analitico"    value="<c:out value="${id_dct_programa_analitico}"/>"> 
                                         <button type="submit" class="btn btn-primary btn-lg btn-block"><i class="fas fa-print"></i> &nbsp;Imprimir</button>
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
        <script src="<c:url value="/Public/SweetAlert2/sweetalert.min.js"/>"></script>
    </body>
</html>