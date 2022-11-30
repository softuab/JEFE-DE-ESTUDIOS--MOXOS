<%@ include file="../../../SuperiorCajas.jsp" %>
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
    <td colspan="2" align="center"><font size="4"><b>CAMBIO DE PROGRAMA</font></b></td>
  </tr>
</table>
<hr>

<br>
<table border="0">
  <tr>
    <th>Postulante</th>
    <td>
      <c:out value="${postulante.nombres}"/> <c:out value="${postulante.paterno}"/> <c:out value="${postulante.materno}"/>
    </td>
    <th>R.P.</th>
    <td>
      <c:out value="${postulante.id_postulante}"/>
    </td>
  </tr>
</table>
<br><br><br><br>
<table class="tabla">
  <tr>
    <th colspan="2">Nuevo Registro</th>
  </tr>
  <tr>
    <th>Anterior Programa</th>
    <td><c:out value="${programa_ant.programa}"/></td>
  </tr>
  <tr>
    <th>Programa Nuevo</th>
    <td><c:out value="${programa}"/></td>
  </tr>
</table>

<br><br><br><br><br><br>
<table border="0" width="100%">
  <tr>
    <td width="50%">
      <c:out value="${usuario}"/>
      <br>...............................................
      <br><b>Usuario</b>
    </td>
    <td width="50%" align="bottom" align="right">
      <a href='javascript: window.print()'>
        <fmt:formatDate value="${now}" pattern="${formatoFecha} ${formatoHora}"/>
      </a>
    </td>
  </tr>
</table>

<%@ include file="../../../Inferior.jsp" %>