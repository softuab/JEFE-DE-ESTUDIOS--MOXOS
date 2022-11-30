<%@ include file="../../Superior.jsp" %>

<body onLoad='iniciar()'>

<div class="titulo">Ver Reporte resumen de notas </div>
<form name="fvolver" method="POST" action="./verResumenNotas.fautapo">

  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>
<c:if test="${!empty cliente.id_rol}">
<form name='forma' method="post" action='<c:url value="/listarDocentesAsignados.fautapo"/>'>
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
  </table>
  <center>
    <input type='button' value='Siguiente' class="siguiente" onClick='javascript:verificar();'>
  </center>
</form>
</c:if>
<script language="JavaScript">

var combo = new Array();
var padre_hijo = new Array();
h = 0;
<c:if test="${fn:length(acceso.listaFacultades) > 0}">
  padre_hijo[h] = new Array("id_facultad", "''");
  combo[h] = new Array();
  <c:forEach var="facultad" items="${acceso.listaFacultades}" varStatus="fac">
    combo[h][<c:out value="${fac.index}"/>] = new Array("<c:out value="${facultad.id_facultad}"/>", "<c:out value="${facultad.facultad}"/>", "");
  </c:forEach>
  h++;
</c:if>
<c:if test="${fn:length(acceso.listaDepartamentos) > 0}">
  padre_hijo[h] = new Array("id_departamento", <c:if test="${fn:length(acceso.listaFacultades) == 0}">"''"</c:if> <c:if test="${fn:length(acceso.listaFacultades) > 0}">"id_facultad"</c:if>);
  combo[h] = new Array();
  <c:forEach var="departamento" items="${acceso.listaDepartamentos}" varStatus="prg">
    combo[h][<c:out value="${prg.index}"/>] = new Array("<c:out value="${departamento.id_departamento}"/>", "<c:out value="${departamento.departamento}"/>", "<c:out value="${departamento.id_facultad}"/>");
  </c:forEach>
  h++;
</c:if>

//-------------------

function dominios(nombre){
  valor=-1;
  for (d=0;d<padre_hijo.length;d++){
    if(padre_hijo[d][0]==nombre)
      valor=d;
  }
  return valor;
}

function buscarHijo(padre){
  var hijo = new Array();
  k = 0;
  for (i=0;i<padre_hijo.length;i++){
    if (padre_hijo[i][1]==padre){
      hijo[k] = padre_hijo[i][0];
      k++;
    }
  }
  return hijo;
}

function limpiarHijo(objeto){
  if(objeto!='')
    for(i=0;i<objeto.length;i++){
      limpiarPadre(objeto[i]);
    }
}

function limpiarPadre(objeto){
  //alert("objeto=" + objeto);
  if (eval("typeof(document.getElementById(objeto))!='undefined'")){
    combito = document.getElementById(objeto);
    if(combito.options.length !=null)
      for (m=combito.options.length-1;m>0;m--)
        combito.options[m]=null;
        combito.options[0]= new Option(" - Elija una opción - ","-1");
  }
  objetos=buscarHijo(objeto);
  limpiarHijo(objetos);
}

function poblar(nombre, filtro){
  dominio = dominios(nombre);
  hijos = buscarHijo(nombre);
  limpiarHijo(hijos);

  for (j=0;j<hijos.length;j++){
    if (eval("typeof(document.getElementById(hijos[j]))!='undefined'")) {
      objeto = document.getElementById(hijos[j]);
      k = 1;
      objeto.options[0] = new Option(" - Elija una opción - ","-1");
      hijo = hijos[j];
      hijo1 = dominios(hijos[j]);
      if(filtro != '-1'){
        for (i=0;i<combo[hijo1].length;i++){
          if(filtro==combo[hijo1][i][2]){
            objeto.options[k] = new Option(combo[hijo1][i][1],combo[hijo1][i][0]);
            k++;
          }
        }
      } else {
        for (i=0;i<combo[hijo1].length;i++){
          objeto.options[k] = new Option(combo[hijo1][i][1],combo[hijo1][i][0]);
          k++;
        }
      }
      objeto.options[0].selected=true;
    }
  }
}

function iniciar(){
  for (i=0;i<padre_hijo.length;i++){
    valor=dominios(padre_hijo[i][0]);
    objeto = document.getElementById(padre_hijo[valor][0]);
    objeto.options[0] = new Option(" - Elija una opción - ", "-1");
    if(padre_hijo[valor][1]=="''"){
      for(j=0;j<combo[valor].length;j++){
        objeto.options[j + 1] = new Option(combo[valor][j][1],combo[valor][j][0]);
      }
    }
  }
}
function verificar(){
  if((document.forma.id_facultad.value!=-1)&&(document.forma.id_departamento.value!=-1)&&(document.forma.id_tipo_evaluacion.value!="")){
    document.forma.submit();
  }
  else{
    alert('Por Favor Ingrese los Datos');
  }
}
</script>
</body>
<%@ include file="../../Inferior.jsp" %>