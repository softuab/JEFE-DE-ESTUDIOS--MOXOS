<%@ include file="../Superior.jsp" %></body>

<script language="JavaScript">
var vConceptos=new Array();
<c:forEach var="lConcepto" items="${lConceptos}" varStatus="contador">
  vConceptos.push(new Array(<c:out value="${lConcepto.id_perfil_concepto}"/>, "<c:out value="${lConcepto.concepto}"/>", <c:out value="${lConcepto.costo}"/>));
</c:forEach>
var vCarrito=new Array();
var combo;

function setBorrarCombo(){
  combo.length=0;
}
function estaElegido(id){
  var esta=false;
  var i=0;
  while(!esta && i<vCarrito.length){
    esta=(vCarrito[i][1]==id);
    i++;
  }
  return esta;
}
function setDibujarConceptos(){
  setBorrarCombo();
  for(var i=0;i<vConceptos.length;i++)
    if(!estaElegido(vConceptos[i][0]))
      combo.options[combo.length]=new Option(vConceptos[i][1],vConceptos[i][0]);
}
function getCostoConcepto(id){
  var esta=false;
  var i=0;
  while(!esta && i<vConceptos.length){
    esta=(vConceptos[i][0]==id);
    i++;
  }
  return vConceptos[i-1][2];
}
function setEliminarCarrito(id){
  var esta=false;
  var i=0;
  while(!esta && i<vCarrito.length){
    if(vCarrito[i][1]==id){
      vCarrito.splice(i,1);
      esta=true;
    }
    i++;
  }
  setDibujarConceptos();
  setDibujarCarrito();
}
function setDibujarCarrito(){
  var html='<table class="tabla"><tr><th>Cantidad</th><th>Concepto</th><th>Costo</th><th>Total</th><th>Eliminar</th></tr>';
  var total=0.0;
  for(var i=0;i<vCarrito.length;i++){
    html+='<tr><td align="right">'+vCarrito[i][0]+'</td><td>'+vCarrito[i][2]+'</td><td align="right">'+vCarrito[i][3]+'</td><td align="right">'+
          (vCarrito[i][0]*vCarrito[i][3])+'</td><td><a href="#" onClick="setEliminarCarrito('+vCarrito[i][1]+')">Eliminar</a></td></tr>';
    total+=(vCarrito[i][0]*vCarrito[i][3]);
    html+='<input type="hidden" name="id_perfil_concepto" value="'+vCarrito[i][1]+'">';
    html+='<input type="hidden" name="cantidades" value="'+vCarrito[i][0]+'">';
  }
  html+='<tr><th colspan="3">TOTAL</th><th align="right">'+total+'</th></tr></table>';
  document.getElementById('carrito').innerHTML=html;
}
function setAgregarCarrito(){
  var cantidad=document.getElementById('cantidad');
  var valor=cantidad.value;
  if (valor > 0){
    vCarrito.push(new Array(valor,combo.options[combo.selectedIndex].value,combo.options[combo.selectedIndex].innerHTML,getCostoConcepto(combo.options[combo.selectedIndex].value)));
    setDibujarConceptos();
    setDibujarCarrito();
    cantidad.value=1;
  }else alert("Coloque una cantidad mayor a 0 (cero).");
  cantidad.focus();
  cantidad.select();
}
function setRegistrar(){
  if (vCarrito.length>0) document.forma.submit();
  else alert("Tienes que elegir algun concepto.");
}
</script>

<body onLoad="combo=document.getElementById('conceptos'); setDibujarConceptos();">
<div class="titulo">Venta de valores</div>
<br>
<form name="forma" method="post" action="registrarTransaccion.fautapo">
  Elija ::
  <input type="text" id="cantidad" value="1" size="3">
  <select id="conceptos"></select>
  <input type="button" value="Agregar" onClick="setAgregarCarrito()">
  <br>
  <br>
  <div id="carrito"><table class="tabla"><tr><th>Cantidad</th><th>Concepto</th><th>Costo</th><th>Total</th><th>Eliminar</th></tr></table></div>
  <input type="button" value="Registrar" onClick="setRegistrar()">
  <div id="valores"></div>
</form>

<%@ include file="../Inferior.jsp" %>