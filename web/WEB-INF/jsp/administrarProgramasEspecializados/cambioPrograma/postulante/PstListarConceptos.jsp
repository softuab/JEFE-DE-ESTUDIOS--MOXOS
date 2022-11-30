<%@ include file="../../../Superior.jsp" %>
<script language='JavaScript' SRC="../js/ajax.js"></script>

<jsp:useBean id="now" class="java.util.Date" />
<div class="titulo"><c:out value="${proceso.proceso}"/></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<br>
<form name="forma" id="forma" method="post" action="pstRegistrarPrograma.fautapo" >
  <input type="hidden" name="id_tramite" value="<c:out value='${id_tramite}'/>">
  <input type="hidden" name="id_proceso" value="<c:out value='${proceso.id_proceso}'/>">
  <input type="hidden" name="programa" id="programa" value="">
  <input type="hidden" name="plan" id="plan" value="">

<table class="tabla">
  <tr>
    <th>postulante</th>
    <td class="colb">
      <c:out value="${postulante.nombres}"/> <c:out value="${postulante.paterno}"/> <c:out value="${postulante.materno}"/>
    </td>
    <th>RU</th>
    <td class="colb"><c:out value="${postulante.id_postulante}"/></td>
    <th>Gesti&oacute;n</th>
    <td class="colb"><c:out value="${periodo}"/>-<c:out value="${gestion}"/></td>
  </tr>
  <tr>
    <th>Programa</th>
    <td class="colb"><c:out value="${postulante.programa}"/>
    <th>Plan</th>
    <td class="colb"><c:out value="${postulante.id_plan}"/>
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
        onChange="poblar('id_facultad', this.options[this.selectedIndex].value); document.forma.id_facultad.value = Afacultades[document.forma.id_facultad.value];">
      </select>
    </td>
  </tr>
  <tr>
    <td class="etiqueta">Programa <font color='red'>(*)</font></td>
    <td class="etiqueta">::</td>
    <td>
      <SELECT id='id_programa' name='id_programa'
        onChange="poblar('id_programa', this.options[this.selectedIndex].value); document.forma.id_programa.value = Aprogramas[document.forma.id_programa.value];">
      </SELECT>
    </td>
  </tr>
  <tr>
    <td class="etiqueta">Plan <font color='red'>(*)</font></td>
    <td class="etiqueta">::</td>
    <td>
      <SELECT id='id_plan' name='id_plan'
        onChange="poblar('id_plan', this.options[this.selectedIndex].value); document.forma.id_plan.value = Aplanes[document.forma.id_plan.value];">
      </SELECT>
    </td>
  </tr>
</table>
<center>
  <input type='button' value='Siguiente' class="siguiente" onClick='registrarDatos(); obligar(document.forma, "id_programa;id_plan")'>
</center>
</form>

<script language="JavaScript">
function registrarDatos(){
  document.getElementById("programa").value=document.getElementById("id_programa").options[document.getElementById("id_programa").selectedIndex].innerHTML;
  document.getElementById("plan").value=document.getElementById("id_plan").options[document.getElementById("id_plan").selectedIndex].innerHTML;
}

var Afacultades = new Array();
padre_hijo[h] = new Array ("id_facultad", "''", "<c:out value = "${id_facultad}"/>");
combo[h] = new Array();
combo[h][0] = new Array("-1", "- Elija una opcion -", "");
<c:forEach var="lista" items="${lFacultades}" varStatus="contador">
  Afacultades[<c:out value = "${lista.id_facultad}"/>] = '<c:out value = "${lista.facultad}"/>';
  combo[h][<c:out value = "${contador.count}"/>] = new Array("<c:out value = "${lista.id_facultad}"/>", "<c:out value = "${lista.facultad}"/>", "");
</c:forEach>
h++;

var Aprogramas = new Array();
padre_hijo[h] = new Array ("id_programa", "id_facultad", "<c:out value = "${id_programa}"/>");
combo[h] = new Array();
combo[h][0] = new Array("-1", "- Elija una opcion -", "");
<c:forEach var = "cod" items = "${lProgramas}" varStatus = "programac">
  Aprogramas[<c:out value = "${cod.id_programa}"/>] = '<c:out value = "${cod.programa}"/>';
  combo[h][<c:out value = "${programac.count}"/>] = new Array("<c:out value = "${cod.id_programa}"/>", "<c:out value = "${cod.programa}"/>", "<c:out value = "${cod.id_facultad}"/>");
</c:forEach>
h++;

var Aplanes = new Array();
padre_hijo[h] = new Array ("id_plan", "id_programa", "<c:out value = "${id_plan}"/>");
combo[h] = new Array();
combo[h][0] = new Array("-1", "- Elija una opcion -", "");
<c:forEach var = "cod" items = "${lPlanes}" varStatus = "planc">
  Aplanes[<c:out value = "${cod.id_plan}"/>] = '<c:out value = "${cod.id_plan}"/>';
  combo[h][<c:out value = "${planc.count}"/>] = new Array("<c:out value = "${cod.id_plan}"/>", "<c:out value = "${cod.id_plan}"/>", "<c:out value = "${cod.id_programa}"/>");
</c:forEach>
h++;

iniciar();
</script>

<%@ include file="../../../Inferior.jsp" %>