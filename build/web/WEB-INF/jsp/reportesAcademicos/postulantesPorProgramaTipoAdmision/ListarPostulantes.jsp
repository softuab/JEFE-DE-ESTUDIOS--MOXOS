<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<table border="0" width="100%">
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
        <td align="center"><label><h2>POSTULANTES INSCRITOS POR PROGRAMA Y TIPO ADMISION</h2></label></td>
      </tr>
    </table>
    <table border="0" width="97%">
      <tr>
        <td>PROGRAMA::</td>
        <td><c:out value="${datosPrograma.programa}"/></td>
        <td>AREA::</td>
        <td><c:out value="${datosFacultad.facultad}"/></td>
      </tr>
      <tr>
        <td>TIPO ADMISION::</td>
        <td><c:out value="${datosTipoAdmision.tipo_admision}"/></td>
        <td>PERIODO ::</td>
        <td><c:out value="${periodo}"/> - <c:out value="${gestion}"/></td>
      </tr>
    </table>
    <br>
    </td>
  </tr>
  </thead>
  <!-- HASTA AQUI SE REPITE-->
  <tr>
    <td>
      <table class="tabla" width="100%">
        <thead>
        <tr>
          <th>Nro</th>
          <th>R.P.</th>
		  <th>C.I.</th>  
          <th>PATERNO</th>
          <th>MATERNO</th>
		  <th>NOMBRES</th>
          <th>FECHA</th>
          <th>ESTADO</th>
        </tr>
        </thead>
        <c:forEach var="lista" items="${lPostulantes}" varStatus="contador">
          <tr>
            <td><c:out value="${contador.count}"/></td>
            <td><c:out value="${lista.id_postulante}"/></td>
			<td><c:out value="${lista.dip}"/></td>            
            <td><c:out value="${lista.paterno}"/></td>
            <td><c:out value="${lista.materno}"/></td>
			<td><c:out value="${lista.nombres}"/></td>
            <td><fmt:formatDate value="${lista.fec_registro}" pattern="${formatoFecha}"/></td>
            <td><c:out value="${lista.estado}"/></td>
          </tr>
        </c:forEach>
      </table>
    </td>
  </tr>
</table>
<%@ include file="../../Inferior.jsp" %>