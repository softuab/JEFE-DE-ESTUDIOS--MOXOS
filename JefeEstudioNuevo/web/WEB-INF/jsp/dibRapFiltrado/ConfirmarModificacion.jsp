<%@ include file="../Superior.jsp" %>

<div class="titulo">Modificando <c:out value="${tabla.etiqueta}" /></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<form name='forma' method="post" action="<c:url value='/dibRapFiltrado/registrarModificacion.fautapo'/>">

<table class="formulario">
  <tr>
    <th colspan="3" align="center">CONFIRME LOS DATOS</th>
  </tr>
  <c:forEach var="listaCampos" items="${listaCampos}" varStatus="contador">
    <c:if test="${listaCampos.x == 1}" >
      <tr>
    </c:if>
      <td class="etiqueta"><c:out value="${listaCampos.etiqueta}"/></td>
      <td class="etiqueta" >::</td>
      <td>
         <!--  INICIO JOJO  -->
         <c:if test="${!empty listaCampos.combo}">
           <c:out value="${listaCampos.detalle}"/>
         </c:if>

         <c:if test="${empty listaCampos.combo}">
           <c:out value="${listaCampos.valores}" escapeXml="false"/>
         </c:if>
         <!--  FIN JOJO  -->
         <input type="hidden" name='<c:out value="${listaCampos.campo}"/>' value="<c:out value='${listaCampos.valores}' escapeXml='false' />" >
      </td>
    <!-- /tr -->
  </c:forEach>
</table>
<center>
  <input type="submit" value='Aceptar' class="aceptar"> &nbsp;
  <input type="button" value='Cancelar' class="cancelar" OnClick='javascript:history.go(-2);'>
</center>
<input type="hidden" name="t" value='<c:out value="${tabla.id_tabla}"/>' >
<input type="hidden" name="e" value='<c:out value="${id_enlace}"/>' >
<input type="hidden" name="c" value='<c:out value="${valoresPrimarios}"/>' >
<input type="hidden" name="p" value="<c:out value='${permiso}' />">
<input type="hidden" name="f" value="<c:out value='${condicion}' />">
<input type="hidden" name="a" value="<c:out value='${id_actividad}' />">

</form>

<%@ include file="../Inferior.jsp" %>