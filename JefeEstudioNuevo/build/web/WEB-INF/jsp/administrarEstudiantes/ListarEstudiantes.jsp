<%@ include file="../Superior.jsp"%>
<div class="titulo">Administrar Datos Estudiantes-Personas</div>
<br>
<table>
  <tr>
    <td>
     <form name="fvolver" action="<c:url value='/est_personas/entrada.fautapo'/>" method="post">
       <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
     </form>
    </td>
  </tr>
</table>

<div class="centro">
  <table class="tabla">
    <tr>
      <th colspan="9">RESULTADO DE LA BUSQUEDA</th>
    </tr>
    <tr>
      <th>Nro.</th>
      <th> R.U.</th>
      <th>Nombres</th>
      <th>Dip</th>
      <th>Programa</th>
      <th>Tipo Admisi&oacute;n</th>
      <th>Tipo estudiante</th>
      <th>Fecha Inscripci&oacute;n</th>
      <th>Situaci&oacute;n</th>
      <th>MODIFICAR</th>
    </tr>
  <c:forEach var="lista" items="${lEstPersonas}" varStatus="contador">
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <td> <c:out value="${contador.count}"/></td>
      <td> <c:out value="${lista.id_estudiante}"/></td> 
      <td><c:out value="${lista.paterno}"/>&nbsp;<c:out value="${lista.materno}"/>&nbsp;<c:out value="${lista.nombres}"/></td>
      <td><c:out value="${lista.dip}"/></td>
      <td><c:out value="${lista.programa}"/></td>
      <td><c:out value="${lista.tipo_admision}"/></td>
      <td><c:out value="${lista.tipo_estudiante}"/></td>
      <td><fmt:formatDate value="${lista.fec_inscripcion}" pattern="${formatoFecha}"/></td>
      <td>
        <c:if test="${lista.id_estado == 'A'}"><font color="red"> Activo </font> </c:if>
	<c:if test="${lista.id_estado == 'B'}"> <font color="red"> Bloqueado </font></c:if>
      </td>
      <td>
        <form name="fmodificar<c:out value='${contador.count}'/>_<c:out value='${contadorA.count}'/>" action="<c:url value='/est_personas/listarEstudiantes.fautapo'/>" method="post">
          <input type="hidden" name="id_persona" value="<c:out value='${lista.id_persona}'/>">
	  <input type="hidden" name="id_estudiante" value="<c:out value='${lista.id_estudiante}'/>">
          <div><a class="modificar" href="javascript:document.fmodificar<c:out value='${contador.count}'/>_<c:out value='${contadorA.count}'/>.submit();"> Modificar</a> </div>
        </form>
      </td>
    </tr>
  </c:forEach>
  </table>
</div>

<%@ include file="../Inferior.jsp" %>