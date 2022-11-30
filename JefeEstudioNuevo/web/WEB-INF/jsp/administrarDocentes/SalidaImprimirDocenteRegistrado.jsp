<%@ include file="../Superior.jsp"%>
<jsp:useBean id="now" class="java.util.Date"/>

<table width="100%">
  <tr>
    <td width="14%" align="center">
      <form name="fvolver" action="<c:url value='/administrarDocentes/entrada.fautapo'/>" method="post">
        <div> <a href="javascript:document.fvolver.submit();">
	<imput type="hidden" name="dip" value="<c:out value="${dip}"/>">
	<imput type="hidden" name="nombre" value="<c:out value="${nombre_docente}"/>">
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
<table width="100%">
  <tr>
    <td align="center"><font size="4"><b>REGISTRO DOCENTE</font></b></td>
  </tr>
</table>
<hr>

<br>
<center>
<table border="0">
  <tr>
    <th>Docente :</th>
    <td>
      <c:out value="${nombre_docente}"/> <c:out value="${paterno_docente}"/> <c:out value="${materno_docente}"/>
    </td>
  </tr>
  <tr>
    <th colspan="3">Acceso al sistema</th>
  </tr>  
  <tr>
    <th>Apodo de Acceso:</th>
    <td>
      <c:out value="${apodo}"/>
    </td>
  </tr>  
  <tr>
    <th>Clave de Acceso :</th>
    <td>
      <c:out value="${clave}"/>
    </td>
  </tr>
  <tr>
    <td colspan="2">
    <hr>
    </td>
  </tr>  
  <tr>
    <td colspan="2">
    <hr>
    </td>
  </tr>  
  <tr> <td colspan="2"> </td> </tr>   
  <tr> <td colspan="2"> </td> </tr>   
  <tr> <td colspan="2" align="center">_________________ </td> </tr>   
  <tr> <td colspan="2" align="center"> FIRMA DOCENTE </td> </tr>   
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

<%@ include file="../Inferior.jsp"%>