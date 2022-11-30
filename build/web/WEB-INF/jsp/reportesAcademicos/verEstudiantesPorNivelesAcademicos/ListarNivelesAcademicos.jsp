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
          <td align="center"><font size="3"><b><c:out value='${datosInstitucion.localidad}'/> - <c:out value='${datosInstitucion.departamento}'/> - <c:out value='${datosInstitucion.pais}'/></b></font></td>
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
    <td colspan="2" align="center"><h2>DETALLE DE ESTUDIANTES POR NIVEL ACADEMICO</h2></td>
  </tr>
</table>
  <br>
  <table class="tabla" width="550">
  <tr><th width="120" align="right">Facultad<th>:</th><td colspan="4"><c:out value="${datosFacultad.facultad}" /></td></tr>
  <tr><th width="120" align="right">Programa<th>:</th><td width="200"><c:out value="${datosPrograma.programa}" /></td><th align="right">Plan</th><th>:</th><td><c:out value="${id_plan}" /></td></tr>
  <tr><th width="120" align="right">Periodo<th>:</th><td><c:out value="${periodo}" /></td><th align="right">Gesti&oacute;n</th><th>:</th><td><c:out value="${gestion}" /></td></tr>  
  </table>
  <table class="tabla" border=1 width="550">
<tr><th width="40">Nro.</td><th>R.U.</th><th>Estudiante</th><th>Nivel</th></tr>
      <c:forEach var="listarNiveles" items="${listaNiveles}" varStatus="contador">
      <tr><td align="center"><c:out value="${contador.count}"/></td><td align="right"><c:out value="${listarNiveles.id_estudiante}"/></td><td><c:out value="${listarNiveles.nombres}" /></td><td align="center"><c:out value="${listarNiveles.nivel_academico}" /></td></tr>
      </c:forEach>
  </table>      
</center>
<%@ include file="../../Inferior.jsp" %>