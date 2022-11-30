<%@ include file="../../Superior.jsp"%>
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
<table align="center">
  <tr>
    <td><font size="4"><b>MATRICULACION ESTUDIANTE NUEVO</font></b></td>
  </tr>
</table>
<hr>

<br>
<center>
<table border="0">
  <tr>
    <th>Estudiante :</th>
    <td>
      <c:out value="${datosEst.nombres}"/> <c:out value="${datosEst.paterno}"/> <c:out value="${datosEst.materno}"/>
    </td>
    <th>R.U. :</th>
    <td>
      <c:out value="${datosEst.id_estudiante}"/>
    </td>
  </tr>
  <tr>
    <th>Area :</th>
    <td colspan="3">
      <c:out value="${datosEst.facultad}"/>
    </td>
  </tr> 
  <tr>
    <th>Programa :</th>
    <td colspan="3">
      <c:out value="${datosEst.programa}"/>
    </td>
  </tr>  
  <tr>
    <td colspan="4">
      Estudiante habilitado para matricularse en la:
      <b>Gesti&oacute;n :</b> <c:out value="${gestion_matricula}"/> y <b>Periodo:</b> <c:out value="${periodo_matricula}"/>
    </td>
  </tr>  
  <tr>
    <td colspan="4">
      <b>Pr&oacute;rroga :</b> <c:if test="${prorroga == true }">SI </c:if> <c:if test="${prorroga == false }">NO </c:if>
    </td>
  </tr>  
  <tr>
    <td colspan="4">
    <hr>
    </td>
  </tr>  
  <tr>
    <td colspan="4">
    <hr>
    </td>
  </tr>  
  <tr> <td colspan="4"> </td> </tr>   
  <tr> <td colspan="4"> </td> </tr>   
  <tr> <td colspan="4" align="center">_________________ </td> </tr>   
  <tr> <td colspan="4" align="center"> FIRMA DTR </td> </tr>   
</table>
</center>
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

<%@ include file="../../Inferior.jsp"%>