<%@ include file="../../Superior.jsp"%>
<div class="titulo"><c:out value="${titulo}"/></div>
<br>
<form name="fvolver" action="<c:url value='/registrarTramiteNuevo.fautapo'/>" method="post">
   <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
</form>
<form action="<c:url value='/estudianteAntiguoPost/listarEstudiantes.fautapo'/>" method="post">
<!--
<table class="tabla">
  <tr>
    <th> GESTION </th>
    <th>PERIODO </th>
  </tr>
  <tr>
    <td><c:out value="${gestion}"/>
    <input type="hidden" name="gestion" value="<c:out value="${gestion}"/>"/></td>
    <td><c:out value="${periodo}"/>
    <input type="hidden" name="periodo" value="<c:out value="${periodo}"/>" /></td>
  </tr>
</table>
-->
<table class="formulario">
  <tr>
    <th colspan="3"> BUSCAR ESTUDIANTE
    </th>
  </tr>     
  <tr>
    <td colspan="3">
    <fieldset>
      <legend>Introduzca Registro Universitario</legend>
    <table align=right>
      <tr>
        <td class="etiqueta">R.U.</td>
        <td class="etiqueta">::</td>
        <td><input type=text name="ru" maxlength="8"/></td>
        <td><input type=submit name="botonRu" value='Buscar' class="buscar"></td>
      </tr>
    </table>
    </fieldset>
    </td>
  </tr>
    <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
    <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
    <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
</table>
</form>

<%@ include file="../../Inferior.jsp" %>