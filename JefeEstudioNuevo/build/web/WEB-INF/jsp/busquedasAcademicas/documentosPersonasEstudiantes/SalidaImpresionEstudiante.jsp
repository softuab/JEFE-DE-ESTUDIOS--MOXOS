<%@ include file="../../Superior.jsp"%>
<jsp:useBean id="now" class="java.util.Date"/>

<table width="100%">
  <tr>
    <td width="14%" align="center">
      <form name="fvolver" action="<c:url value='/documentos/buscarEstudianteEntrada.fautapo'/>" method="post">
        <input type="hidden" name="aplicacion" value="/" >
	<input type="hidden" name="accion"     value='Formularito'>
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
    <td colspan="2" align="center"><font size="4"><b>ACTUALIZACION DE DOCUMENTACION</font></b></td>
  </tr>
</table>
<hr>

<br>
<center>
<table  border="0">
  <tr>
    <th>Nombres :</th>
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
    <th>Plan ::</th>
    <td><c:out value="${datosEst.id_plan}"/>
    </td>
  </tr>
  <tr>
    <th>Clasificaci&oacute;n </th>
    <td><c:out value="${datosClas.tipo_clasificacion}"/>
    </td>
  </tr>
  <tr>
    <th>Tipo Estudiante ::</th>
    <td><c:out value="${datosEst.tipo_estudiante}"/>
    </td>
  </tr>
  <tr>
    <th>Tipo Grado ::</th>
    <td><c:out value="${datosEst.tipo_grado}"/>
  </td>
  </tr>
  <tr>
    <th colspan="3"> DOCUMENTOS PRESENTADOS </th>
  </tr>  
  <tr>
    <td colspan="3" align="center">
	<table  witdh="50%" border="1">
	   <tr>
	     <th aling="center">? </th>
	     <th align="center">TIPO DOCUMENTO </th>
	     <th align="center">PRESENT&Oacute; </th>
	     <th align="center">OBSERVACION </th>
	   </tr>
	   <c:forEach var="lDocumento" items="${lPrsDocumentosTodo}" varStatus="contadorClas">
	     <tr <c:if test="${(contadorClas.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
	       <td> <c:out value='${contadorClas.count}'/></td> 
	       <td> 
	          <c:out value='${lDocumento.tipo_documento}'/>
	       </td> 
	       <td>
	         <c:if test="${lDocumento.presento == true}"> Si</c:if> &nbsp;
		 <c:if test="${lDocumento.presento == false}"> No</c:if> 
	       </td>
	       <td> <c:out value='${lDocumento.observacion}'/> </td>
	      </tr>
	    </c:forEach>
          </table>
      </td>
  </tr>
  <tr>
    <td colspan="4">
    </td>
  </tr>  
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