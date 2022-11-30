<%@ include file="../Superior.jsp" %>

<body onLoad="registros.ordenar('<c:out value="${listaNombresCampos[0].campo}"/>'); registros.mostrar()" >
<div class="titulo"><c:out value="${tabla.etiqueta}" /></div>
<form name='forma' id="forma" method='post' action="<c:url value='/dibRap/nuevoRegistro.fautapo'/>">
  <input type="hidden" name="t" value="<c:out value='${tabla.id_tabla}' />">
  <input type="hidden" name="e" value="<c:out value='${id_enlace}' />">
  <input type="hidden" name="c" value="" id="c">
  <input type="hidden" name="p" value="<c:out value='${permiso}' />">
  <input type="hidden" name="_f" value="<c:out value='${tabla.condicion}' />">
  <input type="hidden" name="a" value="<c:out value='${id_actividad}' />">
  <input type="hidden" name="n" value="1">
  <input type="hidden" name="_botoncillo" value="">
<br/>

<table width="100%">
<tr>
  <td>
    <c:if test='${fn:indexOf(permiso, "a") > -1}'>
      <div class="agregar">
        <a href="javascript: document.forma.submit()">Nuevo</a>
      </div>
    </c:if>
  </td>
  <td align="center">
    Filtro ::
    <select name="_campo">
      <c:forEach var="nombresCampos" items="${listaNombresCampos}">
        <option value="<c:out value='${nombresCampos.campo}'/>" <c:if test='${nombresCampos.campo == campo}'>selected="selected"</c:if> ><c:out value="${nombresCampos.etiqueta}"/></option>
      </c:forEach>
    </select>
    <select name='_condicion'>
      <optgroup label="Similitud">
        <option value=" like " <c:if test='${condicion == " like "}'>selected="selected"</c:if> >incluye</option>
      </optgroup>
      <optgroup label="Simples">
        <option value=" = " <c:if test='${condicion == " = "}'>selected="selected"</c:if> >=</option>
        <option value=" > " <c:if test='${condicion == " > "}'>selected="selected"</c:if> >&gt;</option>
        <option value=" < " <c:if test='${condicion == " < "}'>selected="selected"</c:if> >&lt;</option>
      </optgroup>
      <optgroup label="Combinaciones">
        <option value=" >= " <c:if test='${condicion == " >= "}'>selected="selected"</c:if> >&gt;=</option>
        <option value=" <= " <c:if test='${condicion == " <= "}'>selected="selected"</c:if> >&lt;=</option>
      </optgroup>
    </select>
    <input type="text" name="_filtro" value="<c:out value='${filtro}'/>" />
    <input type="submit" value="Filtrar" onClick="javascript: document.forma.action=''; document.forma._botoncillo.value='filtro'" class="filtro" />
    <input type="submit" value="Todo" onClick="javascript: document.forma.action=''; document.forma._botoncillo.value='todo'" class="filtro" />
  </td>
  <td align="right">
    <c:if test='${tabla.pagina > 1}'>
      <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='principio'; document.forma.n.value='1';">&laquo; Principio</a>&nbsp;
      <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='anterior'; document.forma.n.value='<c:out value="${tabla.pagina - 1}"/>';">&lsaquo; Anterior</a>
    </c:if>
    <b><c:out value="${(paginacion * (tabla.pagina - 1)) + 1}"/></b> - <b><c:out value="${(paginacion * (tabla.pagina - 1)) + fn:length(listaValoresPrimarios)}"/></b> de <b><c:out value="${totalRegistros}"/></b>
    <c:if test='${tabla.pagina < totalPaginas}'>
      <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='siguiente'; document.forma.n.value='<c:out value="${tabla.pagina + 1}"/>';">Siguiente &rsaquo;</a>&nbsp;
      <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma._botoncillo.value='final'; document.forma.n.value='<c:out value="${totalPaginas}"/>';">Final &raquo;</a>
    </c:if>
  </td>
</tr>
</table>

<table id="tabla" class="tabla">
  <tr></tr>
</table>

