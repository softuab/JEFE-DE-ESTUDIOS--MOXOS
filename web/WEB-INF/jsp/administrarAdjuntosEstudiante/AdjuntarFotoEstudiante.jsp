<%@ include file="../Superior.jsp" %>

<div class="titulo">Adjuntando Foto Estudiante</div>
<br>
<form action="adjListarFoto.fautapo" method=post name="fvolver">
  <input type = "hidden" name = "id_estudiante" value = "<c:out value = "${id_estudiante}"/>">
  <input type = "hidden" name = "bandera" value="<c:out value = "${bandera}"/>">
 <div> <a class="volver" href="javascript: document.fvolver.submit();">Volver</a></div>
</form>
<br>
<table class="tabla">
  <tr>
    <th> Estudiante ::</th>
    <td><c:out value="${datosEst.nombres}"/>&nbsp;<c:out value="${datosEst.paterno}"/>&nbsp;<c:out value="${datosEst.materno}"/> </td>
  </tr>
</table>
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
  </table>
  <input type="submit" class="adjuntar" value="Adjuntar" onclick="document.forma.action='<c:url value="/estudiante/adjuntarFotoEstudiante1.fautapo">
      <c:param name="id_estudiante"          value="${id_estudiante}"/>
      <c:param name="id_persona"          value="${id_persona}"/>
      <c:param name="aplicacion"          value="${aplicacion}"/>
     </c:url>'">
</form>
</center>
<%@ include file="../Inferior.jsp" %>