<%@ include file="../../../Superior.jsp" %>

<div class="titulo"><c:out value="${proceso.proceso}"/></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>

<table class="tabla">
  <tr>
    <th>Estudiante</th>
    <td class="colb">
      <c:out value="${estudiante.nombres}"/> <c:out value="${estudiante.paterno}"/> <c:out value="${estudiante.materno}"/>
    </td>
    <th>RU</th>
    <td class="colb"><c:out value="${estudiante.id_estudiante}"/></td>
    <th>Gesti&oacute;n</th>
    <td class="colb"><c:out value="${periodo}"/>-<c:out value="${gestion}"/></td>
  </tr>
  <tr>
    <th>Programa</th>
    <td class="colb"><c:out value="${estudiante.programa}"/>
    <th>Plan</th>
    <td class="colb"><c:out value="${estudiante.id_plan}"/>
    <th></th>
    <td class="colb"></td>
  </tr>
</table>
<br>
<form name="forma" action="registrarTransaccion.fautapo" method="POST">
  <input type="hidden" name="id_estudiante" value="<c:out value="${estudiante.id_estudiante}"/>">
  <input type="hidden" name="gestion" value="<c:out value="${gestion}"/>">
  <input type="hidden" name="periodo" value="<c:out value="${periodo}"/>">
  <input type="hidden" name="id_proceso" value="<c:out value="${proceso.id_proceso}"/>">
  <input type="hidden" name="id_perfil" value="<c:out value="${lMaterias[0].id_perfil}"/>">

<table class="tabla">
  <c:set var="tipo" value="0"/>
  <c:forEach var="lista" items="${lMaterias}" varStatus="contador">
    <c:if test="${tipo != lista.id_tipo_evaluacion}">
      <tr>
        <th colspan="3"><c:out value="${lista.tipo_evaluacion}"/></th>
      </tr>
      <tr>
        <th>?</th>
        <th>Materia</th>
        <th>Costo (Bs.)</th>
      </tr>
    </c:if>
    <!-- ********** Esto es para el efecto ************ -->
    <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ -->
    <td>
      <c:if test="${lista.numero == '-1'}">
        <input type="checkbox" name="id_perfil_materia" id="<c:out value="${lista.id_perfil_materia}"/>" value="<c:out value="${lista.id_perfil_materia}"/>" onChange="cambiarTotal(<c:out value="${lista.id_perfil_materia}"/>);">
      </c:if>
      <c:if test="${lista.numero != '-1'}">
        <font color="red">Programado</font>
      </c:if>
    </td>
    <td><c:out value="${lista.materia}"/></td>
    <td align="right">
      <c:out value="${lista.costo}"/>
      <input type="hidden" id="co_<c:out value="${lista.id_perfil_materia}"/>" name="co_<c:out value="${lista.id_perfil_materia}"/>" value="<c:out value="${lista.costo}"/>">
    </td>
  </tr>
  <c:set var="tipo" value="${lista.id_tipo_evaluacion}"/>
  </c:forEach>
  <tr>
    <td colspan="2" align="center">TOTAL</td>
    <td align="right"><span id="total">0</span></td>
  </tr>
  <tr>
    <td colspan="5" align="center"><input type="submit" class='aceptar' value="Registrar"></td>
  </tr>
</table>
</form>

<script language="JavaScript">
function cambiarTotal(id){
  var valor=document.getElementById(id).checked;
  var totalcito=document.getElementById('total');
  var subtotal=parseFloat(totalcito.innerHTML);
  var costito=parseFloat(document.getElementById('co_'+id).value);
  if(valor)
    subtotal+=costito;
  else
    subtotal-=costito;
  totalcito.innerHTML=subtotal;
}
</script>

<%@ include file="../../../Inferior.jsp" %>