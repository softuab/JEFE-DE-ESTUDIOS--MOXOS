<%@ include file="../Superior.jsp"%>

<jsp:useBean id="now" class="java.util.Date"/>
<body onload='inicio(document.forma.clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />)'>

<div class="titulo">Administrar Lbr Tipos Notas</div>
<br>

<c:if test="${!empty cliente.id_rol}">
<form name=forma action="<c:url value="/administrarTiposNotas/verificarEntrada.fautapo"/>" method="POST">
<input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
<table class="formulario">
  <tr>
    <th colspan="3">INTRODUZCA LOS DATOS </th>
  </tr>
  <tr>
    <td class="etiqueta">Usuario</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${cliente.nombres}" /></td>
  </tr> 
  <tr>
    <td class="etiqueta">Gesti&oacute;n</td>
    <td class="etiqueta">::</td>
    <td>
      <input type="text" name="gestion" size="4"  value="<c:out value="${cliente.gestion}" />" >
    </td>
  </tr> 
 <tr>
    <td class="etiqueta">Periodo</td>
    <td class="etiqueta">::</td>
    <td><input type="text" name="periodo" size="1"   value='<c:out value="${cliente.periodo}" />' >
    </td>
  </tr>  
  <tr>
    <td class="etiqueta">Clave</td>
    <td class="etiqueta">::</td>
    <td> <input type="password" name='clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />'> </td>
  </tr>
  <tr>
    <td colspan=3 align=center><input class="siguiente" type="submit" value="Buscar"></td>
  </tr>
</table>
</form>
</c:if>

<%@ include file="../Inferior.jsp" %>