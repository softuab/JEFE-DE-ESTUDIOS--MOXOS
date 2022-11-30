<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>

<table border="0" cellspacing='0' cellpadding='0' align='center' width="969" height="590">
<tbody background='<c:url value="/"/>imagenes/carnetUniversitario/fondo.jpg'>
  <tr>
    <td colspan="2"><br><br><br><br><br><br><br><br><br><br><br></td>
  </tr>
  <tr>
    <td width='30%' valign="top">
      <table align="center" width="100%">
        <c:forEach var="listaFoto" items="${lImagenes}" varStatus="contador"> 
        <tr>
           <td align="center"> 
             <img  src='<c:url value="/"/>adjuntosMi/fotosEstudiantes/<c:out value="${listaFoto.adjunto}"/>' width="255" height="290" border="1"/>
           </td>
        </tr>
        </c:forEach>
      </table>
    </td>
    <td width='70%' valign="top">
      <table width="100%">
        <tr>
	  <td width="20%" valign="top"><b><font size="6">Nombre:</font></b>
	  <td width="80%"><font size="6"><b><c:out value="${datoEst.paterno}"/>&nbsp;<c:out value="${datoEst.materno}"/>&nbsp;<c:out value="${datoEst.nombres}"/> </font></td>
	</tr>
	<tr>
	  <td width="20%"><b><font size="6">C.I.:</font></b>
	  <td width="80%"><font size="6"><b><c:out value="${datoEst.dip}"/></font> </td>
	</tr>
	<tr>
	  <td width="20%"><b><font size="6">Reg. Univ.:</font></b></td>
	  <td width="80%"><font size="6"><b><c:out value="${datoEst.id_estudiante}"/></font></td>
	</tr>
	<tr>
          <td width="20%" valign="top"><b><font size="6">Programa(s):</font></b></td>
          <td width="80%"><font size="6"> 
            <c:forEach var="lista" items="${lProgramas}"> 
              <b><c:out value="${lista.programa}"/><br>
            </c:forEach>
          </font></td>
	</tr>
	<tr>
          <td width="20%"><b><font size="6">Categor&iacute;a:</font></b></td>
          <td width="80%"><small><font size="6"><b><c:out value="${datosClasificacion.tipo_clasificacion}"/></font></small></td>
	</tr>
	<tr>
          <td width="20%"><b><font size="6">Tipo:</font></b></td>
          <td width="80%"><font size="6"><b><c:out value="${datoEst.tipo_estudiante}"/></td>
	</tr>   
	<tr>
	  <td colspan="2"><font size="5"><b><c:out value="${datoEst.facultad}"/></font></td>
	</tr>
        <tr>
          <td colspan=2 align=center>
            <b><font size="5">Trinidad, &nbsp;</b><b><fmt:formatDate value="${now}" pattern="dd"/> de <fmt:formatDate value="${now}" pattern="MMMM"/>  del <fmt:formatDate value="${now}" pattern="yyyy"/>
          </td>
        </tr>
      </table>
    </td>
  </tr>		
  </tbody>
</table>
<%@ include file="../../Inferior.jsp" %>