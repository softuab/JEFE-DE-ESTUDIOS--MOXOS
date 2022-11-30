<%@ include file="../../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<div class="titulo"><c:out value="${proceso.proceso}"/></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<form name="forma" id="forma" method="post" action="estRegistrarTransaccion.fautapo" >
  <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
  <input type="hidden" name="id_proceso" value="<c:out value='${id_proceso}'/>">
  <input type="hidden" name="total" value="<c:out value="${total}"/>">
  <input type="hidden" name="titulo" value="<c:out value='${titulo}'/>">

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
    <th>Fecha</th>
    <td class="colb"><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></td>
  </tr>
</table>
<br>
<table class="formulario">
  <tr>
    <th colspan="3">Cambiar al programa ...</th>
  </tr>
  <tr>
    <td class="etiqueta">Facultad</td>
    <td class="etiqueta">::</td>
    <td>
      <select id='id_facultad' name='id_facultad'
        onChange="poblar('id_facultad', this.options[this.selectedIndex].value); document.forma.facultad.value = Afacultades[document.forma.id_facultad.value];">
      </select>
    </td>
  </tr>
  <tr>
    <td class="etiqueta">Programa</td>
    <td class="etiqueta">::</td>
    <td>
      <select id='id_programa' name='id_programa'
        onChange="poblar('id_programa', this.options[this.selectedIndex].value); document.forma.id_programa.value = Aprogramas[document.forma.id_programa.value];">
      </select>
    </td>
  </tr>
  <tr>
    <td class="etiqueta">Plan</td>
    <td class="etiqueta">::</td>
    <td>
      <select id='id_plan' name='id_plan'
        onChange="poblar('id_plan', this.options[this.selectedIndex].value); document.forma.id_plan.value = Aplanes[document.forma.id_plan.value];">
      </select>
    </td>
  </tr>
</table>
<br>
<c:if test="${!empty descuento}">
  <h4> Tipo de descuento : <c:out value="${descuento.tipo_descuento}"/> </h4>
</c:if>
<table class="tabla">
  <tr>
    <th colspan="4"><c:out value="${perfil.perfil}"/></th>
  </tr>
  <tr>
    <th>Concepto</th>
    <th>Costo (Bs.)</th>
    <th>Descuento</th>
    <th>Monto (Bs.)</th>
  </tr>
  <c:forEach var="lista" items="${lConceptos}" varStatus="contador">
    <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ -->
      <td><c:out value="${lista.concepto}"/></td>
      <td><c:out value="${lista.costo}"/></td>
      <td><c:out value="${lista.descuento}"/></td>
      <td align="right"><c:out value="${lista.costo - lista.descuento}"/></td>
    </tr>
  </c:forEach>
  <tr>
    <th colspan="3">Son:: <c:out value="${literal}"/></th>
    <td class="colb" align="right"><b><c:out value="${total}"/></b></td>
  </tr>
  <tr>
    <td colspan="4" align="center"><input type="submit" class='aceptar' value="Registrar"></td>
  </tr>
</table>

</form>

<script language="JavaScript">
  var Afacultades = new Array();
  padre_hijo[h] = new Array ("id_facultad", "''", "<c:out value = "${id_facultad}"/>");
  combo[h] = new Array();
  combo[h][0] = new Array("0", "- Elija una opcion -", "");
  <c:forEach var = "lista" items = "${lFacultades}" varStatus="contador">
    Afacultades[<c:out value = "${lista.id_facultad}"/>] = '<c:out value = "${lista.facultad}"/>';
    combo[h][<c:out value = "${contador.count}"/>] = new Array("<c:out value = "${lista.id_facultad}"/>", "<c:out value = "${lista.facultad}"/>", "");
  </c:forEach>
  h++;

  var Aprograma = new Array();
  padre_hijo[h] = new Array ("id_programa", "id_facultad", "<c:out value = "${id_programa}"/>");
  combo[h] = new Array();
  combo[h][0] = new Array("0", "- Elija una opcion -", "");
  <c:forEach var = "cod" items = "${lProgramas}" varStatus = "programac">
    Aprograma[<c:out value = "${cod.id_programa}"/>] = '<c:out value = "${cod.programa}"/>';
    combo[h][<c:out value = "${programac.count}"/>] = new Array("<c:out value = "${cod.id_programa}"/>", "<c:out value = "${cod.programa}"/>", "<c:out value = "${cod.id_facultad}"/>");
  </c:forEach>
  h++;

  var Aplanes = new Array();
  padre_hijo[h] = new Array ("id_plan", "id_programa", "<c:out value = "${id_plan}"/>");
  combo[h] = new Array();
  combo[h][0] = new Array("0", "- Elija una opcion -", "");
  <c:forEach var = "cod" items = "${lPlanes}" varStatus = "planc">
    Aplanes[<c:out value = "${cod.id_plan}"/>] = '<c:out value = "${cod.id_plan}"/>';
    combo[h][<c:out value = "${planc.count}"/>] = new Array("<c:out value = "${cod.id_plan}"/>", "<c:out value = "${cod.id_plan}"/>", "<c:out value = "${cod.id_programa}"/>");
  </c:forEach>
  h++;
</script>

<%@ include file="../../../Inferior.jsp" %>