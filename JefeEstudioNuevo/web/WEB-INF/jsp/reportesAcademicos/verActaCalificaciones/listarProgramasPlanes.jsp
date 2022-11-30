<%@ include file="../../Superior.jsp" %>

<body onLoad='iniciar()'>

<div class="titulo">Ver Reporte acta de calificaciones </div>
<form name="fvolver" method="POST" action="./verActaCalificaciones.fautapo">

  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>

<form name='forma' method="post" action='<c:url value="/listarDocentesActaCalificaciones.fautapo"/>'>
  <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>' >
  <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">
        <c:choose>
          <c:when test="${cliente.id_universidad > 0}">Universidad</c:when>
          <c:when test="${cliente.id_facultad > 0}">Facultad</c:when>
          <c:when test="${cliente.id_departamento > 0}">Departamento</c:when>
        </c:choose>      
      </td>
      <td class="etiqueta">::</td>
      <td><c:out value="${acceso.acceso}"/></td>
    </tr>
    <!--
    <c:if test="${fn:length(acceso.listaFacultades) > 0}">
      <tr>
        <td class="etiqueta">Facultad</td>
        <td class="etiqueta">::</td>
        <td><select name="id_facultad" id="id_facultad" onChange="poblar(this.name, this.options[this.selectedIndex].value)"/></td>
      </tr>
    </c:if>
    <c:if test="${fn:length(acceso.listaDepartamentos) > 0}">
      <tr>
        <td class="etiqueta">Departamento</td>
        <td class="etiqueta">::</td>
        <td><select name="id_departamento" id="id_departamento" onChange="poblar(this.name, this.options[this.selectedIndex].value)"/></td>
      </tr>
    </c:if>
    <c:if test="${fn:length(lListarTiposEvaluaciones) > 0}">
    <tr>
      <td class="etiqueta" align=right>Tipo de Evaluaci&oacute;n</td>
      <td class="etiqueta">::</td>
      <td>
        <select name="id_tipo_evaluacion">
	  <option value=""> - Elija una opción - 
            <c:forEach var="tipo" items="${lListarTiposEvaluaciones}">
              <option value="<c:out value="${tipo.id_tipo_evaluacion}"/>"> <c:out value="${tipo.tipo_evaluacion}"/>
	      </option>
            </c:forEach>
	  </option>    
        </select>
      </td>
    </tr>
    </c:if>
    -->
    <tr>
      <td class="etiqueta">Facultad<font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select id='id_facultad' name='id_facultad' size='1'
          onChange="poblar('id_facultad', this.options[this.selectedIndex].value); document.forma.facultad.value = Afacultades[document.forma.id_facultad.value];">
        </select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Programa <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select id='id_programa' name='id_programa' size='1'
          onChange="poblar('id_programa', this.options[this.selectedIndex].value); document.forma.id_programa.value = Aprogramas[document.forma.id_programa.value];">
        </select>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Plan <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select id='id_plan' name='id_plan' size='1'
          onChange="poblar('id_plan', this.options[this.selectedIndex].value); document.forma.id_plan.value = Aplanes[document.forma.id_plan.value];">
        </seelect>
      </td>
    </tr>
    
  </table>
  <center>
    <input type='button' value='Siguiente' class="siguiente" onClick='javascript:verificar();'>
  </center>
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

<script>
  var Afacultades = new Array();
  padre_hijo[h] = new Array ("id_facultad", "''", "<c:out value = "${id_facultad}"/>");
  combo[h] = new Array();
  combo[h][0] = new Array("0", "- Elija una opcion -", "");
  <c:forEach var = "lista" items = "${lFacultades}" varStatus="contador">
    Afacultades[<c:out value = "${lista.id_facultad}"/>] = '<c:out value = "${lista.facultad}"/>';
    combo[h][<c:out value = "${contador.count}"/>] = new Array("<c:out value = "${lista.id_facultad}"/>", "<c:out value = "${lista.facultad}"/>", "");
  </c:forEach>
  h++;
</script>

<script>
  var Aprograma = new Array();
  padre_hijo[h] = new Array ("id_programa", "id_facultad", "<c:out value = "${id_programa}"/>");
  combo[h] = new Array();
  combo[h][0] = new Array("0", "- Elija una opcion -", "");
  <c:forEach var = "cod" items = "${lProgramas}" varStatus = "programac">
    Aprograma[<c:out value = "${cod.id_programa}"/>] = '<c:out value = "${cod.programa}"/>';
    combo[h][<c:out value = "${programac.count}"/>] = new Array("<c:out value = "${cod.id_programa}"/>", "<c:out value = "${cod.programa}"/>", "<c:out value = "${cod.id_facultad}"/>");
  </c:forEach>
  h++;
</script>

<script>
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



<script language="JavaScript">
 iniciar();
 function verificar(){
  if((document.forma.id_facultad.value!=-1)&&(document.forma.id_programa.value!=-1)&&
      (document.forma.id_programa.value!="")&&
      (document.forma.id_plan.value!="")){
    document.forma.submit();
  }
  else{
    alert('Ingrese los Datos');
  }
} 
</script>
<%@ include file="../../Inferior.jsp" %>