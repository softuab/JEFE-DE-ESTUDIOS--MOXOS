<%@ include file="../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<table width="100%">
  <tr>
    <td width="14%" align="center">
      <form name="fvolver" action="<c:url value='/est_personas/entrada.fautapo'/>" method="post">
        <input type="hidden" name="aplicacion" value="/" >
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
<br>
<center>
<h2>REGISTRO DE ESTUDIANTE</h2>
<table witdh="100%" >
  <tr>
    <td>
      <table>
        <tr>
	  <td colspan="2" align="center"><h3>DATOS PERSONA </h3></td>
	</tr>
	<tr>
	  <td align="right"><b>Nro. DIP ::</b></td>
	  <td><c:out value="${datosEst.dip}"/></td>
	</tr>
        <tr>
	  <td  align="right"><b>Nombres ::</b></td>
	  <td><c:out value="${datosEst.paterno}"/>&nbsp;<c:out value="${datosEst.materno}"/>&nbsp;<c:out value="${datosEst.nombres}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Sexo ::</b></td>
	  <td><c:out value="${datosEst.tipo_sexo}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Fecha de Nacimiento ::</b></td>
	  <td><fmt:formatDate value="${datosEst.fec_nacimiento2}" pattern="dd/MM/yyyy"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Pa&iacute;s de Nac. ::</b></td>
	  <td><c:out value="${datosEst.pais}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Departamento de Nac. ::</b></td>
	  <td><c:out value="${datosEst.departamento}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Provincia de Nac. ::</b></td>
	  <td><c:out value="${datosEst.provincia}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Localidad de Nac. ::</b></td>
	  <td><c:out value="${datosEst.localidad}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Direcci&oacute;n ::</b></td>
	  <td><c:out value="${datosEst.direccion}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Tel&eacute;fono ::</b></td>
	  <td><c:out value="${datosEst.telefono}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Celular ::</b></td>
	  <td><c:out value="${datosEst.celular}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Correo ::</b></td>
	  <td><c:out value="${datosEst.correo}"/></td>
	</tr>
      </table>
    </td>
    <td valign="top">
      <table>
        <tr>
	  <td colspan="2" align="center"><h3>DATOS BACHILLERATO</h3></td>
	</tr>
	<tr>
	  <td align="right"><b>Colegio::</b></td>
	  <td><c:out value="${datosColegio.colegio}"/></td>
	</tr>
        <tr>
	  <td align="right"><b>Turno ::</b></td>
	  <td><c:out value="${datosColegio.tipo_turno}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Tipo Instituci&oacute;n ::</b></td>
	  <td><c:out value="${datosColegio.tipo_institucion}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Pa&iacute;s de Egreso ::</b></td>
	  <td><c:out value="${datosColegio.pais}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Departamento de Egreso ::</b></td>
	  <td><c:out value="${datosColegio.departamento}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Provincia de Egreso ::</b></td>
	  <td><c:out value="${datosColegio.provincia}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Localidad de Egreso ::</b></td>
	  <td><c:out value="${datosColegio.localidad}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>A&ntilde;o de Egreso ::</b></td>
	  <td><c:out value="${datosColegio.anio_egreso}"/></td>
	</tr>
      </table> 
    </td>
  </tr>
   <tr>
    <td align="center" colspan="2">
      <table>
        <tr>
	  <td align="center" colspan="2"><h3> DATOS DE ESTUDIANTE </h3>
	  </td>
	</tr>
	<tr>
	  <td align="right"><b>Programa ::</b></td>
	  <td><c:out value="${datosEst.programa}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Tipo Clasificaci&oacute;n ::</b></td>
	  <td><c:out value="${datosEst.tipo_clasificacion}"/></td>
	</tr>
	<tr>
	  <td align="right"><b>Tipo Admisi&oacute;n ::</b></td>
	  <td><c:out value="${datosEst.tipo_admision}"/></td>
	</tr>
      </table>
    </td>
  </tr>
  <tr><td align="center" colspan="2"><br></td>
  </tr>
  <tr><td align="center" colspan="2"><br></td>
  </tr>
  <tr><td align="center" colspan="2"><br></td>
  </tr>
  <tr><td align="center" colspan="2"><br></td>
  </tr>
  <tr><td align="center" colspan="2"><br></td>
  </tr>
  <tr><td align="center" colspan="2"><br></td>
  </tr>
  <tr>
    <td align="center" colspan="2">
      <table>
        <tr>
	  <td witdh="100%" align="center">______________________________
	  </td>
	</tr>
        <tr>
	  <td align="center"> FIRMA
	  </td>
	</tr>
	<tr>
	  <td align="center"> 
	    <a href='javascript: window.print()'>
	      <c:out value="${datosEst.paterno}"/>&nbsp;<c:out value="${datosEst.materno}"/>&nbsp;<c:out value="${datosEst.nombres}"/>
	    </a>
	  </td>
	</tr>
      </table>
    </td>
  </tr>
 </table>
 <table width="80%"> 
   <tr>
     <td width="40%">Usuario :<c:out value="${datosEst.nombre_usuario}"/> </td>
     <td width="40%" align="right">Fec. registro : <fmt:formatDate value="${datosEst.fec_registro}" pattern="${formatoFecha} ${formatoHora}"/></td>
   </tr>
</table>
</center>

<%@ include file="../Inferior.jsp" %>