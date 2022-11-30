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
          <form name="fvolver" action="<c:url value='/listarMisPendientes.fautapo'/>" method="post">
            <input type="hidden" name="aplicacion" value="/" >
  	    <input type="hidden" name="accion"     value='Formularito' >
            <div> <a href="javascript:document.fvolver.submit();">
            <img src="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion"></a></div>
          </form>
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
    </td>
  </tr>
  </thead>
  <!-- HASTA AQUI SE REPITE-->    
  <tr>
   <td>
    <table width="100%" align="center">
      <tr>
        <td align="center"><label><h1>CERTIFICADO DE TRABAJO</h1></label></td>
      </tr>
    </table>
    <table width="97%">
      <tr>
        <td>El Vice Rector  de la <c:out value='${datosInstitucion.institucion}'/> <b>CERTIFICA </b> que revisando los archivos el Vicerrectorado, el Ingeniero  </td>
      </tr>
      <tr>
        <td align="center"><h1><c:out value="${datosDocente.nombres}"/>&nbsp;
          <c:out value="${datosDocente.paterno}"/> &nbsp;
          <c:out value="${datosDocente.materno}"/></h1>
        </td>
      </tr>
     <tr>
        <td>Con C.I. <c:out value="${datosDocente.dip}"/>,&nbsp;ha desempe&ntilde;ado funciones en esta Superior Casa e Estudios al siguiente detalle: </td>
      </tr> 
    </table>
    <br>
    </td>
  </tr>
  <tr>
    <td align="center">
    <table class="tabla">
      <tr>
        <th>NRO.</th>
        <th>ASIGNATURA</th>
	<th>HRS.</th>
        <th>TIPO EVALUACION </th>
        <th>FECHA INICIO</th>
        <th>FECHA TERMINO</th>
      </tr>
      <c:forEach var="lista" items="${lAsignacionDocente}" varStatus="contador">
      <tr>
        <td><c:out value="${contador.count}"/></td>
        <td><c:out value="${lista.sigla}"/> - <c:out value="${lista.materia}"/> </td>
	<td><c:out value="${lista.total_horas}"/></td>
        <td><c:out value="${lista.tipo_evaluacion}"/></td>
        <td><fmt:formatDate value="${lista.fec_inicio2}" pattern="${formatoFecha}"/></td>
        <td><fmt:formatDate value="${lista.fec_fin2}" pattern="${formatoFecha}"/></td>
      </tr>
      </c:forEach>
    </table>
    </td>
  </tr>
  <tr>
    <td>Ejeciendo sus funciones con idoneidad y responsabilidad. </td>
  </tr>
  <tr>
    <td>Es cuanto certifica, en honor a la verdad, para fines que convengan al interesado.</td>
  </tr> 
 <tr>
   <td align="rigth">
      <c:out value='${datosInstitucion.localidad}'/>,&nbsp;<fmt:formatDate value="${now}" pattern="dd"/> de <fmt:formatDate value="${now}" pattern="MMMM"/>  de <fmt:formatDate value="${now}" pattern="yyyy"/>
    </td>
  </tr> 
</table>
<%@ include file="../../Inferior.jsp" %>