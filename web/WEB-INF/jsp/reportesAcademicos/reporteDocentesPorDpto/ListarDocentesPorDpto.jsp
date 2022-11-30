<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<script language='JavaScript' SRC="./validar.js">  </script>
<table border="0" width="100%">
  <!-- SE REPITE-->
  <tr>
    <td width="14%" align="center">
      <img src="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion">
    </td>
    <td width="72%" align="center">
      <table width="100%" heigth="100%" cellpading="2" cellspacing="0" >
        <tr>
          <td align="center"><h1><b><c:out value='${datosInstitucion.institucion}'/></h1></td>
        <tr>
        <tr>
          <td align="center"><font size="3"><b><c:out value='${datosInstitucionsede.localidad}'/> - <c:out value='${datosInstitucionsede.departamento}'/> - <c:out value='${datosInstitucionsede.pais}'/></b></font></td>
        <tr>
        </tr>
          <td align="center"><c:out value='${datosInstitucion.actividad}'/></td>
        </tr>
      </table>
    </td>
    <td width="14%">
      Fecha : <a href='javascript: window.print()'><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></a> 
    </td>
  </tr>
</table>
<hr>
<center>
<table>
  <tr>
    <td colspan="2" align="center"><h2>DETALLE DE DOCENTES POR DEPARTAMENTO</h2></td>
  </tr>
</table>
  <br>
  <table class="tabla" width="700">
  <tr><th width="120" align="right">Departamento<th>:</th><td colspan="4"><c:out value="${dpto.departamento}" /></td></tr>
  <tr><th width="120" align="right">Periodo<th>:</th><td width="350"><c:out value="${periodo}" /></td><th align="right">Gesti&oacute;n</th><th>:</th><td><c:out value="${gestion}" /></td></tr>  
  </table>
  <table class="tabla" border=1 width="700">
<tr><th width="40">Nro.</td><th width="310">Docente</th><th width="300">Asignatura</th><th>Grupo</th></tr>
      <c:forEach var="listarDocentesPorDpto" items="${listarDocentesPorDpto}" varStatus="contador">
      <tr><td align="center"><c:out value="${contador.count}"/></td><td><c:out value="${listarDocentesPorDpto.nombre_completo}"/></td>
          <td><c:out value="${listarDocentesPorDpto.materia}" /></td><td align="center"><c:out value="${listarDocentesPorDpto.id_grupo}" /></td></tr>
      </c:forEach>
  </table>      
</center>
<%@ include file="../../Inferior.jsp" %>