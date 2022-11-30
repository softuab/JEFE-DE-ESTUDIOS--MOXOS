<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>

<table width="100%">
  <tr>
    <td width="14%" align="center">
      <form name="fvolver" action="<c:url value='/listarMisPendientes.fautapo'/>" method="post">
        <input type="hidden" name="aplicacion" value="/" >
	<input type="hidden" name="accion"     value='Formularito' >
        <div> <a href="javascript:document.fvolver.submit();">
        <IMG SRC="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion"></a></div>
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
<table>
  <tr>
    <td colspan="2" align="center"><font size="4"><b>CONTRASE&Ntilde;A DE INGRESO AL SISTEMA</font></b></td>
  </tr>
</table>
<br>

<table class="tabla" border="0">
  <tr>
    <th>Estudiante</th>
    <td>
      <c:out value="${datoEst.paterno}"/>&nbsp;<c:out value="${datoEst.materno}"/>&nbsp;<c:out value="${datoEst.nombres}"/> 
    </td>
    <th>RU</th>
    <td><c:out value="${datoEst.id_estudiante}"/></td>
    <th>Gesti&oacute;n</th>
    <td><c:out value="${periodo}"/>-<c:out value="${gestion}"/></td>
  </tr>
  <tr>
    <th>Programa</th>
    <td><c:out value="${datoEst.programa}"/>
    <th>Plan</th>
    <td><c:out value="${datoEst.id_plan}"/>
  </tr>
</table>
<br>

<table class="tabla" align="center">
  <tr>
    <td> Usuario </td>
    <td> :: </td>
    <td><c:out value="${datoEst.id_matricula}"/></td>     
  </tr>
  <tr>
    <td> Clave </td>
    <td> :: </td>
    <td><c:out value="${datoEst.clave}"/></td>          
  </tr>
</table>
	
<%@ include file="../../Inferior.jsp" %>