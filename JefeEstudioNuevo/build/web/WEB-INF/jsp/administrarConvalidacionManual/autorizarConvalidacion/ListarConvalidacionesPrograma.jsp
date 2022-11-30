<%@ include file="../../Superior.jsp" %>

<div class="titulo">Autorizar Convalidaci&oacute;n Manual </div>
<br>
<table>
  <tr>    
    <td>
      <form name="fvolver" action="<c:url value='comprobarEntrada.fautapo'/>" method="post">
        <input type="hidden" name="gestion" value="<c:out value='${gestion}'/>">
        <input type="hidden" name="periodo" value="<c:out value='${periodo}'/>">
	<input type="hidden" name="id_programa" value="<c:out value='${datosPrograma.id_programa}'/>">
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </td>
  </tr>
</table>
<table class="tabla">
  <tr>
    <th class=colh>USUARIO AUTORIZADO</th>
    <th class=colh>PROGRAMA</th>
  </tr>  
  <tr>
    <td class=colb><c:out value="${usuario}"/></td>
    <td class=colb><c:out value="${datosPrograma.programa}"/></td>
  <tr>  
</table>
<br>
<h3>Convalidaciones Cargadas para el Programa</h3>
<table class="tabla">
  <tr>
    <th>Nro.</th>
    <th>R.U.</th>
    <th>ESTUDIANTE</th>
    <th>TIPO DE <BR> CONVALIDACION</th>
    <th>UNIVERSIDAD</th>
    <th>PROGRAMA</th>
    <th>PLAN</th>
    <th>ESTADO</th>
    <th>GESTION/PERIODO</th>
    <th>USUARIO<BR>AUTORIZADO</th>
    <th>VER DETALLE<BR>NOTAS</th>
  </tr>
  <c:if test="${!empty lConvalidacionManualPrograma}">
  <c:forEach var="lista" items="${lConvalidacionManualPrograma}" varStatus="contador">
  <tr>
    <td><c:out value="${contador.count}"/></td>
    <td><c:out value="${lista.id_estudiante}"/></td>
    <td><c:out value="${lista.paterno}"/>&nbsp;<c:out value="${lista.materno}"/>&nbsp;<c:out value="${lista.nombres}"/></td>
    <td><c:out value="${lista.tipo_convalidacion}"/></td>
    <td><c:out value="${lista.universidad}"/></td>
    <td><c:out value="${lista.programa}"/></td>
    <td><c:if test="${!empty lista.id_plan}"><c:out value="${lista.id_plan}"/></c:if><c:if test="${empty lista.id_plan}">---</c:if></td>
    <td><c:out value="${lista.estado}"/></td>
    <td><c:out value="${lista.periodo}"/>/<c:out value="${lista.gestion}"/></td>
    <td>SI
      
    </td>
    <td>
      
      <form name="fDetalle<c:out value="${contador.count}"/>" method="post" action="<c:url value="/autorizarConvalidacionManual/listarConvalidacionesPrograma.fautapo"/>">
        <input type="hidden"   name="id_programa"      value="<c:out value="${datosPrograma.id_programa}"/>">
	<input type="hidden"   name="id_convalidacion" value="<c:out value="${lista.id_convalidacion}"/>">
	<div> <a class="buscar" href="javascript:document.fDetalle<c:out value="${contador.count}"/>.submit();"> Ver Detalle</a> </div>
      </form>
      
    </td>
  </tr>
  </c:forEach>
  </c:if>
  <c:if test="${empty lConvalidacionManualPrograma}">
  <tr>
    <td colspan="11"><div class="nota"><font color="red" size=""1>*</font>&nbsp;No existen Convalidaciones cargadas para el programa de <c:out value="${datosPrograma.programa}"/></div></td>
  </tr>    
  </c:if>
</table>

<%@ include file="../../Inferior.jsp" %>