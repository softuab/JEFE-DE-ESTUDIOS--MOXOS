<%@ include file="../../Superior.jsp"%>
<body>
    
</body>
<div class="titulo">Registrar Nueva Persona Docente</div>
<br>
<table>
  <tr>
    <td>
     <form name="fvolver" action="<c:url value='/docentes/entradaBuscarDocente.fautapo'/>" method="post">
      <input type="hidden" name="id_tramite" value='<c:out value="${id_tramite}"/>'>
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </form>
    </td>
    <td>
     <form name="fnuevo" action="<c:url value='/especializadoDibRap/nuevoRegistro.fautapo'/>" method="post">
       <input type="hidden" name="id_tramite"  value='<c:out value="${id_tramite}"/>'>
       <input type="hidden" name="id_proceso"  value='<c:out value="${id_proceso}"/>'>
       <input type="hidden" name="tabla" value='personas'>
      
      <div> <a class="agregar" href="javascript:document.fnuevo.submit();"> Nuevo</a> </div>
     </form>
  </td>
</tr>
</table>
<form>
<div class="centro">
  <table class="tabla">
  <tr>
    <th colspan="5">INFORMACION ENCONTRADA</th>
  </tr>
  <tr>
    <th>PATERNO</th>
    <th>MATERNO</th>
    <th>NOMBRES</th>
    <th>DIP</th>
  </tr>
  <c:forEach var="lista" items="${lDocentes}" varStatus="contador">
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <td><c:out value="${lista.paterno}"/></td>
      <td><c:out value="${lista.materno}"/></td>
      <td><c:out value="${lista.nombres}"/></td>
      <td><c:out value="${lista.dip}"/></td>
    </tr>
  </c:forEach>
  </table>
</div>
</form>

<%@ include file="../../Inferior.jsp" %>