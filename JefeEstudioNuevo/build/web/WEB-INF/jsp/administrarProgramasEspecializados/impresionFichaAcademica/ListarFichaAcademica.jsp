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
    <table width="100%" align="center">
      <tr>
        <td align="center"><label><h2>HISTORIAL ACADEMICO</h2></label></td>
      </tr>
    </table>
    <table width="97%">
      <tr>
        <th align="right">RU::</th>
        <td><c:out value="${datosEstudiante.id_estudiante}"/></td>
        <th align="right">ESTUDIANTE::</th>
        <td>
          <c:out value="${datosEstudiante.nombres}"/> &nbsp; 
          <c:out value="${datosEstudiante.paterno}"/> &nbsp;
          <c:out value="${datosEstudiante.materno}"/>
        </td>
      </tr>
      <tr>
        <th align="right">PROGRAMA::</th>
        <td><c:out value="${datosEstudiante.programa}"/>
        <th align="right">PLAN::</th>
        <td><c:out value="${datosEstudiante.id_plan}"/>
      </tr>
    </table>
    <br>
    </td>
  </tr>
  </thead>
  <!-- HASTA AQUI SE REPITE-->
  <tr>
    <td align="center">
    <table class="tabla">
      <tr>
        <th>NRO.</th>
        <th>GESTION</th>
        <th>PLAN</th>
        <th>NIVEL</th>
        <th>SIGLA</th>
        <th>MATERIA</th>
        <th>NOTA</th>
        <th>OBSERVACION</th>
        <th>Nro. RESOLUCION</th>
      </tr>
      <c:forEach var="lista" items="${lFichaAcademica}" varStatus="contador">
      <tr>
        <td><c:out value="${contador.count}"/></td>
        <td><c:out value="${lista.periodo}"/>-<c:out value="${lista.gestion}"/></td>
        <td><c:out value="${lista.id_plan}"/></td>
        <td><c:out value="${lista.nivel_academico}"/></td>
        <td><c:out value="${lista.sigla}"/></td>
        <td><c:out value="${lista.materia}"/></td>
        <td><c:out value="${lista.nota}"/></td>
        <td><c:out value="${lista.observacion}"/></td>
        <td><c:out value="${lista.nro_resolucion}"/></td>
      </tr>
      </c:forEach>
    </table>
    </td>
  </tr>
</table>
<%@ include file="../../Inferior.jsp" %>