<%@ include file="../../Superior.jsp" %>

<div class="titulo">Autorizar Convalidaci&oacute;n Manual</div>
<br>
<table>
  <tr>    
    <td>
      <form name="fvolver" action="<c:url value='entrada.fautapo'/>" method="post">
      <div> <a class="volver" href="javascript:document.fvolver.submit();"> Volver</a> </div>
    </form>
    </td>
  </tr>
</table>

<body onLoad='iniciar()'>
<form name='forma' method="post" action='<c:url value="/autorizarConvalidacionManual/listarConvalidacionesPrograma.fautapo"/>'>
<table class="formulario">
  <tr>
    <th colspan="3">INTRODUZCA LOS DATOS</th>
  </tr>
  <tr>
    <td class="etiqueta">
      <c:choose>
        <c:when test="${cliente.id_universidad > 0}">Universidad</c:when>
        <c:when test="${cliente.id_facultad > 0}">Facultad</c:when>
        <c:when test="${cliente.id_programa > 0}">Programa</c:when>
        <c:when test="${cliente.id_departamento > 0}">Departamento</c:when>
      </c:choose>      
    </td>
    <td class="etiqueta">::</td>
    <td><c:out value="${acceso.acceso}"/></td>
  </tr>
  <c:if test="${fn:length(acceso.listaFacultades) > 0}">
    <tr>
      <td class="etiqueta">Facultad <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><select name="id_facultad" id="id_facultad" onChange="poblar(this.name, this.options[this.selectedIndex].value)"/></td>
    </tr>
  </c:if>
  <c:if test="${fn:length(acceso.listaProgramas) > 0}">
    <tr>
      <td class="etiqueta">Programa <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><select name="id_programa" id="id_programa" onChange="poblar(this.name, this.options[this.selectedIndex].value)"/></td>
    </tr>
  </c:if>
</table>
<center>
  <input type='button' value='Siguiente' class="siguiente" onClick='obligar(document.forma, "<c:out value='${obligatorios}'/>")'>
</center>
<c:if test="${cliente.id_facultad > 0}"><input type="hidden" name="id_facultad" value='<c:out value="${cliente.id_facultad}"/>'></c:if>
<c:if test="${cliente.id_programa > 0}"><input type="hidden" name="id_programa" value='<c:out value="${cliente.id_programa}"/>'></c:if>
<c:if test="${cliente.id_departamento > 0}"><input type="hidden" name="id_departamento" value='<c:out value="${cliente.id_departamento}"/>'></c:if>
</form>

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
<c:if test="${fn:length(acceso.listaProgramas) > 0}">
  padre_hijo[h] = new Array("id_programa", <c:if test="${fn:length(acceso.listaFacultades) == 0}">"''"</c:if> <c:if test="${fn:length(acceso.listaFacultades) > 0}">"id_facultad"</c:if>);
  combo[h] = new Array();
  <c:forEach var="programa" items="${acceso.listaProgramas}" varStatus="prg">
    combo[h][<c:out value="${prg.index}"/>] = new Array("<c:out value="${programa.id_programa}"/>", "<c:out value="${programa.programa}"/>", "<c:out value="${programa.id_facultad}"/>");
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
        combito.options[0]= new Option(" - Elija una opción - ","0");
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
      objeto.options[0] = new Option(" - Elija una opción - ","0");
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
    objeto.options[0] = new Option(" - Elija una opción - ", "0");
    if(padre_hijo[valor][1]=="''"){
      for(j=0;j<combo[valor].length;j++){
        objeto.options[j + 1] = new Option(combo[valor][j][1],combo[valor][j][0]);
      }
    }
  }
}

</script>

</body>
<%@ include file="../../Inferior.jsp" %>