<table width="100%">
<tr>
  <td align="right">
    <c:if test='${tabla.pagina > 1}'>
      <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma.n.value='1';">&laquo; Principio</a>&nbsp;
      <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma.n.value='<c:out value="${tabla.pagina - 1}"/>';">&lsaquo; Anterior</a>
    </c:if>
    <b><c:out value="${(paginacion * (tabla.pagina - 1)) + 1}"/></b> - <b><c:out value="${(paginacion * (tabla.pagina - 1)) + fn:length(listaValoresPrimarios)}"/></b> de <b><c:out value="${totalRegistros}"/></b>
    <c:if test='${tabla.pagina < totalPaginas}'>
      <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma.n.value='<c:out value="${tabla.pagina + 1}"/>';">Siguiente &rsaquo;</a>&nbsp;
      <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action=''; document.forma.n.value='<c:out value="${totalPaginas}"/>';">Final &raquo;</a>
    </c:if>
  </td>
</tr>
</table>

<div class="nota"><sup>(1)</sup>Una de las tablas maestras (for&aacute;neas) no contiene un dato, al cual hace referencia el actual registro</div>

</form>
</body>

<script language="JavaScript">

//--------- función de definición del objeto
function objetoRegistros() {
  this.registro = new Array();
  this.campo_orden = '<c:out value="${listaNombresCampos[0].campo}"/>';
  this.tipo_orden = 'D';
}

//--------- función de definición del objeto para contener datos de cada registro
function registro(<c:forEach var="nombresCampos" items="${listaNombresCampos}"><c:out value="${nombresCampos.campo}"/>,</c:forEach>_yabe_prima_) {
  <c:forEach var="nombresCampos" items="${listaNombresCampos}">
  this.<c:out value="${nombresCampos.campo}"/> = <c:out value="${nombresCampos.campo}"/>;</c:forEach>
  this._yabe_prima_ = _yabe_prima_;
}

//--------- función de definición del método nuevoRegistro, para agregar instancias al array registro
objetoRegistros.prototype.nuevoRegistro = function(<c:forEach var="nombresCampos" items="${listaNombresCampos}"><c:out value="${nombresCampos.campo}"/>,</c:forEach>_yabe_prima_) {
  this.registro[this.registro.length] = new registro(<c:forEach var="nombresCampos" items="${listaNombresCampos}"><c:out value="${nombresCampos.campo}"/>,</c:forEach>_yabe_prima_);
}

objetoRegistros.prototype.ordenar = function() {
  var param = "return ", dato, orden;
//  for (var i = 0; i < arguments.length; i += 2) {
    dato = arguments[0];

    if (this.campo_orden == dato) {
      this.tipo_orden = (this.tipo_orden == 'D')? 'A' : 'D';
    } else {
      this.tipo_orden = 'A';
    }
    this.campo_orden = dato;

    orden = (this.tipo_orden == 'D')? 1 : -1;
    param += "(x." + dato + " < y." + dato + ")?" + orden + ":";
    param += "(x." + dato + " > y." + dato + ")?" + (0 - orden) + ":";
//  }
  param += "0;";
  this.registro.sort(new Function("x","y",param));
}

var registros = new objetoRegistros();
<c:forEach var="listaPrimarias" items="${listaValoresPrimarios}" varStatus="contador">
registros.nuevoRegistro(<c:forEach begin="0" end="${nro_campos - 1}" var="i">"<c:out value="${matrizDatos[contador.index][i]}" escapeXml="false"/>",</c:forEach>"<c:out value="${listaPrimarias.valores}"/>");</c:forEach>

function actualizar (url, llave) {
  forma  = document.getElementById('forma');
  codigo = document.getElementById('c');
  codigo.value = llave;
  forma.action = url;
}

