<%@ include file="../../Superior.jsp" %>
<!--
  FUNDACION AUTAPO
  @autor           : Luis A. Jordan P.
  @fec_registro    : 11/04/2006
  @ult_usuario     : Jorge Copa
  @fec_modificacion: 2007-11-13
-->
<jsp:useBean id="now" class="java.util.Date"/>
<body onLoad='iniciar()'>
<script language="JavaScript">
  var calFormat="<c:out value='yyyy-MM-dd'/>";
</script>

<!-- ************  Titulo  ********** -->
<div class="titulo">Reporte de certificados Anulados</div>
<br>
<br>
<!-- ************  fin Tititulo  ********** -->

<form name="forma" method="post" action="formarReporte.fautapo"  target="_blank">
   <input type="hidden" name="tipo_cheque" value="<c:out value='${tipo_cheque}'/>">
  <br>
 
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
 <tr>
    <td class="etiqueta">Tipo Certificado </td>
    <td class="etiqueta">::</td>
	<td>
       <select name="tipo_cert">
	   <option value="27">Certificado de Notas</option>
       <option value="31">Historial Academico</option>    
       </select> 
	 </td>
  </tr>
  
   <tr>
      <td class="etiqueta">Fecha anulados <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
	  <td>
        <input type="text" name="fec_comprobantei" size="10" maxlength="10" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>">
	    <small><a href="javascript:showCal('fec_comprobantei')"><img src="<c:url value='/imagenes/dibRap/calendario.jpeg'/>" border="0" ></a></small>
        <input type="text" name="fec_comprobantef" size="10" maxlength="10" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>">
	  <small><a href="javascript:showCal('fec_comprobantef')"><img src="<c:url value='/imagenes/dibRap/calendario.jpeg'/>" border="0" ></a></small>
      </td>
    </tr>
	  <tr>
    <td class="etiqueta">Sede</td>
    <td class="etiqueta">::</td>
    <c:if test="${Rol == 'Admin Tramites Academicos'}">
	<td>
       <select name="sede">
	   <option value="1">CENTRAL-TRINIDAD</option>
       <option value="8">RIBERALTA</option>    
  	   <option value="4">GUAYARAMERIN</option>
       </select> 
	 </td>
    </c:if>
	<c:if test="${Rol == 'Apoyo Tramites Academicos'}">
		<c:if test="${idSede == '1'}">
			<td>
			<select name="sede">
	   <option value="1">CENTRAL-TRINIDAD</option>
       </select> 
			</td>
		</c:if>
		<c:if test="${idSede == '4'}">
			<td>
			<select name="sede">  
  	   <option value="4">GUAYARAMERIN</option>
       </select> 
			</td>
		</c:if>
		<c:if test="${idSede == '8'}">
			<td>
			<select name="sede">
       <option value="8">RIBERALTA</option>    
       </select> 
			</td>
		</c:if>
	</c:if>
  </tr>
	<c:if test="${cliente.id_programa > 0}"><input type="hidden" name="id_programa" value='<c:out value="${cliente.id_programa}"/>'></c:if>
   <tr>
      <th colspan="8">
        <input type=submit value='Aceptar'>
      </th>
    </tr>
</table>

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
        combito.options[0]= new Option(" - Elija una opcion - ","0");
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
      objeto.options[0] = new Option(" - Elija una opcion - ","0");
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
    objeto.options[0] = new Option(" - Elija una opcion - ", "0");
    if(padre_hijo[valor][1]=="''"){
      for(j=0;j<combo[valor].length;j++){
        objeto.options[j + 1] = new Option(combo[valor][j][1],combo[valor][j][0]);
      }
    }
  }
}

</script>
</form>
</body>
<%@ include file="../../Inferior.jsp" %>
