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
        <style>
            .filter {
                box-sizing: border-box;
            }
            select2 {
                width: auto;
                max-width: 100%;
                margin-bottom: 1.7rem;
            }
            .search{
                float: left;
                width: 100%;
                height: 100%;
            }
        </style>
    </head>
    <body>
        <main class="app-content3">
            <div class="app-title">
                <div>
                    <h1><i class="fa fa-dashboard"></i><i class="far fa-address-card"></i>&nbsp;Agregando</h1>
                    <p>${usuario}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="tile">
                        <div class="tile-body"> 
                            <form class="form-horizontal" name="forma" id="forma" method='post' action="<c:url value='/dibRap/confirmarNuevo.fautapo'/>">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="t" value='<c:out value="${tabla.id_tabla}"/>' >
                                <input type="hidden" name="e" value='<c:out value="${id_enlace}"/>' >
                                <input type="hidden" name="p" value="<c:out value='${permiso}' />">
                                <input type="hidden" name="f" value="<c:out value='${condicion}' />">
                                <input type="hidden" name="a" value="<c:out value='${id_actividad}' />">
                                <h3>Introduzca los Datos</h3>
                                <c:forEach var="listaCampos" items="${listaCampos}" varStatus="contador">
                                    <div class="form-group row">
                                        <label class="control-label col-md-3">  <c:out value="${listaCampos.etiqueta}"/> <c:if test='${listaCampos.permiso == "o"}'><span style="color: #dc3545">(*)</span></c:if></label>
                                            <div class="col-md-9">
                                            <c:if test="${(!empty listaCampos.combo) and (listaCampos.id_componente == 1)}">
                                                <div class="row">
                                                    <div  class="col-10">
                                                        <select class="form-control select2" id='<c:out value="${listaCampos.campo}"/>' NAME='<c:out value="${listaCampos.campo}"/>' size='<c:out value="${listaCampos.filas}"/>'
                                                                onChange="poblar('<c:out value='${listaCampos.campo}'/>', this.options[this.selectedIndex].value)" >
                                                            <c:if test='${listaCampos.campo_padre=="\'\'"}'>
                                                                <c:forEach var="combo" items="${listaCampos.combo}"  varStatus="contador1">
                                                                    <option value="<c:out value='${combo.id_campo}'/>" ><c:out value='${combo.campo}'/> </option>
                                                                </c:forEach>
                                                            </c:if>
                                                            <c:if test='${listaCampos.campo_padre!="\'\'"}'> 
                                                                <option value='0'> - Elija una opcion - </option>
                                                            </c:if>                     
                                                        </select>
                                                    </div>
                                                    <div  class="col-2">
                                                        <button class="btn btn-primary search" type="button" data-toggle="modal" data-target="#modal_<c:out value='${listaCampos.id_campo}'/>"><i class="fa fa-search"></i></button>
                                                        <div class="modal fade" id="modal_<c:out value='${listaCampos.id_campo}'/>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel"><c:out value="${listaCampos.etiqueta}"/></h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        <input class="form-control" type="text" id="condicion_<c:out value='${listaCampos.id_campo}'/>" >
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Salir</button>
                                                                        <a class="btn btn-primary" href='javascript:llamarAjax("<c:out value='${listaCampos.id_campo}'/>","1",document.getElementById("condicion_<c:out value='${listaCampos.id_campo}'/>").value,document.getElementById("estatico_<c:out value='${listaCampos.id_campo}'/>").value);muestra_valor("<c:out value='${listaCampos.id_campo}'/>");cerrarVentana("div_<c:out value='${listaCampos.id_campo}'/>"); iniciar_pagina("pagina_<c:out value='${listaCampos.id_campo}'/>",document.getElementById("estatico_<c:out value='${listaCampos.id_campo}'/>").value);limpiarHijo("<c:out value='${listaCampos.campo}'/>");'>Filtrar</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col text-right">
                                                        <input type='hidden' id="estatico_<c:out value='${listaCampos.id_campo}'/>" value="" >
                                                        <input type='hidden' id="pagina_<c:out value='${listaCampos.id_campo}'/>" value="<c:out value='${listaCampos.pagina}'/>" >
                                                        <a id="ant_<c:out value='${listaCampos.id_campo}'/>" href='javascript:pagina_ant("pagina_<c:out value='${listaCampos.id_campo}'/>"); llamarAjax("<c:out value='${listaCampos.id_campo}'/>",document.getElementById("pagina_<c:out value='${listaCampos.id_campo}'/>").value,document.getElementById("condicion_<c:out value='${listaCampos.id_campo}'/>").value,document.getElementById("estatico_<c:out value='${listaCampos.id_campo}'/>").value); limpiarHijo("<c:out value='${listaCampos.campo}'/>");' >&lsaquo; Anterior</a>
                                                        <a id="sig_<c:out value='${listaCampos.id_campo}'/>" href='javascript:pagina_sig("pagina_<c:out value='${listaCampos.id_campo}'/>"); llamarAjax("<c:out value='${listaCampos.id_campo}'/>",document.getElementById("pagina_<c:out value='${listaCampos.id_campo}'/>").value,document.getElementById("condicion_<c:out value='${listaCampos.id_campo}'/>").value,document.getElementById("estatico_<c:out value='${listaCampos.id_campo}'/>").value); limpiarHijo("<c:out value='${listaCampos.campo}'/>")' >Siguiente &rsaquo;</a>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:set var="fin" value="1" />
                                            <c:if test="${!empty listaCampos.combo}">
                                                <c:set var="fin" value="${fn:length(listaCampos.combo) - 1}" />
                                            </c:if>
                                            <c:forEach var="_i" begin="1" end="${fin}">
                                                <c:set var="valores" value="${listaCampos.valores}" />
                                                <c:if test="${!empty listaCampos.combo}">
                                                    <c:set var="id_valor" value="${listaCampos.combo[_i].id_campo}" />
                                                    <c:set var="valores" value="${listaCampos.combo[_i].campo}" />
                                                </c:if>
                                                <c:choose>
                                                    <c:when test="${(empty listaCampos.combo) and (listaCampos.id_componente == 1)}">
                                                        <input class="form-control" type="text" name='<c:out value="${listaCampos.campo}"/>' value='<c:out value="${valores}"/>' maxlength='<c:out value="${listaCampos.caracteres}"/>' size='<c:out value="${listaCampos.columnas}"/>'/> <br>
                                                    </c:when>
                                                    <c:when test="${listaCampos.id_componente == 2}">
                                                        <textarea class="form-control" name='<c:out value="${listaCampos.campo}"/>' cols='<c:out value="${listaCampos.columnas}"/>' rows='<c:out value="${listaCampos.filas}"/>'><c:out value="${valores}"/></textarea> <br>
                                                    </c:when>
                                                    <c:when test="${listaCampos.id_componente == 3}">
                                                        <input class="form-control" type="text" name='<c:out value="${listaCampos.campo}"/>' value='<c:out value="${valores}"/>' maxlength='<c:out value="${listaCampos.caracteres}"/>' size='<c:out value="${listaCampos.columnas}"/>'/><small><a href="javascript:showCal('<c:out value="${listaCampos.campo}"/>')"><img src="../imagenes/dibRap/calendario.jpeg" border="0" /></a></small> <br>
                                                            </c:when>
                                                            <c:when test="${listaCampos.id_componente == 4}">
                                                        <input class="form-control" type="radio" name='<c:out value="${listaCampos.campo}"/>' value="true" <c:if test="${valores}">checked</c:if> />Sí &nbsp; <input type="radio" name='<c:out value="${listaCampos.campo}"/>' value="false" <c:if test="${!valores}">checked</c:if> />No <br>
                                                    </c:when>
                                                    <c:when test="${listaCampos.id_componente == 5}">
                                                        <input class="form-control" type="radio" name='<c:out value="${listaCampos.campo}"/>' value='<c:out value="${id_valor}" />' /><c:out value="${valores}"/> <br>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                            <c:forEach var="combo" items="${listaCampos.combo}">
                                                <input  type="hidden" name='<c:out value="${listaCampos.campo}" /><c:out value="${combo.id_campo}" />' value='<c:out value="${combo.campo}"/>'>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="tile-footer">
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-3">
                                            <button class="btn btn-primary" type='submit' value='Siguiente'><i class="fa fa-fw fa-lg fa-check-circle"></i>Siguiente</button>&nbsp;&nbsp;&nbsp;
                                         <!-- <input type='button' value='Siguiente' class="btn btn-primary" onClick='obligar(document.forma, "<c:out value='${obligatorios}'/>")' onBlur="inicio(document.forma._foqueame);">-->
                                        </div>
                                    </div>
                                </div> 
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="hidden" name="t" value='<c:out value="${tabla.id_tabla}"/>' >
                                <input type="hidden" name="e" value='<c:out value="${id_enlace}"/>' >
                                <input type="hidden" name="p" value="<c:out value='${permiso}' />">
                                <input type="hidden" name="f" value="<c:out value='${condicion}' />">
                                <input type="hidden" name="a" value="<c:out value='${id_actividad}' />">
                                <input type="hidden" id='urlRecibir' value="<c:url value='/herramientas/combos/recargarCombos.fautapo' />" >
                                <div class="nota">
                                    Los campos con <font color='red'>(*)</font>, son obligatorios. A los campos vac&iacute;os se les asignar&aacute; un valor por defecto.
                                </div>
                            </form>
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
        <script src="<c:url value='/Public/Js/plugins/select2.min.js'/>" type="text/javascript"></script>
        <script language="JavaScript">
                                                                    $('.select2').select2();
                                                                    <!--
        var calFormat = "<c:out value='${formatoFecha}' />";
        
        //----------------
        var padre_hijo = new Array();
        h = 0;
        <c:forEach var="listaCampos" items="${listaCampos}" varStatus="contador">
        <c:if test="${(!empty listaCampos.combo) and (listaCampos.id_componente != 5)}">
        padre_hijo[h] = new Array("<c:out value='${listaCampos.campo}'/>", "<c:out value='${listaCampos.campo_padre}' escapeXml='false' />", "<c:out value='${listaCampos.id_campo                                                                                                                                                }'/>");
        h++;
        </c:if>
        </c:forEach>
        //----------------                                        ---
        function pagina_sig(pag) 
        {
                                                                            var pagi = document.getElementById(pag);
                                                                    pagi.value = parseFloat(pagi.value) + 1;
                }
                
                
            function pagina_ant(pag) {
                                                                            var pagi = document.getElementById(pag);
                                                                    pagi.value = parseFloat(pagi.value) - 1;
        }
        
        
    function iniciar_pagina(pag) {
                                                                            var pagi = document.getElementById(pag);
                                                                    pagi.value = "1";
                    }
                    
                
            
            function abrirVentana(obj) {
                                                                            if (document.getElementById(obj).style.visibility == 'hidden') {
                                                                    document.getElementById(obj).style.visibility = "visible";
                                                                    }
                                }
                                
                                
                                function cerrarVentana(obj) {
                                                                            document.getElementById(obj).style.visibility = "hidden";
                                }
                                
                                
                                var nav4 = window.Event ? true : false;
                                function aceptaNumeros(evt) 
                                {
                                                                            var key = nav4 ? evt.which : evt.keyCode;
                                                                    return (key <= 13 || (key >= 48 && key <= 57));
                                        }
                                        
                                        
                                        function muestra_valor(valor) {
                                                                            condi = document.getElementById("condicion_" + valor);
                                                                    muest = document.getElementById("busca_" + valor);
                                                                    muest.style.visibility = 'hidden';
                                                                    muest.innerHTML = condi.value;
                                                                    muest.style.visibility = 'visible';
                                                                }
                                                                
                                                                
                                                            function buscarHijo(padre) {
                                                                            var hijo = new Array();
                                                                    k = 0;
                                                                    for (i = 0; i < padre_hijo.length; i++) {
                                                                    if (padre_hijo[i][1] == padre) {
                                                                    hijo[k] = new Array(padre_hijo[i][0], padre_hijo[i][2]);
                                                                    k++;
                                                                    }
                                                                    }
                                                                    return hijo;
                                                    }
                                                    
                                                    
                                                        function poblar(nombre, filtro) {
                                                                            var hijos = buscarHijo(nombre);
                                                                    for (j = 0; j < hijos.length; j++) {
                                                                    est = document.getElementById("estatico_" + hijos[j][1]);
                                                                    est.value = filtro;
                                                                    cond = document.getElementById("condicion_" + hijos[j][1]).value;
                                                                    llamarAjax(hijos[j][1], "1", cond, filtro);
                                                                    limpiarHijo(hijos[j][0]);
                                                                    }
                                                                        }
                                                                        
                                                                            
                                                                        function limpiarHijo(nombre) {
                                                                            var hijos1 = buscarHijo(nombre);
                                                                    for (j = 0; j < hijos1.length; j++) {
                                                                    objeto = document.getElementById(hijos1[j][0])
                                                                            for (m = objeto.options.length - 1; m > 0; m--) {
                                                                    objeto.options[m] = null;
                                                                    }
                                                                    objeto.options[0] = new Option("- Elija una opcion -", "0");
                                                                    limpiarHijo(hijos1[j][0]);
                                                                    }
                                                                        }
                                                                        
                                                                        -->
</script>
    </body>
</html>
