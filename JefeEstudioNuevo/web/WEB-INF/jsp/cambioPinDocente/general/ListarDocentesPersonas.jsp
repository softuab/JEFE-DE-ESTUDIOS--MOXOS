<%@ include file="../../Superior.jsp"%>

<div class="titulo">Cambio Clave (PIN) Docente - Autoridad</div>
<br>
<table>
  <tr>
    <td>
     <form name="fvolver" action="<c:url value='buscarDocente.fautapo'/>" method="post">
       <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
       <input type="hidden" name="dip" value="<c:out value="${dip}"/>">
       <input type="hidden" name="nombre" value="<c:out value="${nombre}"/>">
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
    <th>CAMBIAR PIN</th>
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
      <form name=fModificar<c:out value="${contador.count}"/> method="POST" action='ingresarNuevoPin.fautapo' >
      <td><a class="modificar" href='javascript: document.fModificar<c:out value="${contador.count}"/>.submit();' >Cambio PIN</a></td>
        <input type="hidden" name="id_docente" value="<c:out value="${lista.id_docente}"/>">
      </form>
    </tr>
  </c:forEach>
  </table>

<%@ include file="../../Inferior.jsp" %>