<%@ include file="../Superior.jsp"%>

<div class="titulo"> Adjuntar Archivos</div>
<div><a class="volver" href="<c:url value="/listarSegmentos.fautapo"><c:param name="id_hilo" value="${id_hilo}"/></c:url>">Volver </a></div>
<br>

<form name="forma" method="POST" enctype='multipart/form-data' >

<table class="formulario" align="left">
  <tr>
    <td class="etiqueta">Direcci&oacute;n</td>
    <td class="etiqueta">::</td>
    <td><input type="file" name="fichero"></td>
  </tr>
  <tr>
    <td class="etiqueta">Direcci&oacute;n</td>
    <td class="etiqueta">::</td>
    <td><input type="file" name="fichero"></td>
  </tr>
  <tr>
    <td class="etiqueta">Direcci&oacute;n</td>
    <td class="etiqueta">::</td>
    <td><input type="file" name="fichero"></td>
  </tr>
  <tr>
    <td><input type="submit" class="adjuntar" name='accion' value="Adjuntar"></td>
  </tr>
</table>
  <input type="hidden" name="id_hilo"     value='<c:out value="${id_hilo}"/>'>
  <input type="hidden" name="id_segmento" value='<c:out value="${id_segmento}"/>'>
  <input type="hidden" name="asunto"      value='<c:out value="${asunto}"/>'>
  <input type="hidden" name="aplicacion"  value='<c:out value="${aplicacion}"/>'>
</form>
<%@ include file="../Inferior.jsp"%>
