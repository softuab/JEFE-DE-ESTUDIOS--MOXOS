<%@ include file="../Superior.jsp" %>

<div class="titulo">Agregando <c:out value="${tabla.etiqueta}" /></div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<body onLoad='iniciar()'>
<form name='forma' method="post" action="<c:url value='/dibRapFiltrado/confirmarNuevo.fautapo'/>">

<table class="formulario">
  <tr>
    <th colspan=3>INTRODUZCA LOS DATOS</th>
  </tr>
  <c:forEach var="listaCampos" items="${listaCampos}" varStatus="contador">
    <c:if test="${listaCampos.x == 1}" >
      <tr>
    </c:if>
      <td class="etiqueta"><c:out value="${listaCampos.etiqueta}"/>
          <c:if test='${listaCampos.permiso == "o"}'><font color='red'>(*)</font></c:if>
      </td>
      <td class="etiqueta">::</td>
      <td>
        <!--  INICIO JOJO  -->
        <c:if test="${(!empty listaCampos.combo) and (listaCampos.id_componente == 1)}">
          <SELECT id='<c:out value="${listaCampos.campo}"/>' NAME='<c:out value="${listaCampos.campo}"/>' size='<c:out value="${listaCampos.filas}"/>'
                  onChange="poblar('<c:out value='${listaCampos.campo}'/>', this.options[this.selectedIndex].value )" >
          </SELECT>
        </c:if>

        <c:set var="fin" value="1" />
        <c:if test="${!empty listaCampos.combo}">
          <c:set var="fin" value="${fn:length(listaCampos.combo) - 1}" />
        </c:if>

        <c:forEach var="_i" begin="1" end="${fin}">
          <c:set var="valores" value="${listaCampos.valores}" />
          <c:if test="${!empty listaCampos.combo}">
            <c:set var="id_valor" value="${listaCampos.combo[_i].id_campo}" />
            <c:set var="valores" value="${listaCampos.combo[_i].campo}" />
          </c:if>

          <c:choose>
            <c:when test="${(empty listaCampos.combo) and (listaCampos.id_componente == 1)}">
              <input type="text" name='<c:out value="${listaCampos.campo}"/>' value='<c:out value="${valores}"/>' maxlength='<c:out value="${listaCampos.caracteres}"/>' size='<c:out value="${listaCampos.columnas}"/>'/> <br>
            </c:when>
            <c:when test="${listaCampos.id_componente == 2}">
              <textarea name='<c:out value="${listaCampos.campo}"/>' cols='<c:out value="${listaCampos.columnas}"/>' rows='<c:out value="${listaCampos.filas}"/>'><c:out value="${valores}"/></textarea> <br>
            </c:when>
            <c:when test="${listaCampos.id_componente == 3}">
              <input type="text" name='<c:out value="${listaCampos.campo}"/>' value='<c:out value="${valores}"/>' maxlength='<c:out value="${listaCampos.caracteres}"/>' size='<c:out value="${listaCampos.columnas}"/>'/><small><a href="javascript:showCal('<c:out value="${listaCampos.campo}"/>')"><img src="../imagenes/dibRap/calendario.jpeg" border="0" /></a></small> <br>
            </c:when>
            <c:when test="${listaCampos.id_componente == 4}">
              <input type="radio" name='<c:out value="${listaCampos.campo}"/>' value="true" <c:if test="${valores}">checked</c:if> />Sí &nbsp; <input type="radio" name='<c:out value="${listaCampos.campo}"/>' value="false" <c:if test="${!valores}">checked</c:if> />No <br>
            </c:when>
            <c:when test="${listaCampos.id_componente == 5}">
              <input type="radio" name='<c:out value="${listaCampos.campo}"/>' value='<c:out value="${id_valor}" />' /><c:out value="${valores}"/> <br>
            </c:when>
          </c:choose>
        </c:forEach>
        <!--  FIN JOJO  -->
      </td>
    <!-- /tr -->
    <c:forEach var="combo" items="${listaCampos.combo}">
      <input type="hidden" name='<c:out value="${listaCampos.campo}" /><c:out value="${combo.id_campo}" />' value='<c:out value="${combo.campo}"/>' >
    </c:forEach>
  </c:forEach>
</table>
<center>
  <input type='button' value='Siguiente' class="siguiente" onClick='obligar(document.forma, "<c:out value='${obligatorios}'/>")'>
</center>
<input type="hidden" name="t" value='<c:out value="${tabla.id_tabla}"/>' >
<input type="hidden" name="e" value='<c:out value="${id_enlace}"/>' >
<input type="hidden" name="p" value="<c:out value='${permiso}' />">
<input type="hidden" name="f" value="<c:out value='${condicion}' />">
<input type="hidden" name="a" value="<c:out value='${id_actividad}' />">

<div class="nota">
  Los campos con <font color='red'>(*)</font>, son obligatorios. <br/>
  A los campos vac&iacute;os se les asignar&aacute; un valor por defecto.
</div>

<script language="JavaScript">

<!--
//----------------
  var combo = new Array();
  var padre_hijo = new Array();
  h = 0;

    <c:forEach var="listaCampos" items="${listaCampos}" varStatus="contador">
      <c:if test="${(!empty listaCampos.combo) and (listaCampos.id_componente != 5)}">
        padre_hijo[h] =new Array("<c:out value='${listaCampos.campo}'/>", "<c:out value='${listaCampos.campo_padre}' escapeXml='false' />");
        combo[h]=new Array();
        <c:forEach var="combo" items="${listaCampos.combo}"  varStatus="contador1">
          combo[h][<c:out value="${contador1.index}"/>]=new Array("<c:out value='${combo.id_campo}'/>","<c:out value='${combo.campo}'/>","<c:out value='${combo.campo_padre}'/>");
        </c:forEach>
        h++;
      </c:if>
    </c:forEach>

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
      if(padre_hijo[valor][1]=="''"){
        for(j=0;j<combo[valor].length;j++){
          objeto.options[j] = new Option(combo[valor][j][1],combo[valor][j][0]);
        }
      } else {
        objeto.options[0] = new Option(" - Elija una opción - ","0");
      }
    }
  }

-->
</script>

</form>
</body>
<%@ include file="../Inferior.jsp" %>