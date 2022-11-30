<%@ include file="../Superior.jsp" %>


<div class=titulo>Definir evaluaci&oacute;n</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<a class="enlace" href="javascript:history.back();"><< Volver</a>
<c:if test="${mensaje != null}">
    <div class ="cuadroAviso"><c:out value="${mensaje}"/></div>
</c:if>

<c:if test="${mensaje == null}">

<table class="tabla" border="0">
  <tr>
    <th>CARRERA/PROGRAMA</th>
    <th>SIGLA</th>
    <th>MATERIA</th>
    <c:if test="{!empty materia_ahorro}"> <th>MATERIA AHORRO</th></c:if>
    <th>GRUPO</th>
    <th>GESTION</th>
    <th>PERIODO</th>
    <th>FASE ACTUAL</th>
  <tr>    
    <td align="center"><c:out value="${programa}"/></td>
    <td align="center"><c:out value="${datosAsignacion.sigla}"/></td>    
    <td align="center"><c:out value="${materia}"/></td>    
    <c:if test="{!empty materia_ahorro}"><td class="colb" align="center"><c:out value="${materia_ahorro}"/></td></c:if>
    <td align="center"><c:out value="${datosAsignacion.grupo}"/></td>
    <td align="center"><c:out value="${datosAsignacion.gestion}"/></td>
    <td align="center"><c:out value="${datosAsignacion.periodo}"/></td>
    <td class="colb" align="center"><c:out value="${datosAsignacion.fase}"/></td>
   </tr>
</table>
<br>
<div class="H4"><b><c:out value="${tipo_evaluacion}"/></b></div>

<form name=forma1 method="post">
  <table class="formulario" > 
    <tr>
      <th>Nro.</th>
      <th>TIPO NOTA</th>
      <th>CANTIDAD</th>
      <th>PORCENTAJE</th>
    </tr>
    <c:forEach var="nota" items="${lTiposNotas}" varStatus="contador">    
      <!-- ********** Esto es para el efecto ************ -->
        <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
      <!-- ********** Fin  efecto ************ --> 
    
      <td align="center"><c:out value="${contador.count}"/></td>
      <td><c:out value="${nota.tipo_nota}"/></td>
      <td align="center"><c:out value="${nota.cantidad}"/></td> 
      <td align="center"><c:out value="${nota.ponderacion}"/></td></td> 
    </tr>
    </c:forEach>
    <tr>
      <td colspan=2 align="center"><input type="submit" value="Modificar Evaluacion" onclick="document.forma1.action='<c:url value="/definirEvaluacion/definirEvaluacion.fautapo"/>'"></td>
      <td colspan=2 align="center"><input type="submit" value="Confirmar" onclick="document.forma1.action='<c:url value="/definirEvaluacion/registrarDefinicion.fautapo"/>'"></td>
    </tr>
 </table>
  <input type=hidden name="id_asignacion"         value="<c:out value="${id_asignacion}"/>" >
  <input type=hidden name="id_programa"        value="<c:out value="${id_programa}"/>" >
  <input type=hidden name="id_modelo_ahorro"   value="<c:out value="${datosAsignacion.id_modelo_ahorro}"/>" >
</form>  
</c:if>

<%@ include file="../Inferior.jsp" %>
 