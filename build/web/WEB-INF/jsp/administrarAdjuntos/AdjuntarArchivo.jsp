<%@ include file="../Superior.jsp" %>

<div class="titulo">Adjuntando Archivos</div>

<div><a class="volver" href="javascript:history.back();">Volver</a></div></td>
<br>

<center>
<form name="forma" method="POST" enctype='multipart/form-data'>
  <table class="formulario">
    <tr>
      <th>Direcci&oacute;n</th>
      <th>::</th>
      <td><input type=file name="fichero"></td>
    </tr>
    <tr>
      <th>Direcci&oacute;n</th>
      <th>::</th>
      <td><input type=file name="fichero"></td>
    </tr>
    <tr>
      <th>Direcci&oacute;n</th>
      <th>::</th>
      <td><input type=file name="fichero"></td>
    </tr>
    <tr>
  </table>
  <input type="submit" class="adjuntar" value="Adjuntar" onclick="document.forma.action='<c:url value="/adjuntarArchivo1.fautapo">
      <c:param name="id_tramite"          value="${id_tramite}"/>
      <c:param name="id_actividad_actual" value="${id_actividad}"/>
      <c:param name="id_proceso"          value="${id_proceso}"/>
      <c:param name="id_form"             value="${id_form}"/>
      <c:param name="aplicacion"          value="${aplicacion}"/>
     </c:url>'">
</form>
</center>
<%@ include file="../Inferior.jsp" %>