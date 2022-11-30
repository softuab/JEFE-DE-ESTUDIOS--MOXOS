<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<table width="100%">
  <!-- SE REPITE-->
  <thead>
  <tr>
    <td width="100%" align="center" cellspancin="0" cellpading="0">
    <table width="100%">
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
    <table width="100%" align="center">
      <tr>
        <td align="center"><label><h2>LISTADO DE ESTUDIANTES CON PRORROGA</h2></label></td>
      </tr>
    </table>
    <table border="0" width="97%">
      <tr>
        <td>PROGRAMA::</td>
        <td><c:out value="${datosPrograma.programa}"/></td>
        <td>AREA::</td>
        <td><c:out value="${datosFacultad.facultad}"/></td>
      </tr>
    </table>
    <br>
    </td>
  </tr>
  </thead>
  <!-- HASTA AQUI SE REPITE-->
  <tbody>
  <tr>
    <td>
      <table class="tabla" width="100%">
        <thead>
        <tr>
          <th>Nro</th>
          <th>R.U.</th>
          <th>NOMBRES Y APELLIDO</th>
          <th>TIPO DE DOCUMENTO</th>
          <th>TIPO DE COMPROMISO</th>
          <th>OBSERVACION</th>
          <th>FECHA VENCIMIENTO</th>
        </tr>
	</thead>
        <c:forEach var="lista" items="${lEstudiantes}" varStatus="contador">
          <tr>
            <td><c:out value="${contador.count}"/></td>
            <td><c:out value="${lista.id_estudiante}"/></td>
            <td><c:out value="${lista.nombre_completo}"/></td>
            <td><c:out value="${lista.tipo_documento}"/></td>
            <td><c:out value="${lista.tipo_compromiso}"/></td>
            <td><c:out value="${lista.observacion}"/></td>
            <td><c:out value="${lista.fec_vencimiento}"/></td>
          </tr>
        </c:forEach>
      </table>
    </td>
  </tr>
  </tbody>
</table>
<%@ include file="../../Inferior.jsp" %>