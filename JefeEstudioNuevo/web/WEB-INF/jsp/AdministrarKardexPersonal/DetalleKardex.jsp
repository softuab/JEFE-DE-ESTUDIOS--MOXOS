<jsp:useBean id="now" class="java.util.Date"/> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="es">
    <head>  
        <meta charset="UTF-8">  
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <META HTTP-EQUIV="Cache-Control" CONTENT="max-age='0'" />
        <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache" />
        <META http-equiv="expires" content="0" />
        <META HTTP-EQUIV="Expires" CONTENT="Tue, 01 Jan 1980 1:00:00 GMT" />
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache" /> 
        <title>Ingreso - Moxos</title> 
        <link rel="stylesheet" href="<c:url value='/Public/Css/main.css'/>" type="text/css">
        <link rel="stylesheet" href="<c:url value='/Public/FontAwesome/css/fontawesome-all.css'/>"> 
        <link rel="stylesheet" type="text/css" href="<c:url value='/Public/Css/TableResponsive.css'/>">
    </head>
    <body>
        <main class="app-content3">
            <div class="row user">
                <div class="col-md-12">
                    <div class="profile">
                        <div class="info"><img class="user-img" src="${simagen}" alt="Docente"> 
                            <p>Docente</p>
                        </div>
                        <div class="cover-image"></div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="tile p-0">
                        <ul class="nav flex-column nav-tabs user-tabs">
                            <li class="nav-item"><a class="nav-link active" href="#user-detalle" data-toggle="tab">DATOS PERSONALES</a></li>
                            <li class="nav-item"><a class="nav-link" href="#idioma-detalle" data-toggle="tab">IDIOMAS Y LENGUAS ORIGINARIAS</a></li>
                            <li class="nav-item"><a class="nav-link" href="#formacion-detalle" data-toggle="tab">FORMACION ACADEMICA</a></li>
                            <li class="nav-item"><a class="nav-link" href="#experiencia-detalle" data-toggle="tab">EXPERIENCIA PROFESIONAL/LABORAL  </a></li>
                            <li class="nav-item"><a class="nav-link" href="#cursos-detalle" data-toggle="tab">CURSOS REALIZADOS</a></li>
                            <li class="nav-item"><a class="nav-link" href="#produccion-detalle" data-toggle="tab">PRODUCCION CIENTIFICA</a></li>
                            <li class="nav-item"><a class="nav-link" href="#evaluacion-detalle" data-toggle="tab">EVALUACION DOCENTE</a></li>
                            <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-print"></i>&nbsp;&nbsp;IMPRIMIR CURRICULUM</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content">
                        <div class="tab-pane active" id="user-detalle">
                            <div class="tile">
                                <div class="tile-title-w-btn">
                                    <h3 class="title">Datos Personales</h3>
                                    <form name="forma" class="unlock-form" action="<c:url value="/DetalleKardexPersonal.fautapo"/>" method="POST">     
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <button type="submit" class="btn btn-primary icon-btn"> <i class="fas fa-user-edit"></i></button>
                                    </form>
                                </div>
                                <div class="tile-body">
                                    <b>1.- Informacion personal</b><br><hr>
                                    <p>
                                        <b  class="text-primary">Nombre:</b>&nbsp;${kardex.nombre}<br>
                                        <b  class="text-primary">Segundo nombre:</b>&nbsp;${kardex.segundonombre}<br>
                                        <b  class="text-primary">Apellido paterno:</b>&nbsp;${kardex.apellidopaterno}<br>
                                        <b  class="text-primary">Apellido materno:</b>&nbsp;${kardex.apellidomaterno}<br>
                                        <b  class="text-primary">Fecha de Nacimiento:</b>&nbsp;<fmt:formatDate pattern = "dd/MM/yyyy" value = "${kardex.fechanacimiento}" /> <br>
                                        <b  class="text-primary">Lugar de Nacimiento:</b>&nbsp;${kardex.detalle_localidad}<br>
                                        <b  class="text-primary">Estado civil:</b>&nbsp;${kardex.estadocivil}<br>
                                        <b  class="text-primary">Sexo:</b>&nbsp;${kardex.detalle_sexo}<br>
                                    </p>
                                    <b>2.- Información identificación personal</b><br><hr>
                                    <p>
                                        <b  class="text-primary">Tipo documento:</b>&nbsp;${kardex.tipodocumento}<br>
                                        <b  class="text-primary">Numero de documento:</b>&nbsp;${kardex.numerodocumento}<br>
                                        <b  class="text-primary">Emision:</b>&nbsp;${kardex.emision_documento}<br> 
                                        <b  class="text-primary">Fecha de Expiración de documento:</b>&nbsp;<fmt:formatDate pattern = "dd/MM/yyyy" value = "${kardex.fechaexpiracioncarnet}" /> <br>
                                        <b  class="text-primary">Fotocopia de carnet:</b>&nbsp;<button  class="btn btn-primary btn-sm" id="vercarnet" data-persona="${kardex.id_persona}" data-tabla="persona" data-columna="carnet"   onclick="vistaprevia(this)" ><i id="icon1" class="fas fa-eye"></i></button><br> 
                                    </p>
                                    <b>3.- Información de Servicio militar(opcional mujeres)</b><br><hr>
                                    <p>
                                        <b  class="text-primary">Numero de Libreta:</b>&nbsp;${kardex.numerolibreta}<br>
                                        <b  class="text-primary">Matricula de Libreta:</b>&nbsp;${kardex.matriculalibreta}<br>
                                        <b  class="text-primary">Escalon:</b>&nbsp;${kardex.escalon}<br> 
                                        <b  class="text-primary">Año de Servicio:</b>&nbsp;${kardex.aserviciomilitar} <br>
                                        <b  class="text-primary">Fotocopia de libreta de servicio militar:</b>&nbsp;<button  class="btn btn-primary btn-sm" id="vercarnet" data-persona="${kardex.id_persona}" data-tabla="persona" data-columna="libreta"   onclick="vistaprevia(this)" ><i id="icon1" class="fas fa-eye"></i></button><br> 
                                    </p>
                                    <b>4.- Información academica pregrado actual</b><br><hr>
                                    <p>
                                        <b  class="text-primary">Nivel de estudio:</b>&nbsp;${kardex.detalle_nivelestudio}<br>
                                        <b  class="text-primary">Profesion:</b>&nbsp;${kardex.detalle_profesion}<br>
                                        <b  class="text-primary">Universidad:</b>&nbsp;${kardex.universidad}<br>
                                        <b  class="text-primary">Numero de titulo:</b>&nbsp;${kardex.numerotituloprovision}<br>
                                        <b  class="text-primary">Fecha de emision de titulo:</b>&nbsp;<fmt:formatDate pattern = "dd/MM/yyyy" value = "${kardex.fechatituloprofesion}" /><br>
                                        <b  class="text-primary">Colegio de profesionales:</b>&nbsp;${kardex.detalle_colegio_profesionales}<br> 
                                        <b  class="text-primary">Numero de registro de colegio profesional:</b>&nbsp;${kardex.numeroregistroprofesionales} <br>
                                        <b  class="text-primary">Etiqueta de presentacion profesional:</b>&nbsp;${kardex.prefijo_profesional} <br>
                                        <b  class="text-primary">Fotocopia de titulo de provision nacional:</b>&nbsp;<button  class="btn btn-primary btn-sm" id="vercarnet" data-persona="${kardex.id_persona}" data-tabla="persona" data-columna="titulo"   onclick="vistaprevia(this)" ><i id="icon1" class="fas fa-eye"></i></button><br> 
                                    </p>
                                    <b>5.- Información laboral</b><br><hr>
                                    <p>
                                        <b  class="text-primary">Tipo Nua:</b>&nbsp;${kardex.tiponua}<br>
                                        <b  class="text-primary">Nua:</b>&nbsp;${kardex.nua}<br>
                                        <b  class="text-primary">Banco:</b>&nbsp;${kardex.detalle_banco}<br> 
                                        <b  class="text-primary">Numero de cuenta:</b>&nbsp;${kardex.cuentacorriente}<br>
                                        <b  class="text-primary">Sindicato:</b>&nbsp;${kardex.detalle_sindicato}<br>
                                        <b  class="text-primary">Jubilado:</b>&nbsp;${kardex.detalle_jubilado}<br>
                                        <b  class="text-primary">REN:</b>&nbsp;${kardex.ren}<br>
                                        <b  class="text-primary">Capacidades diferentes:</b>&nbsp;${kardex.detalle_discapacitado}<br>
                                        <b  class="text-primary">Numero de CODEPEDI:</b>&nbsp;${kardex.nrodiscpacitado}<br>
                                        <b  class="text-primary">Numero de SSU:</b>&nbsp;${kardex.numerodeseguro}<br>
                                        <b  class="text-primary">Curso 1178:</b>&nbsp;${kardex.detalle_ley1178}<br>
                                        <b  class="text-primary">Numero de certificado 1178:</b>&nbsp;${kardex.nrotitulo}<br>
                                        <b  class="text-primary">Promedio de 1178:</b>&nbsp;${kardex.promedio}<br>
                                        <b  class="text-primary">Fecha de emision de 1178:</b>&nbsp;<fmt:formatDate pattern = "dd/MM/yyyy" value = "${kardex.fechacurso1178}" /><br>
                                        <b  class="text-primary">Certificación del Sippase:</b>&nbsp;${kardex.detalle_sippase}<br>
                                        <b  class="text-primary">Fecha de emision de Sippase:</b>&nbsp;<fmt:formatDate pattern = "dd/MM/yyyy" value = "${kardex.fechaemisionsippase}" /><br>

                                        <b  class="text-primary">Detalle de idioma Nativo</b>&nbsp;${kardex.idiomanativo}<br>
                                        <b  class="text-primary">Fecha de emision idioma Nativo</b>&nbsp;<fmt:formatDate pattern = "dd/MM/yyyy" value = "${kardex.fechaemision}" /><br>

                                    </p>
                                    <b>6.- Contacto</b><br><hr>
                                    <p>
                                        <b  class="text-primary">Direccion:</b>&nbsp;${kardex.direccion}<br>
                                        <b  class="text-primary">Telefono/Celular:</b>&nbsp;${kardex.telefonocelular}<br>
                                        <b  class="text-primary">Correo Electronico:</b>&nbsp;${kardex.correoinsitucional}<br> 
                                    </p>
                                </div>
                            </div>
                        </div> 
                        <div class="tab-pane fade" id="idioma-detalle">
                            <div class="tile">
                                <h3 class="title">Idiomas y Lenguas originarias</h3>
                                <div class="tile-title-w-btn">
                                    <input class="form-control mr-sm-2" type="search" id="buscardetalleidioma" placeholder="Buscar titulo"  onkeyup="filterlist('buscardetalleidioma', 'listidioma')">
                                    <form name="forma" class="unlock-form" action="<c:url value="/NuevoIdiomaLenguas.fautapo"/>" method="POST">     
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <input type="hidden" name="id_persona_kardex" value='${kardex.id_persona_kardex}' /> 
                                        <input type="hidden" name="root" value='' /> 
                                        <button type="submit" class="btn btn-primary icon-btn"> <i class="fas fa-user-plus"></i></button>
                                    </form>
                                </div>
                                <div class="tile-body">
                                    <jsp:include page="${request.contextPath}/ListaParcialIdiomaLenguas.fautapo">
                                        <jsp:param name="id_persona_kardex" value="${kardex.id_persona_kardex}"/>
                                        <jsp:param name="number" value="10"/>
                                    </jsp:include>
                                </div>
                                <div class="tile-footer">
                                    <form name="forma" class="unlock-form" action="<c:url value="/ListaIdiomaLenguas.fautapo"/>" method="GET">
                                        <input type="hidden" name="id_persona_kardex" value='${kardex.id_persona_kardex}' />  
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <button class="btn btn-light  btn-sm btn-block" type="submit">Ver todos los idiomas y lenguas originarios</button>
                                    </form> 
                                </div>
                            </div> 
                        </div>
                        <div class="tab-pane fade" id="formacion-detalle">
                            <div class="tile">
                                <h3 class="title">Formacion academica</h3>
                                <div class="tile-title-w-btn">
                                    <input class="form-control mr-sm-2" type="search" id="buscardetalleformacion" placeholder="Buscar titulo"  onkeyup="filterlist('buscardetalleformacion', 'listformacion')">
                                    <form name="forma" class="unlock-form" action="<c:url value="/NuevoFormacionAcademica.fautapo"/>" method="POST">     
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <input type="hidden" name="id_persona_kardex" value='${kardex.id_persona_kardex}' /> 
                                        <input type="hidden" name="root" value='' /> 
                                        <button type="submit" class="btn btn-primary icon-btn"> <i class="fas fa-user-plus"></i></button>
                                    </form>
                                </div>
                                <div class="tile-body">
                                    <jsp:include page="${request.contextPath}/ListaParcialFormacionAcademico.fautapo">
                                        <jsp:param name="id_persona_kardex" value="${kardex.id_persona_kardex}"/>
                                        <jsp:param name="number" value="10"/>
                                    </jsp:include>
                                </div>
                                <div class="tile-footer">
                                    <form name="forma"  action="<c:url value="/ListarFormacionAcademica.fautapo"/>" method="GET">
                                        <input type="hidden" name="id_persona_kardex" value='${kardex.id_persona_kardex}' />  
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <button class="btn btn-light  btn-sm btn-block" type="submit">Ver todas las formaciones academicas realizadas</button>
                                    </form>  
                                </div>
                            </div> 
                        </div>
                        <div class="tab-pane fade" id="experiencia-detalle">
                            <div class="tile">
                                <h3 class="title">Experiencia profesional/laboral</h3>
                                <div class="tile-title-w-btn">
                                    <input class="form-control mr-sm-2" type="search" id="buscardetalleexperiencia" placeholder="Buscar titulo"  onkeyup="filterlist('buscardetalleexperiencia', 'listexperiencia')">
                                    <form name="forma" class="unlock-form" action="<c:url value="/NuevoExperiencia.fautapo"/>" method="POST">     
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <input type="hidden" name="id_persona_kardex" value='${kardex.id_persona_kardex}' /> 
                                        <input type="hidden" name="root" value='' /> 
                                        <button type="submit" class="btn btn-primary icon-btn"> <i class="fas fa-user-plus"></i></button>
                                    </form>
                                </div>
                                <div class="tile-body">
                                    <jsp:include page="${request.contextPath}/ListaParcialExperienciaLaboral.fautapo">
                                        <jsp:param name="id_persona_kardex" value="${kardex.id_persona_kardex}"/>
                                        <jsp:param name="number" value="10"/>
                                    </jsp:include>
                                </div>
                                <div class="tile-footer">
                                    <form name="forma"  action="<c:url value="/ListarExperienciaLaboral.fautapo"/>" method="GET">
                                        <input type="hidden" name="id_persona_kardex" value='${kardex.id_persona_kardex}' />  
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <button class="btn btn-light  btn-sm btn-block" type="submit">Ver todas los detalles de la experiencia profecional</button>
                                    </form> 
                                </div>
                            </div> 
                        </div>
                        <div class="tab-pane fade" id="cursos-detalle">
                            <div class="tile">
                                <h3 class="title">Cursos realizados</h3>
                                <div class="tile-title-w-btn">
                                    <input class="form-control mr-sm-2" type="search" id="buscardetallecursos" placeholder="Buscar titulo"  onkeyup="filterlist('buscardetallecursos', 'listcursos')">
                                    <form name="forma" class="unlock-form" action="<c:url value="/NuevoCursos.fautapo"/>" method="POST">     
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <input type="hidden" name="id_persona_kardex" value='${kardex.id_persona_kardex}' /> 
                                        <input type="hidden" name="root" value='' /> 
                                        <button type="submit" class="btn btn-primary icon-btn"> <i class="fas fa-user-plus"></i></button>
                                    </form>
                                </div>
                                <div class="tile-body">
                                    <jsp:include page="${request.contextPath}/ListaParcialCursosRealizados.fautapo">
                                        <jsp:param name="id_persona_kardex" value="${kardex.id_persona_kardex}"/>
                                        <jsp:param name="number" value="10"/>
                                    </jsp:include>
                                </div>
                                <div class="tile-footer">
                                    <form name="forma"  action="<c:url value="/ListarCursosRealizados.fautapo"/>" method="GET">
                                        <input type="hidden" name="id_persona_kardex" value='${kardex.id_persona_kardex}' />  
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <button class="btn btn-light  btn-sm btn-block" type="submit">Ver todos los  cursos realizados</button>
                                    </form> 
                                </div>
                            </div> 
                        </div>
                        <div class="tab-pane fade" id="produccion-detalle">
                            <div class="tile">
                                <h3 class="title">Produccion cientifica</h3>
                                <div class="tile-title-w-btn">
                                    <input class="form-control mr-sm-2" type="search" id="buscardetalleproduccion" placeholder="Buscar titulo"  onkeyup="filterlist('buscardetalleproduccion', 'listproduccion')">
                                    <form name="forma" class="unlock-form" action="<c:url value="/NuevoProduccion.fautapo"/>" method="POST">     
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <input type="hidden" name="id_persona_kardex" value='${kardex.id_persona_kardex}' /> 
                                        <input type="hidden" name="root" value='' /> 
                                        <button type="submit" class="btn btn-primary icon-btn"> <i class="fas fa-user-plus"></i></button>
                                    </form>
                                </div>
                                <div class="tile-body">
                                    <jsp:include page="${request.contextPath}/ListaParcialProduccionCientifica.fautapo">
                                        <jsp:param name="id_persona_kardex" value="${kardex.id_persona_kardex}"/>
                                        <jsp:param name="number" value="10"/>
                                    </jsp:include>
                                </div>
                                <div class="tile-footer">
                                    <form name="forma"  action="<c:url value="/ListarProduccionCientifica.fautapo"/>" method="GET">
                                        <input type="hidden" name="id_persona_kardex" value='${kardex.id_persona_kardex}' />  
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <button class="btn btn-light  btn-sm btn-block" type="submit">Ver todas las producciones cientificas</button>
                                    </form> 
                                </div>
                            </div> 
                        </div>
                        <div class="tab-pane fade" id="evaluacion-detalle">
                            <div class="tile">
                                <h3 class="title">Evaluacion docente</h3>
                                <div class="tile-title-w-btn">
                                    <input class="form-control mr-sm-2" type="search" id="buscardetalleevaluacion" placeholder="Buscar titulo"  onkeyup="filtertable('buscardetalleevaluacion', 'listevaluacion')">
                                    <form name="forma" class="unlock-form" action="<c:url value="/NuevoEvaluacion.fautapo"/>" method="POST">     
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <input type="hidden" name="id_persona_kardex" value='${kardex.id_persona_kardex}' /> 
                                        <input type="hidden" name="root" value='' /> 
                                        <button type="submit" class="btn btn-primary icon-btn"> <i class="fas fa-user-plus"></i></button>
                                    </form>
                                </div>
                                <div class="tile-body">
                                    <jsp:include page="${request.contextPath}/ListaParcialEvaluacionDocente.fautapo">
                                        <jsp:param name="id_persona_kardex" value="${kardex.id_persona_kardex}"/>
                                        <jsp:param name="number" value="10"/>
                                    </jsp:include>
                                </div>
                                <div class="tile-footer">
                                    <form name="forma"  action="<c:url value="/ListarEvaluacionDocente.fautapo"/>" method="GET">
                                        <input type="hidden" name="id_persona_kardex" value='${kardex.id_persona_kardex}' />  
                                        <input type="hidden" name="id_persona" value='${kardex.id_persona}' /> 
                                        <button class="btn btn-light  btn-sm btn-block" type="submit">Ver todas las evaluaciones</button>
                                    </form> 
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="vistaprevia" tabindex="-1" role="dialog" aria-labelledby="examplevistaprevia" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <img src="" id="imgvistaprevia" class="img-fluid" alt="Responsive image">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Entiendo</button> 
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script src="<c:url value='/Public/jquery/jquery-3.3.1.min.js'/>"></script>
        <script src="<c:url value='/Public/jquery/umd/popper.min.js'/>" ></script>
        <script src="<c:url value='/Public/bootstrap/js/bootstrap.min.js'/>"></script>
        <script src="<c:url value='/Public/Js/main.js'/>"</script>
        <script src="<c:url value='/Public/Js/plugins/pace.min.js'/>"></script>
        <script>
                                        function vistaprevia(input) {
                                            var data = {
                                                id_persona: $(input).data("persona"),
                                                columna: $(input).data("columna"),
                                                tabla: $(input).data("tabla")
                                            };
                                            $.get('./Vistapreviaimagenkardex.fautapo', data, function (data)
                                            {
                                                $('#imgvistaprevia').attr("src", data.simagen);
                                                AbrirModal("#vistaprevia");
                                            });
                                        }
                                        function AbrirModal(id)
                                        {
                                            $(id).modal({
                                                keyboard: false
                                            });
                                        }
                                        function filterlist(name, ulname) {
                                            var input, filter, ul, li, a, i, txtValue, h5;
                                            input = document.getElementById(name);
                                            filter = input.value.toUpperCase();
                                            ul = document.getElementById(ulname);
                                            li = ul.getElementsByTagName("li");
                                            for (i = 0; i < li.length; i++) {
                                                a = li[i].getElementsByTagName("div")[0];
                                                txtValue = a.children[0].textContent || a.children[0].innerText;
                                                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                    li[i].style.display = "";
                                                } else {
                                                    li[i].style.display = "none";
                                                }
                                            }
                                        }
                                        function filtertable(name, tablename) {
                                            var input, filter, table, tr, td, i, txtValue;
                                            input = document.getElementById(name);
                                            filter = input.value.toUpperCase();
                                            table = document.getElementById(tablename);
                                            tr = table.getElementsByTagName("tr");
                                            for (i = 0; i < tr.length; i++) {
                                                td = tr[i].getElementsByTagName("td")[0];
                                                if (td) {
                                                    txtValue = td.textContent || td.innerText;
                                                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                                                        tr[i].style.display = "";
                                                    } else {
                                                        tr[i].style.display = "none";
                                                    }
                                                }
                                            }
                                        }
        </script>
    </body>
</html>
