<%@ include file="../Superior.jsp" %>

<table width="100%" cellpadding="0" cellspacing="0">
<tr bgColor="#4A75BD">
  <td align="center" colspan="5">
    <img src="imagenes/iconosLogin/banner.jpg"></img>
  </td>
</tr>
<tr class="colh">
  <td>
    <c:out value="${cliente.nombres}"/> [<c:out value="${cliente.rol}"/>] [<c:out value="${cliente.almacen}"/>]
  </td>
  <td align="right">
    <form name="forma" action='<c:url value="/CambiarRol.fautapo"/>' method="post">
      <c:if test="${fn:length(cliente.roles) > 1}">
        Rol actual&nbsp;::&nbsp;
        <select name="id_rol" class='comboRoles' onChange='javascript: document.forma.submit();'>
          <c:forEach var="roles" items="${cliente.roles}">
            <option value='<c:out value="${roles.id_rol}"/>' <c:if test="${cliente.id_rol == roles.id_rol}">selected</c:if> >
              <c:out value="${roles.rol}"/>
          </c:forEach>
        </select>
      </c:if>
      <input type="hidden" name="encabezado" value="si">
    </form>
  </td>
  
  <td align="right">
    <form name="forma1" action='<c:url value="/cambiarAlmacen.fautapo"/>' method="post">
      <c:if test="${fn:length(cliente.almacenes) > 1}">
        Almac&eacute;n actual&nbsp;::&nbsp;
        <select name="id_almacen" class='comboAlmacenes' onChange='javascript: document.forma1.submit();'>
          <c:forEach var="almacenes" items="${cliente.almacenes}">
            <option value='<c:out value="${almacenes.id_almacen}"/>' <c:if test="${cliente.id_almacen == almacenes.id_almacen}">selected</c:if> >
              <c:out value="${almacenes.almacen}"/>
          </c:forEach>
        </select>
      </c:if>
    </form>
  </td>
  <td width="10%">
  &nbsp;
  </td>
  <td align="right"<c:if test="${!empty cliente.rol}"> bgColor="#FFE1E1"</c:if> width="90">
    <c:if test="${!empty cliente.rol}">
      <a href='<c:url value="/logout.fautapo" />' target="_top" class="desconectar" width="89">
          Cerrar Sesi&oacute;n
      </a>
    </c:if>
  </td>
</tr>
</table>

<%@ include file="../Inferior.jsp" %>