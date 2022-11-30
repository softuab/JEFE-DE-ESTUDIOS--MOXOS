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
        <style>
            #busqueda {
                background-image: url('<c:url value='/imagenes/search.png'/>');
                background-position: 10px 10px;
                background-repeat: no-repeat;
                width: 100%;
                font-size: 16px;
                padding: 12px 20px 12px 50px;
                border: 1px solid #ddd;
                margin-bottom: 12px;
            }
        </style>
    </head>
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i> Informe de Moodle</h1>
                    <p>Programa: <c:out value="${programa.programa}"/>  Gestíon: <c:out value="${gestion}"/> Periodo: <c:out value="${periodo}"/></p>
                    <p>${usuario}</p>
                </div>
            </div> 
            <div class="row">
                <div class="col">
                    <input type="text" id="busqueda" placeholder="Buscar por Nombre" title="Buscar">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12"> 
                    <div class="tile">
                        <div class="tile-title-w-btn">
                            <div class="btn-group" role="group">
                                <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Estadisticas
                                </button>
                                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                    <a onclick="ofertas()" class="dropdown-item" href="#">Oferta Academica</a>
                                    <a onclick="rankinguso()" class="dropdown-item" href="#">Ranking Interacciones</a>
                                    <a onclick="rankingcontenido()" class="dropdown-item" href="#">Ranking Recursos</a>
                                </div>
                            </div>
                        </div>
                        <div class="tile-body">
                            <div class="table-responsive">
                                <table id="tablagrupo" class="table table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th>SIGLA</th>
                                            <th>MATERIAS</th>
                                            <th>GRUPO</th>
                                            <th>CARNET</th>
                                            <th>NOMBRE</th>
                                            <th>OFERTA ACADEMICA</th>
                                            <th>MATRICULADOS</th>
                                            <th>MATRICULADOS MOODLE</th>
                                            <th>USO DE LA PLATAFORMA MOVIMIENTO DEL CURSO</th>
                                            <th>CONTENIDOS</th>
                                            <th>PLANIFICACION DE CLASE MOODLE</th>
                                            <th>Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="grupo" items="${detallecurso}" varStatus="cont">
                                            <tr>
                                                <td><c:out value="${grupo.sigla}"/></td>
                                                <td><c:out value="${grupo.materias}"/></td>
                                                <td><c:out value="${grupo.grupo}"/></td>
                                                <td><c:out value="${grupo.dip}"/></td>
                                                <td><c:out value="${grupo.nombres}"/></td>
                                                <td><c:out value="${grupo.ofertaacademica}"/></td>
                                                <td><c:out value="${grupo.matriculados}"/></td>
                                                <td><c:out value="${grupo.matriculadomoodle}"/></td>
                                                <td><c:out value="${grupo.usoplataforma}"/></td>
                                                <td><c:out value="${grupo.contenido}"/></td>
                                                <td><c:out value="${grupo.planifi_clase_moodle}"/></td>
                                                <td>
                                                    <c:if test="${grupo.id_moodle !=-2}">
                                                        <a data-csrf="${_csrf.token}" class="btn btn-primary detalle" data-url="${pageContext.request.contextPath}/moodle/GetDetalleCursoMoodleDocente.fautapo" data-id="${grupo.id_moodle_cursos}" href="#">Detalle</a>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="modalCursoMoodle" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Detalle Recursos</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div  id="contenido" class="modal-body">

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="modalCursoMoodleoferta" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">RESUMEN</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div  class="modal-body">
                            <div class="embed-responsive embed-responsive-16by9">
                                <canvas class="embed-responsive-item" id="pieChartDemo"></canvas>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
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
    <script src="<c:url value='/Public/Js/plugins/chart.min.js'/>" type="text/javascript"></script>
    <script src="<c:url value='/Public/Js/app/moodle/main.js'/>" type="module"></script>
    <script>
                                        var contenidohtml = "${detallecursoporuso}";
                                        var contenidohtmlrecursos = "${detallecursoporcontenido}";
                                        var canvas = document.getElementById('pieChartDemo');
                                        var ctx = canvas.getContext('2d');
                                        var myBarChart;
                                        var data = {
                                            labels: ["SI CREARON ", "NO CREARON"],
                                            datasets: [
                                                {
                                                    fill: true,
                                                    backgroundColor: ['rgba(252, 65, 47, 0.2)', 'rgba(0, 120, 215,0.2)'],
                                                    data: [${SI}, ${NO}],
                                                    borderColor: ['black', 'black'],
                                                    borderWidth: [2, 2]
                                                }
                                            ]
                                        };
                                        var options = {
                                            title: {
                                                display: true,
                                                text: 'RESUMEN DE OFERTAS ACADEMICAS',
                                                position: 'top'
                                            },
                                            rotation: -0.7 * Math.PI
                                        };
                                        myBarChart = new Chart(ctx, {
                                            type: 'pie',
                                            data: data,
                                            options: options
                                        });
                                        function ofertas() {
                                            $('#modalCursoMoodleoferta').modal('show');
                                        }
                                        function getRandomColor() {
                                            var letters = '0123456789ABCDEF';
                                            var color = '#';
                                            for (var i = 0; i < 6;
                                                    i++
                                                    ) {
                                                color += letters[Math.floor(Math.random() * 16)];
                                            }
                                            return color;
                                        }
                                        function rankinguso()
                                        {
                                            contenido.innerHTML = '';
                                            var div = document.createElement('div');
                                            div.className = 'container';
                                            div.innerHTML = '<div class="row"><div class="col"><H1>RANKING DE USO DE PLATAFORMA</H1></div></div>';
                                            div.innerHTML += contenidohtml;
                                            contenido.appendChild(div);
                                            $('#modalCursoMoodle').modal('show');
                                        }
                                        
                                        function rankingcontenido()
                                        {
                                            contenido.innerHTML = '';
                                            var div = document.createElement('div');
                                            div.className = 'container';
                                            div.innerHTML = '<div class="row"><div class="col"><H1>RANKING DE CONTENIDO</H1></div></div>';
                                            div.innerHTML += contenidohtmlrecursos;
                                            contenido.appendChild(div);
                                            $('#modalCursoMoodle').modal('show');
                                        }
    </script>
</body>
</html>