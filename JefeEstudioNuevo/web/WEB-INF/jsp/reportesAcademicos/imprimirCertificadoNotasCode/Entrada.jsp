<%@ include file="../../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<body onload='inicio(document.forma.clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />)'>

<div class="titulo">Imprimir Certificado</div>
<br>
<form name="forma" action="entrada.fautapo" method="POST">
  <input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
  <table class="formulario" >
    <tr>
      <th colspan="3">INTRODUZCA EL PERIODO ACÁDEMICO </th>
    </tr>
      <tr>
    <td class="etiqueta">Usuario</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${usuario}" /></td>
  </tr> 
	<tr>	
	<td class="etiqueta">Nro. Recibo <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="nrocertificado" size="10" maxlength="10"></td>	
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
        <input class="siguiente" type="submit" value="Siguiente"  >
      </td>
    </tr>
  </table> 
</form>

<%@ include file="../../Inferior.jsp" %>