<%@ include file="../../Superior.jsp" %>

<div class="titulo">Agregando <c:out value="${tabla.etiqueta}" /></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<body onLoad='inicio(document.forma._foqueame);'>
<form name='forma' method="post" action="registrarNuevo.fautapo">
  <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>" >
  <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>" >
  <input type="hidden" name="id_tabla" value="<c:out value='${tabla.id_tabla}'/>" >
  <input type="hidden" id='urlRecibir' value="<c:url value='/herramientas/combos/recargarCombos.fautapo' />" >
  
<table class="formulario">
<tr>
  <th colspan="3">INTRODUZCA LOS DATOS<input type="text" name="_foqueame" style="position:absolute; left:-100px; top:-100px"></th>
</tr>
<c:forEach var="lista" items="${listaCampos}" varStatus="contador">
  <tr>
    <td class="etiqueta"><c:out value="${lista.etiqueta}"/><c:if test='${lista.permiso == "o"}'><font color='red'>(*)</font></c:if></td>
    <td class="etiqueta">::</td>
    <td>
      <c:if test="${(!empty lista.combo) and (lista.id_componente == 1)}">
        <select id='<c:out value="${lista.campo}"/>' name='<c:out value="${lista.campo}"/>' size='<c:out value="${lista.filas}"/>'
            onChange="poblar('<c:out value='${lista.campo}'/>', this.options[this.selectedIndex].value )" >
          <c:if test='${lista.campo_padre=="\'\'"}'>
            <c:forEach var="combo" items="${lista.combo}"  varStatus="contador1">
              <option value="<c:out value='${combo.id_campo}'/>" ><c:out value='${combo.campo}'/></option>
            </c:forEach>
          </c:if>
          <c:if test='${lista.campo_padre!="\'\'"}'>
            <option value='0'>- Elija una opcion -</option>
          </c:if>
        </select>
        <span id="div_<c:out value='${lista.id_campo}'/>" style="position:absolute; visibility:hidden; background-color:#FFFFCC; z-index:5">
          <input type="text" id="condicion_<c:out value='${lista.id_campo}'/>" >
          <a href='javascript:llamarAjax("<c:out value='${lista.id_campo}'/>","1",document.getElementById("condicion_<c:out value='${lista.id_campo}'/>").value,document.getElementById("estatico_<c:out value='${lista.id_campo}'/>").value);muestra_valor("<c:out value='${lista.id_campo}'/>");cerrarVentana("div_<c:out value='${lista.id_campo}'/>"); iniciar_pagina("pagina_<c:out value='${lista.id_campo}'/>",document.getElementById("estatico_<c:out value='${lista.id_campo}'/>").value);limpiarHijo("<c:out value='${lista.campo}'/>");'>Filtrar</a>
	</span>
        <a href='javascript: abrirVentana("div_<c:out value='${lista.id_campo}'/>")'>Buscar</a>::<div id="busca_<c:out value='${lista.id_campo}'/>"></div>
        <div>
          <input type='hidden' id="estatico_<c:out value='${lista.id_campo}'/>" value="" >
          <input type='hidden' id="pagina_<c:out value='${lista.id_campo}'/>" value="<c:out value='${lista.pagina}'/>" >
          <a id="ant_<c:out value='${lista.id_campo}'/>" href='javascript:pagina_ant("pagina_<c:out value='${lista.id_campo}'/>"); llamarAjax("<c:out value='${lista.id_campo}'/>",document.getElementById("pagina_<c:out value='${lista.id_campo}'/>").value,document.getElementById("condicion_<c:out value='${lista.id_campo}'/>").value,document.getElementById("estatico_<c:out value='${lista.id_campo}'/>").value); limpiarHijo("<c:out value='${lista.campo}'/>");' >&lsaquo; Anterior</a>
          <a id="sig_<c:out value='${lista.id_campo}'/>" href='javascript:pagina_sig("pagina_<c:out value='${lista.id_campo}'/>"); llamarAjax("<c:out value='${lista.id_campo}'/>",document.getElementById("pagina_<c:out value='${lista.id_campo}'/>").value,document.getElementById("condicion_<c:out value='${lista.id_campo}'/>").value,document.getElementById("estatico_<c:out value='${lista.id_campo}'/>").value); limpiarHijo("<c:out value='${lista.campo}'/>")' >Siguiente &rsaquo;</a>
	</div>
      </c:if>
      <c:set var="fin" value="1" />
      <c:if test="${!empty lista.combo}">
        <c:set var="fin" value="${fn:length(lista.combo) - 1}" />
      </c:if>
      <c:forEach var="_i" begin="1" end="${fin}">
        <c:set var="valores" value="${lista.valores}" />
        <c:if test="${!empty lista.combo}">
          <c:set var="id_valor" value="${lista.combo[_i].id_campo}" />
          <c:set var="valores" value="${lista.combo[_i].campo}" />
        </c:if>
        <c:choose>
          <c:when test="${(empty lista.combo) and (lista.id_componente == 1)}">
            <input type="text" name='<c:out value="${lista.campo}"/>' value='<c:out value="${valores}"/>' maxlength='<c:out value="${lista.caracteres}"/>' size='<c:out value="${lista.columnas}"/>'/> <br>
          </c:when>
          <c:when test="${lista.id_componente == 2}">
            <textarea name='<c:out value="${lista.campo}"/>' cols='<c:out value="${lista.columnas}"/>' rows='<c:out value="${lista.filas}"/>'><c:out value="${valores}"/></textarea> <br>
          </c:when>
          <c:when test="${lista.id_componente == 3}">
            <input type="text" name='<c:out value="${lista.campo}"/>' value='<c:out value="${valores}"/>' maxlength='<c:out value="${lista.caracteres}"/>' size='<c:out value="${lista.columnas}"/>'/><small><a href="javascript:showCal('<c:out value="${lista.campo}"/>')"><img src="../imagenes/dibRap/calendario.jpeg" border="0" /></a></small> <br>
          </c:when>
          <c:when test="${lista.id_componente == 4}">
            <input type="radio" name='<c:out value="${lista.campo}"/>' value="true" <c:if test="${valores}">checked</c:if> />S&iacute; &nbsp; <input type="radio" name='<c:out value="${lista.campo}"/>' value="false" <c:if test="${!valores}">checked</c:if> />No <br>
          </c:when>
          <c:when test="${lista.id_componente == 5}">
            <input type="radio" name='<c:out value="${lista.campo}"/>' value='<c:out value="${id_valor}" />' /><c:out value="${valores}"/> <br>
          </c:when>
        </c:choose>
      </c:forEach>
    </td>
  </tr>
