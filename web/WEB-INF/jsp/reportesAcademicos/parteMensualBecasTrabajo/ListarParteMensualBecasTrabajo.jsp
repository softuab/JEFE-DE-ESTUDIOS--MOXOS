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
          <table width="100%" heigth="100%" cellpading="2" cellspacing="0">
            <tr>
              <td align="center"><font size="5"><b><c:out value='${datosInstitucion.institucion}'/></font></td>
            <tr>
            <tr>
              <td align="center"><br/><font size="3"><b><c:out value='${datosInstitucionsede.localidad}'/> - <c:out value='${datosInstitucionsede.departamento}'/> - <c:out value='${datosInstitucionsede.pais}'/></b></font></td>
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
        <td align="center"><h2>LISTA GLOBAL DE BECAS</h2></td>
      </tr>
      <tr>
      <td align="center">
      <h2>MES : <fmt:formatDate value="${now}" pattern="MMMM"/> <fmt:formatDate value="${now}" pattern="yyyy"/></2>
      </td>
      </tr>                  
      
    </table>
    <table border="0" >
    <!--
      <tr>
        <td align="left">GESTION ::</td>
        <td aling="left"><c:out value="${gestion}"/></td>
      </tr> 	
      <tr>
        <td>PERIODO::</td>
        <td><c:out value="${periodo}"/></td>
      </tr>
    -->  
      <tr>
        <th>UNIDAD::</th>
        <td><c:out value="${ubicacion_organica.ubicacion_organica}"/></td>
      </tr>      
    </table>
</table>    
<table border="0" class="tabla" width="100%">
<tr>
<th rowspan="2">#</th>
<th rowspan="2">PROGRAMA</th>
<th rowspan="2">R.U</th>
<th rowspan="2">C.I.</th>
<th rowspan="2">PROCEDENCIA</th>
<th rowspan="2">NOMBRES Y APELLIDOS</th>
<th rowspan="2">TIPO DE BECA</th>
<th rowspan="2">NRO. RECIBO</th>
<th rowspan="2">TOTAL</th>
</tr>

<tr>
    
</tr>

<c:forEach var="listarEstBecasTrabajo" items="${listarEstBecasTrabajoFuncional}" varStatus="contador">	    
    <tr>
	<td><c:out value="${contador.count}"/></td>
	<td><c:out value="${listarEstBecasTrabajo.ubicacion_organica}"/></td>
	<td><c:out value="${listarEstBecasTrabajo.id_estudiante}"/></td>
	<td><c:out value="${listarEstBecasTrabajo.paterno}"/></td>
	<td><c:out value="${listarEstBecasTrabajo.materno}"/></td>
	<td><c:out value="${listarEstBecasTrabajo.nombres}"/></td>    
	<td><c:out value="${listarEstBecasTrabajo.modalidad_beca}"/></td>
	<td><c:out value="${listarEstBecasTrabajo.cargo}"/></td>    
	<td><c:out value="${listarEstBecasTrabajo.tipo_turno}"/></td>    
	
	
    </tr>
</c:forEach>
</tabla>
<%@ include file="../../Inferior.jsp" %>
