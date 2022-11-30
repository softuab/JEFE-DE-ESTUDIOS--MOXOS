<%@ include file="../../Superior.jsp" %>

<div class="titulo">Imprimir Certificado</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<body onLoad='iniciar()'>

<form name='forma' method="post" action="listarCertificadoNotas.fautapo">

<table class="formulario">
  <tr>
    <th colspan="3">DATOS DOCUMENTO</th>
  </tr>
  <tr>
    <td class="etiqueta">Programa</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${estudiante.programa}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Plan</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${estudiante.id_plan}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Estudiante</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${estudiante.nombres}"/> <c:out value="${estudiante.paterno}"/> <c:out value="${estudiante.materno}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Concepto</td>
    <td class="etiqueta">::</td>
	
	<c:if test="${x=='31'}">
		<td>Historial Academico</td>    
	</c:if>
	<c:if test="${x==27}">
		<td>Certificado de Notas</td>        
		<tr>
      <td class="etiqueta">Gesti&oacute;n <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="gestion" value='<c:out value="${cliente.gestion}" />' onblur="validar(gestion,'9')" size="4" maxlength="4"></td>
    </tr>
    <tr>
      <td class="etiqueta">Periodo <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="periodo" value='<c:out value="${cliente.periodo}" />' onblur="validar(periodo,'9')" size="2" maxlength="1"> </td>
    </tr>
	</c:if>
  </tr>
  <c:if test="${x==27}">
  <tr>
    <td class="etiqueta">Imprimir <font color='red'>(*)</font> </td>
    <td class="etiqueta">::</td>
    <td>
       Curso de Verano<input type="radio" name="todas" value="No" checked> &nbsp; 
       Regular/Mesa de Examen<input type="radio" name="todas" value="Si">
    </td>
  </tr>
  </c:if>
 
 <input type="hidden" name="gestion"              value='<c:out value="${gestion}"/>' >
 <input type="hidden" name="periodo"              value='<c:out value="${periodo}"/>' >
 <input type="hidden" name="id_estudiante"        value='<c:out value="${estudiante.id_estudiante}"/>' >
 <input type="hidden" name="id_programa"          value='<c:out value="${estudiante.id_programa}"/>' >
 <input type="hidden" name="nrocertificado"       value='<c:out value="${nrocertificado}"/>' >
 <input type="hidden" name="todas"                value='<c:out value="${todas}"/>'> 
 <input type="hidden" name="nombres"              value='<c:out value="${estudiante.nombres}"/>'> 
 <input type="hidden" name="paterno"              value='<c:out value="${estudiante.paterno}"/>'>
 <input type="hidden" name="materno"              value='<c:out value="${estudiante.materno}"/>'>
 <input type="hidden" name="plan"                 value='<c:out value="${estudiante.id_plan}"/>'>
 <input type="hidden" name="x"                    value='<c:out value="${x}"/>'>
  
  
</table>
<center>
  <input type='button' value='Siguiente' class="siguiente" onClick='obligar(document.forma, "<c:out value='${obligatorios}'/>")'>
</center>
<c:if test="${cliente.id_facultad > 0}"><input type="hidden" name="id_facultad" value='<c:out value="${cliente.id_facultad}"/>'></c:if>
<c:if test="${cliente.id_programa > 0}"><input type="hidden" name="id_programa" value='<c:out value="${cliente.id_programa}"/>'></c:if>
<c:if test="${cliente.id_departamento > 0}"><input type="hidden" name="id_departamento" value='<c:out value="${cliente.id_departamento}"/>'></c:if>
</form>

</body>
<%@ include file="../../Inferior.jsp" %>