objetoRegistros.prototype.mostrar = function() {
  var tablilla = document.getElementById('tabla');
  tablilla.removeChild(tablilla.lastChild);
  cuerpillo = document.createElement("TBODY");

  encabezado = document.createElement("TR");
  numero = document.createElement("TH");
  numero.appendChild(document.createTextNode('Nro'));
  encabezado.appendChild(numero);
  <c:forEach var="nombresCampos" items="${listaNombresCampos}">
    enlace = document.createElement("A");
    enlace.href = "javascript: ;";
    enlace.setAttribute("onClick", "registros.ordenar('<c:out value="${nombresCampos.campo}"/>'); registros.mostrar()");
    enlace.appendChild(document.createTextNode('<c:out value="${nombresCampos.etiqueta}"/>'));
    celdita = document.createElement("TH");
    celdita.appendChild(enlace);
    if (this.campo_orden == '<c:out value="${nombresCampos.campo}"/>') {
      dibujito = document.createElement("IMG");
      dibujito.src = (this.tipo_orden == 'D')? '../imagenes/dibRap/descendente.gif' : '../imagenes/dibRap/ascendente.gif';
      celdita.appendChild(dibujito);
      celdita.setAttribute("nowrap", "nowrap");
    }
    encabezado.appendChild(celdita);
  </c:forEach>
  <c:if test='${fn:indexOf(permiso, "m") > -1}'>
    celdita = document.createElement("TH");
    celdita.appendChild(document.createTextNode('MODIFICAR'));
    encabezado.appendChild(celdita);
  </c:if>
  <c:if test='${fn:indexOf(permiso, "b") > -1}'>
    celdita = document.createElement("TH");
    celdita.appendChild(document.createTextNode('ELIMINAR'));
    encabezado.appendChild(celdita);
  </c:if>
  cuerpillo.appendChild(encabezado);

  for (var i = 0; i < this.registro.length; i++) {
    fililla = document.createElement("TR");
    if ((i - (Math.floor(i / 2) * 2)) == 1) {
      fililla.setAttribute("bgColor", "#FFFFD9");
    }
    fililla.setAttribute("onMouseOut", "this.className=''");
    fililla.setAttribute("onMouseOver", "this.className='sobreFila'");
    nro = document.createElement("TD");
    nro.align = "right";
    valor = document.createTextNode(<c:out value="${(paginacion * (tabla.pagina - 1)) + 1}"/> + i);
    nro.appendChild(valor);
    fililla.appendChild(nro);
    <c:forEach var="nombresCampos" items="${listaNombresCampos}">
      celdilla = document.createElement("TD");
      textillo = document.createTextNode(this.registro[i].<c:out value="${nombresCampos.campo}"/>);
      celdilla.appendChild(textillo);
      fililla.appendChild(celdilla);
    </c:forEach>
    <c:if test='${fn:indexOf(permiso, "m") > -1}'>
      celdilla = document.createElement("TD");
      seccion = document.createElement("DIV");
      seccion.className = "modificar";
      enlace = document.createElement("A");
      enlace.href = "javascript: document.forma.submit()";
      enlace.setAttribute("onClick", "actualizar('<c:url value="/dibRap/modificaRegistro.fautapo"/>', '" + this.registro[i]._yabe_prima_ + "')");
      enlace.appendChild(document.createTextNode('Modificar'));
      seccion.appendChild(enlace);
      celdilla.appendChild(seccion);
      fililla.appendChild(celdilla);
    </c:if>
    <c:if test='${fn:indexOf(permiso, "b") > -1}'>
      celdilla = document.createElement("TD");
      seccion = document.createElement("DIV");
      seccion.className = "eliminar";
      enlace = document.createElement("A");
      enlace.href = "javascript: document.forma.submit()";
      enlace.setAttribute("onClick", "actualizar('<c:url value="/dibRap/confirmarBorrado.fautapo"/>', '" + this.registro[i]._yabe_prima_ + "')");
      enlace.appendChild(document.createTextNode('Eliminar'));
      seccion.appendChild(enlace);
      celdilla.appendChild(seccion);
      fililla.appendChild(celdilla);
    </c:if>
    cuerpillo.appendChild(fililla);
  }
  tablilla.appendChild(cuerpillo);
}

</script>

<%@ include file="../Inferior.jsp" %>