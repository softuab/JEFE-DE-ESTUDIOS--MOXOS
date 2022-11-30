<%@ include file="../../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<div class="titulo">Reimprimir Certificados</div>
<br>
<form name="forma" action="listarConceptosImpresion.fautapo" method="post" >
  <input type="hidden" name="hora" value="<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss"/>">

<table class="formulario" >
  <tr>
    <th colspan=3 align="center">INTRODUZCA LOS DATOS</th>
  </tr>
  <tr>
    <td class="etiqueta">Usuario</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${usuario}" /></td>
  </tr>
  <tr>
    <td class="etiqueta">Nro. de Certificado <font color='red'>(*)</font></td>
    <td class="etiqueta">::</td>
    <td><input type="text" name="nro_certificado"></td>
  </tr>
   <tr>
    <td class="etiqueta">Tipo Certificado </td>
    <td class="etiqueta">::</td>
	<td>
       <select name="tipo_cert">
	   <option value="27">Certificado de Notas</option>
       <option value="31">Historial Academico</option>    
       </select> 
	 </td>
  </tr>
   <tr>
    <td class="etiqueta">Sede</td>
    <td class="etiqueta">::</td>
	<c:if test="${Rol == 'Admin Tramites Academicos'}">
	<td>
       <select name="sede">
	   <option value="1">CENTRAL-TRINIDAD</option>
       <option value="8">RIBERALTA</option>    
  	   <option value="4">GUAYARAMERIN</option>
       </select> 
	 </td>
    </c:if>
	<c:if test="${Rol == 'Apoyo Tramites Academicos'}">
		<c:if test="${idSede == '1'}">
			<td>
			<select name="sede">
	   <option value="1">CENTRAL-TRINIDAD</option>
       </select> 
			</td>
		</c:if>
		<c:if test="${idSede == '4'}">
			<td>
			<select name="sede">  
  	   <option value="4">GUAYARAMERIN</option>
       </select> 
			</td>
		</c:if>
		<c:if test="${idSede == '8'}">
			<td>
			<select name="sede">
       <option value="8">RIBERALTA</option>    
       </select> 
			</td>
		</c:if>
	</c:if>
  </tr>
  
  <tr>
    <td class="etiqueta">Clave <font color='red'>(*)</font></td>
    <td class="etiqueta">::</td>
    <td><input type="password" name="clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss"/>"></td>
  </tr>
  <tr>
	<td align="center" colspan="3">
       <input class="aceptar" type="submit" value="Buscar">
    </td>
    <!--<td colspan="3" align="center"><input type="submit" value="Buscar" class="siguiente"></td>-->
  </tr>
</table>
</form>

<%@ include file="../../Inferior.jsp" %>