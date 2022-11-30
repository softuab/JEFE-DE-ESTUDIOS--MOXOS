<%@ include file="../../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<body onload='inicio(document.forma.clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />)'>

<div class="titulo">Autorizar Convalidaci&oacute;n Manual</div>
<br>
<form  name=forma action="<c:url value="/autorizarConvalidacionManual/comprobarEntrada.fautapo"/>" method="POST">
  <input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
  <table class="formulario" >
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS </th>
    </tr>
    <tr>
      <td class="etiqueta">Usuario</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${cliente.nombres}"/></td>
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