</c:forEach>
</table>
<center>
  <input type='button' value='Siguiente' class="siguiente" onClick='obligar(document.forma, "<c:out value='${obligatorios}'/>")' onBlur="inicio(document.forma._foqueame);">
  <input type="text" name="_foqueame2" readonly="readonly" style="position:absolute; left:-100px; top:-100px">
</center>
<div class="nota">
  Los campos con <font color='red'>(*)</font>, son obligatorios. <br/>
  A los campos vac&iacute;os se les asignar&aacute; un valor por defecto.
</div>
</form>
</body>

<script language="JavaScript">
var calFormat="<c:out value='${formatoFecha}' />";
//----------------
var padre_hijo=new Array();
h=0;
<c:forEach var="lista" items="${listaCampos}" varStatus="contador">
  <c:if test="${(!empty lista.combo) and (lista.id_componente != 5)}">
    padre_hijo[h]=new Array("<c:out value='${lista.campo}'/>", "<c:out value='${lista.campo_padre}' escapeXml='false' />","<c:out value='${lista.id_campo}'/>");
    h++;
  </c:if>
</c:forEach>
//-------------------
function pagina_sig(pag) {
  var pagi=document.getElementById(pag);
  pagi.value=parseFloat(pagi.value) + 1;
}
function pagina_ant(pag) { 
  var pagi=document.getElementById(pag);
  pagi.value=parseFloat(pagi.value) - 1;
}
function iniciar_pagina(pag) { 
  var pagi=document.getElementById(pag);
  pagi.value="1";
}
function abrirVentana(obj) {
  if (document.getElementById(obj).style.visibility=='hidden')
    document.getElementById(obj).style.visibility="visible"; 
}
function cerrarVentana(obj) {
  document.getElementById(obj).style.visibility="hidden";    
}
var nav4=window.Event ? true : false;
function aceptaNumeros(evt) {
  var key=nav4 ? evt.which : evt.keyCode;
  return (key <=13 || (key >=48 && key <=57));
}
function muestra_valor(valor) {
  condi=document.getElementById("condicion_" + valor);
  muest=document.getElementById("busca_" + valor);    
  muest.style.visibility='hidden';
  muest.innerHTML=condi.value;
  muest.style.visibility='visible';
}
function buscarHijo(padre) {
  var hijo=new Array();
  k=0;
  for (i=0;i<padre_hijo.length;i++)
    if (padre_hijo[i][1]==padre) {
      hijo[k]=new Array(padre_hijo[i][0],padre_hijo[i][2]);
      k++;
    }
  return hijo;
}
function poblar(nombre, filtro) {
  var hijos=buscarHijo(nombre);
  for (j=0;j<hijos.length;j++) {
    est=document.getElementById("estatico_" + hijos[j][1]);
    est.value=filtro;
    cond =document.getElementById("condicion_" + hijos[j][1]).value;
    llamarAjax(hijos[j][1],"1",cond,filtro);
    limpiarHijo(hijos[j][0]);
  }
}
function limpiarHijo(nombre) {
  var hijos1=buscarHijo(nombre);
  for (j=0;j<hijos1.length;j++) {
    objeto=document.getElementById(hijos1[j][0]);
    for (m=objeto.options.length-1;m>0;m--)
      objeto.options[m]=null;
    objeto.options[0]=new Option("- Elija una opcion -","0");
    limpiarHijo(hijos1[j][0]);
  }
}
</script>
<%@ include file="../../Inferior.jsp" %>