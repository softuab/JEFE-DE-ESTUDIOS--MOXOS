<%@ include file="../../Superior.jsp"%>
<c:if test="${empty titulo}">
<div class="titulo">Registrar Nuevo Postulantes</div>
</c:if>
<c:if test="${!empty titulo}">
<div class="titulo"><c:out value="${titulo}"/></div>
</c:if>

<br>
<table>
  <tr>
    <td>
     <form name="fvolver" action="<c:url value='/postulantespos/entrada.fautapo'/>" method="post">
      <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
      <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
      <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </form>
    </td>
    <td>
     <form name="fnuevo" action="<c:url value='/postulantespos/nuevoPostulante.fautapo'/>" method="post">
      <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
      <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
      <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
      <div> <a class="agregar" href="javascript:document.fnuevo.submit();"> Nuevo</a> </div>
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
      <th align="left"> C.I. - 
      1er. Apellido&nbsp;
      2do. Apellido&nbsp;
      Nombres
      <th></th>
    </tr>
  <c:forEach var="lista" items="${lPstPersonas}" varStatus="contador">
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <td class="etiqueta"> <c:out value="${contador.count}"/></td>
      <td class="etiqueta2"> <c:out value="${lista.dip}"/> - 
      <c:out value="${lista.paterno}"/>&nbsp;
      <c:out value="${lista.materno}"/>&nbsp;
      <c:out value="${lista.nombres}"/>
      <td class="etiqueta">
        <form name="fregistra<c:out value='${contador.count}'/>" action="<c:url value='/postulantespos/nuevoPrsPostulante.fautapo'/>" method="post">
          <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
          <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
          <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">
          <input type="hidden" name="id_persona" value="<c:out value='${lista.id_persona}'/>">
          <div> <a class="agregar" href="javascript:document.fregistra<c:out value='${contador.count}'/>.submit();"> Registrar</a> </div>
        </form>
      </td>
    </tr>
    <c:if test="${!empty lista.postulantes }">
    <tr>
      <td></td>
      <td>
        <table class="tabla" width="100%">
          <tr>
            <th>Programa</th>
            <th>Tipo Admisi&oacute;n</th>
            <th>Gesti&oacute;n</th>
            <th>Periodo</th>
            <th>Situaci&oacute;n</th>
	  <tr>  
	  <c:forEach var="lPst" items="${lista.postulantes}" varStatus="contadorA">
	  <tr>
            <td><c:out value="${lPst.programa}"/></td>
            <td><c:out value="${lPst.tipo_admision}"/></td>
            <td><c:out value="${lPst.gestion}"/></td>
            <td><c:out value="${lPst.periodo}"/></td>
            <td>
              <c:if test="${lPst.id_estado != 'X'}"> 
                <c:if test="${lPst.id_estado == 'P'}"><font color="red"> Postulante </font> </c:if>
				<c:if test="${lPst.id_estado == 'R'}"><font color="blue"> Registrado </font> </c:if>
				<c:if test="${lPst.id_estado == 'B'}"><font color="black"> Bloqueado </font> </c:if>
	            <c:if test="${lPst.id_estado == 'A'}"> <font color="red"> Habilitado </font></c:if>
	            <c:if test="${lPst.id_estado == 'E'}"> <font color="red">Inscrito Estudiante </font> </c:if>
              </c:if>
            </td>
          </tr>
	  </c:forEach>
        </table>	
      </td>
      <td></td>
    </tr>
    </c:if>
  </c:forEach>
  </table>
</div>


<%@ include file="../../Inferior.jsp" %>