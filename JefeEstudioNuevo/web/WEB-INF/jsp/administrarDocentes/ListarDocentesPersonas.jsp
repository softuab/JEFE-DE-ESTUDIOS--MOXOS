<%@ include file="../Superior.jsp"%>

<div class="titulo">Administrar Docentes</div>
<br>
<table>
  <tr>
    <td>
     <form name="fvolver" action="<c:url value='/administrarDocentes/entrada.fautapo'/>" method="post">
       <input type="hidden" name="dip" value='<c:out value="${dip}"/>'>
       <input type="hidden" name="nombre" value='<c:out value="${nombre}"/>'>
       <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </form>
    </td>
    <td>&nbsp;&nbsp;</td>
    <td>
     <form name="fnuevo" action="<c:url value='/administrarDocentes/buscarDatosDocente.fautapo'/>" method="post">
      <div> <a class="agregar" href="javascript:document.fnuevo.submit();"> Nuevo</a>
        <input type="hidden" name="accion" value="Nuevo">
	<input type="hidden" name="nombre"  value="<c:out value='${nombre}'/>">
        <input type="hidden" name="dip"  value="<c:out value='${dip}'/>">
      </div>
     </form>
  </td>
</tr>
</table>
<table class="tabla">
  <tr>
    <th>Nro.</th>
    <th>R.D.</th>
    <th>PATERNO</th>
    <th>MATERNO</th>
    <th>NOMBRES</th>
    <th>DIP</th>
    <th>CATEGORIA</th>
    <th>MODIFICAR</th>
    <th>ELIMINAR</th>
  </tr>
  <c:forEach var="lista" items="${lDocentes}" varStatus="contador">
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <td><c:out value="${contador.count}"/></td>
      <td><c:out value="${lista.id_docente}"/></td>
      <td><c:out value="${lista.paterno}"/></td>
      <td><c:out value="${lista.materno}"/></td>
      <td><c:out value="${lista.nombres}"/></td>
      <td><c:out value="${lista.dip}"/></td>
      <td><c:out value="${lista.categoria}"/></td>
      <form name=fModificar<c:out value="${contador.count}"/> method="POST" action='buscarDatosDocente.fautapo' >
      <td><a class="modificar" href='javascript: document.fModificar<c:out value="${contador.count}"/>.submit();' >Modificar Datos</a></td>
        <input type="hidden" name="accion" value="Modificar">
        <input type="hidden" name="nombre"  value="<c:out value='${nombre}'/>">
        <input type="hidden" name="dip"  value="<c:out value='${dip}'/>">
        <input type="hidden" name="id_docente" value="<c:out value="${lista.id_docente}"/>">
      </form>
      <form name=fEliminar<c:out value="${contador.count}"/> method="POST" action='buscarDatosDocente.fautapo' >
      <td><a class="eliminar" href='javascript: document.fEliminar<c:out value="${contador.count}"/>.submit();'> Eliminar</a></td>
        <input type="hidden" name="accion" value="Eliminar">
        <input type="hidden" name="id_docente" value="<c:out value="${lista.id_docente}"/>">
        <input type="hidden" name="nombre"  value="<c:out value='${nombre}'/>">
        <input type="hidden" name="dip"  value="<c:out value='${dip}'/>">
      </form>
   </tr> 
    </tr>
  </c:forEach>
  </table>

<%@ include file="../Inferior.jsp" %>