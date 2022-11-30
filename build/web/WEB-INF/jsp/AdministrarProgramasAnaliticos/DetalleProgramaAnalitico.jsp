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
        <link rel="stylesheet" href="<c:url value='/Public/Css/tabs.css'/>" >   
        <link href="<c:url value='/Public/Css/Loader.css'/>" rel="stylesheet"/>
        <script type="text/javascript" src="<c:url value='/Public/tinymce/tinymce.min.js'/>"></script>  
        <script>
            tinymce.init({
                selector: 'textarea',
                height: 550,
                theme: 'modern',
                mobile: {
                    theme: 'beta-mobile',
                    plugins: ['autosave']
                },
                language: 'es',
                plugins: 'print preview fullpage searchreplace autolink directionality visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists textcolor wordcount imagetools contextmenu colorpicker textpattern help',
                table_styles: "Header 1=header1;Header 2=header2;Header 3=header3",
                table_cell_styles: "Header 1=header1;Header 2=header2;Header 3=header3;Table Cell=tableCel1",
                table_row_styles: "Header 1=header1;Header 2=header2;Header 3=header3;Table Row=tableRow1",
                toolbar1: 'fontselect | fontsizeselect | formatselect | bold italic strikethrough forecolor backcolor | link | alignleft aligncenter alignright alignjustify  | numlist bullist outdent indent  | removeformat',
                font_formats: 'Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;AkrutiKndPadmini=Akpdmi-n',
                fontsize_formats: '8pt 10pt 12pt 14pt 18pt 24pt 36pt',
                image_advtab: true,
                templates: [
                    {title: 'Test template 1', content: 'Test 1'},
                    {title: 'Test template 2', content: 'Test 2'}
                ],
                content_css: [
                    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i'
                ],
                content_style: [
                    'body{max-width:700px; padding:30px; margin:auto;font-size:16px;font-family:Lato,"Helvetica Neue",Helvetica,Arial,sans-serif; line-height:1.3; letter-spacing: -0.03em;color:#222} h1,h2,h3,h4,h5,h6 {font-weight:400;margin-top:1.2em} h1 {} h2{} .tiny-table {width:100%; border-collapse: collapse;} .tiny-table td, th {border: 1px solid #555D66; padding:10px; text-align:left;font-size:16px;font-family:Lato,"Helvetica Neue",Helvetica,Arial,sans-serif; line-height:1.6;} .tiny-table th {background-color:#E2E4E7}'
                ],
                visual_table_class: 'tiny-table'
            });
            ;
        </script>
    </head>
    <body class="app sidebar-mini rtl">
        <div class="preloader-background">
            <div class="loader">
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
                <div class="dot"></div>
            </div>
        </div>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="far fa-address-card"></i>&nbsp; ${nombres}</h1>
                    <h5> PROGRAMA ANALITICO DE ${materia} GRUPO ${grupo} ${periodo}/${gestion} </h5> 
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <form name="formaguardar" method='post' action="<c:url value='EditarProgramaAnalitico.fautapo'/>">
                            <input type=hidden name="id_dct_programa_analitico"    value="<c:out value="${evaluarprograma.id_dct_programa_analitico}"/>">
                            <input type=hidden name="id_estado"    value="<c:out value="${evaluarprograma.id_estado}"/>">
                            <div class="row">
                                <div class="col-2">
                                    <div class="nav flex-column nav-pills" id="tabprogramaanalitico" role="tablist" aria-orientation="vertical">
                                        <a class="nav-link active" id="marco_referencial" data-toggle="pill" href="#v-pills-marco_referencial" role="tab" aria-controls="v-pills-marco_referencial" aria-selected="true">1.- Marco Referencial</a>
                                        <a class="nav-link" id="justificacion" data-toggle="pill" href="#v-pills-justificacion" role="tab" aria-controls="v-pills-profile" aria-selected="false">2.- Justificacion</a>
                                        <a class="nav-link" id="propositos" data-toggle="pill" href="#v-pills-propositos" role="tab" aria-controls="v-pills-justificacion" aria-selected="false">3.- Propósitos</a>
                                        <a class="nav-link" id="objetivo_desarrollador" data-toggle="pill" href="#v-pills-objetivo_desarrollador" role="tab" aria-controls="v-pills-objetivo_desarrollador" aria-selected="false">4.- Objetivo Desarrollador</a>
                                        <a class="nav-link" id="objetivo_educativo" data-toggle="pill" href="#v-pills-objetivo_educativo" role="tab" aria-controls="v-pills-objetivo_educativo" aria-selected="false">5.- Objetivo Educativo</a>
                                        <a class="nav-link" id="contenidos" data-toggle="pill" href="#v-pills-contenidos" role="tab" aria-controls="v-pills-contenidos" aria-selected="false">6.- Contenidos</a>
                                        <a class="nav-link" id="metodos_estrategias" data-toggle="pill" href="#v-pills-metodos_estrategias" role="tab" aria-controls="v-pills-metodos_estrategias" aria-selected="false">7.- Metodología</a>
                                        <a class="nav-link" id="distribucion_de_tiempo" data-toggle="pill" href="#v-pills-distribucion_de_tiempo" role="tab" aria-controls="v-pills-distribucion_de_tiempo" aria-selected="false">8.- Formas de organización</a>
                                        <a class="nav-link" id="recursos" data-toggle="pill" href="#v-pills-recursos" role="tab" aria-controls="v-pills-recursos" aria-selected="false">9.- Recursos</a>
                                        <a class="nav-link" id="sistema_evaluacion" data-toggle="pill" href="#v-pills-sistema_evaluacion" role="tab" aria-controls="v-pills-sistema_evaluacion" aria-selected="false">10.- Sistema de evaluación</a>
                                        <a class="nav-link" id="bibliografia" data-toggle="pill" href="#v-pills-bibliografia" role="tab" aria-controls="v-pills-bibliografia" aria-selected="false">11.- Bibliografía</a>
                                        <a class="nav-link" id="cronograma" data-toggle="pill" href="#v-pills-cronograma" role="tab" aria-controls="v-pills-cronograma" aria-selected="false">12.- Cronograma de actividades</a>
                                        <a class="nav-link" id="adicional" data-toggle="pill" href="#v-pills-adicional" role="tab" aria-controls="v-pills-adicional" aria-selected="false">13.- Datos adicionales</a>
                                    </div>
                                </div>
                                <div class="col-10">
                                    <div class="tab-content" id="v-pills-tabContent">
                                        <div class="tab-pane fade show active" id="v-pills-marco_referencial" role="tabpanel" aria-labelledby="marco_referencial">
                                            <div class="form-group">
                                                <textarea class="form-control" name="marco_referencial" ><c:out value="${evaluarprograma.marco_referencial}"/></textarea>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-justificacion" role="tabpanel" aria-labelledby="justificacion">
                                            <div class="form-group">
                                                <textarea class="form-control" name="justificacion" ><c:out value="${evaluarprograma.justificacion}"/></textarea>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-propositos" role="tabpanel" aria-labelledby="propositos">
                                            <textarea class="form-control" name="propositos" ><c:out value="${evaluarprograma.propositos}"/></textarea>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-objetivo_desarrollador" role="tabpanel" aria-labelledby="objetivo_desarrollador">
                                            <textarea class="form-control" name="objetivo_desarrollador" ><c:out value="${evaluarprograma.objetivo_desarrollador}"/></textarea>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-objetivo_educativo" role="tabpanel" aria-labelledby="objetivo_educativo">
                                            <textarea class="form-control" name="objetivo_educativo" ><c:out value="${evaluarprograma.objetivo_educativo}"/></textarea>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-contenidos" role="tabpanel" aria-labelledby="contenidos">
                                            <jsp:include page="${request.contextPath}/ListarContenidos.fautapo">
                                                <jsp:param name="id_dct_programa_analitico" value="${evaluarprograma.id_dct_programa_analitico}"/>
                                            </jsp:include>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-metodos_estrategias" role="tabpanel" aria-labelledby="metodos_estrategias">
                                            <textarea class="form-control" name="metodos_estrategias" ><c:out value="${evaluarprograma.metodos_estrategias}"/></textarea>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-distribucion_de_tiempo" role="tabpanel" aria-labelledby="distribucion_de_tiempo">
                                            <jsp:include page="${request.contextPath}/ListarDistribucionTiempos.fautapo">
                                                <jsp:param name="id_dct_programa_analitico" value="${evaluarprograma.id_dct_programa_analitico}"/>
                                            </jsp:include>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-recursos" role="tabpanel" aria-labelledby="recursos">
                                            <textarea class="form-control" name="recursos" ><c:out value="${evaluarprograma.recursos}"/></textarea>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-sistema_evaluacion" role="tabpanel" aria-labelledby="sistema_evaluacion">
                                            <textarea class="form-control" name="sistema_evaluacion" ><c:out value="${evaluarprograma.sistema_evaluacion}"/></textarea>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-bibliografia" role="tabpanel" aria-labelledby="v-bibliografia">
                                            <jsp:include page="${request.contextPath}/ListarBibliografia.fautapo">
                                                <jsp:param name="id_dct_programa_analitico" value="${evaluarprograma.id_dct_programa_analitico}"/>
                                            </jsp:include>
                                        </div>
                                        <div class="tab-pane fade" id="v-pills-cronograma" role="tabpanel" aria-labelledby="cronograma">
                                            <jsp:include page="${request.contextPath}/ListarCronograma.fautapo">
                                                <jsp:param name="id_dct_programa_analitico" value="${evaluarprograma.id_dct_programa_analitico}"/>
                                            </jsp:include>
                                        </div> 
                                        <div class="tab-pane fade" id="v-pills-adicional" role="tabpanel" aria-labelledby="adicional">
                                            <div class="form-group">
                                                <label for="exampleFormControlInput1">Detalle grado academico(M. Sc. Ing.)</label>
                                                <input type="text" class="form-control" name="nro_resolucion" placeholder="Numero de Resolucion" value="<c:out value="${evaluarprograma.nro_resolucion}"/>">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">Perfil Académico y Laboral.</label>
                                                <textarea class="form-control" name="observacion" rows="3"><c:out value="${evaluarprograma.observacion}"/></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>  
                        </form>

                        <div class="row">
                            <div class="col">
                                <div class="text-right"> 
                                    <form name="formaimprimir" method='post' action="<c:url value='ImprimirProgramaAnalitico.fautapo'/>">
                                        <input type=hidden name="id_dct_programa_analitico"    value="<c:out value="${evaluarprograma.id_dct_programa_analitico}"/>">
                                        <input type=hidden name="id_estado"    value="<c:out value="${evaluarprograma.id_estado}"/>"> 
                                        <input type="hidden" name="materia" value="${materia}"/>
                                        <input type="hidden" name="grupo" value="${grupo}"/>
                                        <input type="hidden" name="periodo" value="${periodo}"/>
                                        <input type="hidden" name="gestion" value="${gestion}"/>
                                    </form>
                                    <a class="btn btn-primary" href='javascript:document.formaimprimir.submit();'>  <i class="fas fa-print"></i> &nbsp;Imprimir documento</a>
                                    <a class="btn btn-primary" href='javascript:document.formaguardar.submit();'>  <i class="fas fa-file-pdf"> &nbsp;</i>Guardar</a>
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
