<%@ include file="../../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<body onload='inicio(document.forma.clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />)'>

<div class="titulo">Imprimir Certificado de Notas</div>
<br>
<form name="forma" action="listarProgramasPlanes.fautapo" method="POST">
  <input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
  <table class="formulario" >
    <tr>
      <th colspan="3">INTRODUZCA EL PERIODO ACÁDEMICO </th>
    </tr>
    <tr>
      <td class="etiqueta">Usuario</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${cliente.nombres}"/></td>
    </tr>    
	<tr>	
	
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
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS </th>
    </tr>

	<td class="etiqueta">Nro. Certificado <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="nrocertificado" size="10" maxlength="10"></td>	
	</tr>

	<td class="etiqueta">Nivel <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="nivel" size="10" maxlength="10"></td>	
	</tr>

	<tr>
      <td class="etiqueta">Observacion </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="observacion" size="30" maxlength="120"> </td>
    </tr>
    <tr>
      <th colspan="3">INGRESE SU CONTRASEÑA</th>
    </tr>
	
    <tr>
      <td class="etiqueta">Clave <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <input type="password" name='clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />'>
      </td>
    </tr>
    <tr>
      <td colspan="3" align="center">
        <input class="siguiente" type="submit" value="Buscar" class="buscar">
      </td>
    </tr>
  </table> 
</form>

<%@ include file="../../Inferior.jsp" %>