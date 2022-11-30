<%@ include file="../../Superior.jsp"%>
<div class="titulo">Autorizar Convalidaci&oacute;n Manual</div>
<br>
<center>
<table class='cuadroAviso'>
  <tr>
    <td align="center">  
      <div class="titulo">¡Aviso!</div>
    </td>
  </tr>
  <tr>    
    <td aling="center">  
      <c:out value="${mensaje}"/>
    </td>
  </tr>
  <tr>    
    <td align="center">
      <form name="fvolver" action="<c:url value='/autorizarConvalidacionManual/comprobarEntrada.fautapo'/>" method="post">
        <input type="hidden" name="id_programa"    value="<c:out value='${datosPrograma.id_programa}'/>">
	<input type="hidden" name="id_universidad" value="<c:out value='${id_universidad}'/>">
	<input type="hidden" name="gestion"       value="<c:out value='${gestion}'/>">
	<input type="hidden" name="periodo"       value="<c:out value='${periodo}'/>">
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </td>
  </tr>
  <c:if test="${!empty lNotasCruceCnvDetalles}">
  <tr>
    <td align="center" width="100">
      <table width="100" class="tabla">
        <tr>
          <th>Nro.</th>
          <th>SIGLA</th>
          <th>MATERIA</th>
          <th>GESTION</th>
          <th>PERIODO</th>
        </tr>
        <c:forEach var="lista" items="${lNotasCruceCnvDetalles}" varStatus="contador">
        <tr>
	  <td><c:out value="${contador.count}"/></td>
          <td><c:out value="${lista.sigla}"/></td>
	  <td><c:out value="${lista.materia}"/></td>
	  <td><c:out value="${lista.gestion}"/></td>
	  <td><c:out value="${lista.periodo}"/></td>
        </tr>
        </c:forEach>
      </table>
    </td>
  </tr>
  </c:if>
</table>
</center>

<%@ include file="../../Inferior.jsp"%>