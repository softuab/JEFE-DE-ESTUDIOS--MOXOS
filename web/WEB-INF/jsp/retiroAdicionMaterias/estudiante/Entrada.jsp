<%@ include file="../../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date"/>
<body onload='inicio(document.forma.clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />)'>

<c:if test="${!empty cliente.id_rol}">
<div class=titulo> Retiro/Adici&oacute;n de materia</div>
<br>

<form name=forma action="<c:url value="/retiroAdicionMateriasEstudiante/listarAccionProgramacionMaterias.fautapo"/>" method="POST">
  <input type="hidden" name="hora" value='<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />' />
  <table class="formulario">
    <tr>
      <th colspan="3" align="center">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Nombres</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${cliente.nombres}"/> </td>
    </tr>
    <tr>
      <td class="etiqueta">Clave(PIN) <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="password" name='clave<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />'></td>
    </tr>
    <tr>
      <td colspan="3" align="center"><input class="siguiente" type="submit"  value="Buscar"></td>
    </tr>
  </table>
</form>
</c:if>

<%@ include file="../../Inferior.jsp" %>

