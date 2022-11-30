<%@ include file="../Superior.jsp"%>

<div class="titulo"> Ver Datos del Informe</div>
<br>
<table>
  <tr>
    <td>
      <div><a class="volver" href="<c:url value="/listarInformes.fautapo?id_proceso=${id_proceso}"></c:url>">Volver</a></div>
    </td>
  </tr>
</table>

<table class="tabla">
  <tr>
    <td class="etiqueta">Proceso</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${datosProceso.proceso}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Actividad</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${actividad.actividad}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Informe</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${datosInforme.informe}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Descripci&oacute;n</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${datosInforme.descripcion}"/></td>
  </tr>
  <tr>
    <td colspan="3">
      <br><c:out value="${datosInforme.contenido}" escapeXml="False"/>
    </td>
  </tr>
</table>

<%@ include file="../Inferior.jsp" %>