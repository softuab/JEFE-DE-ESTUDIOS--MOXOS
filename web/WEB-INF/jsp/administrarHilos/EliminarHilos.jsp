<%@ include file="../Superior.jsp"%>

<div class="titulo"> Eliminar Hilo</div>
<div><a class="volver" href="<c:url value="/listarHilos.fautapo"></c:url>">Volver </a></div>
<br>

<form method=post action='<c:url value="/eliminarHilos1.fautapo"/>'
  <table class="tabla">
    <tr>
      <th>Asunto</th>
      <th>::</th>
      <td class="etiqueta">
        <c:out value="${asunto}"/>
      </td>
    </tr>
  </table>
  <center>
    <h4>&iquest;Confirma eliminar la Tarea?</h4>
    <input type="hidden" name="id_hilo" value='<c:out value="${id_hilo}"/>' >
    <input type="hidden" name="asunto" value='<c:out value="${asunto}"/>' >
    <input class="aceptar"  type="submit" value='Si' > &nbsp; &nbsp; &nbsp; &nbsp;
    <input class="cancelar" type="button" value='No' onclick="javascript:history.back();">
  </center>
</form>

<%@ include file="../Inferior.jsp" %>