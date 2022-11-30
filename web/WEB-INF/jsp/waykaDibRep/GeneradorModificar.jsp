<%@ include file="../Superior.jsp" %>

<script language="javascript" type="text/javascript" src="./tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript">
tinyMCE.init({
mode : "textareas",
theme : "advanced",

plugins : "style,layer,table,save,advhr,advimage,advlink,insertdatetime,preview,searchreplace,contextmenu,paste,directionality,fullscreen,noneditable",
theme_advanced_buttons1_add_before : "newdocument,separator",
theme_advanced_buttons1_add : "fontselect,fontsizeselect",
theme_advanced_buttons2_add : "separator,insertdate,inserttime,preview,separator,forecolor,backcolor",
theme_advanced_buttons2_add_before: "cut,copy,paste,pastetext,pasteword,separator,search,replace,separator",
theme_advanced_buttons3_add_before : "tablecontrols,separator",
theme_advanced_buttons3_add : "iespell,advhr,separator,ltr,rtl,separator,fullscreen",
theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops",
theme_advanced_toolbar_location : "top",
theme_advanced_toolbar_align : "left",
theme_advanced_path_location : "bottom",
content_css : "example_full.css",
    plugin_insertdate_dateFormat : "%d-%m-%Y",
    plugin_insertdate_timeFormat : "%H:%M:%S",
extended_valid_elements : "hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]",
external_link_list_url : "example_link_list.js",
external_image_list_url : "example_image_list.js",
flash_external_list_url : "example_flash_list.js",
file_browser_callback : "fileBrowserCallBack",
theme_advanced_resize_horizontal : false,
theme_advanced_resizing : true
});

function fileBrowserCallBack(field_name, url, type, win) {
// This is where you insert your custom filebrowser logic
alert("Example of filebrowser callback: field_name: " + field_name + ", url: " + url + ", type: " + type);

// Insert new URL, this would normaly be done in a popup
win.document.forms[0].elements[field_name].value = "someurl.htm";
}
</script>

<div class="titulo">MODIFICAR REPORTES</div>
<br>
<br>
<body onLoad="marcar();">
<form name='forma' method=post>

<table class="formulario" width='100%'>
  <tr >
    <th width='70%'>Titulo</th><th width='30%'>Opciones</th>
  <tr>
    <td>
      <textarea id="titulo" name="titulo" rows="15" cols="80" style="width: 100%"><c:out value="${consulta.titulo}" escapeXml="False" /></textarea>
    </td>
    <td class='etiqueta_izq'>
        <input type="text"  id='limite' name='limite' value='<c:out value="${limite}" />' size='4' onKeyPress="return aceptaNumeros(event)">LIMITE REGISTROS<br>
        <input type="checkbox" id='glosa' name='glosa' value='glosa' <c:if test='${consulta.glosa}'>checked </c:if>>PONER GLOSA DINAMICA<br>
        <input type="checkbox" id='orden' name='orden' value='si' onChange='activar_orden()'>POR ORDEN DEFINIDO<br>
        <input type="checkbox" id='contar_reg' name='contar_reg' value='si' >AGRUPAR REGISTROS PARECIDOS<br>
        <input type='radio' name='_suma'  id='_suma1' value='suma_jsp' onClick='_sumar_con(this)'>SUMA SUBTOTAL X ENCABEZADOS<br>
        <input type='radio' name='_suma'  id='_suma2' value='suma_java' checked onClick='_sumar_con(this)'>SUMA TOTAL
  
    </td>

<tr>
    <td class='etiqueta_izq' colspan='2'>
      DESCRIPCION:: <input type="text" name='descripcion' value='<c:out value="${consulta.descripcion}" />'size='50'> 
    </td>
</tr>
<tr>
  <td class='etiqueta_izq' colspan='2'>
      <SELECT NAME='id_tabla'>
        <OPTION value="0">--Elegir Tabla--</OPTION>
        <c:forEach var="ListadoTablas" items="${listadoTablas}">
          <OPTION value='<c:out value="${ListadoTablas.id_tabla}" />' >
            <c:out value="${ListadoTablas.etiqueta}"/>
          </OPTION>
        </c:forEach>
      </SELECT>
  </td>
</tr>
<tr class='etiqueta_izq'>
   <td align='top'> 
     <input type=submit value='Agregar' name='boton' OnClick='javascript: document.forma.target=""; document.forma.action="<c:url value='/dibRep.fautapo'/>";'>
   </td>
   <td align='top'> 
     <INPUT type="radio" name='op' value="PDF"> PDF <INPUT type="radio" name='op' value="HTML" checked> HTML
   </td>
 </tr>
</table>

<br/>
<c:if test="${!empty tablas_dibrep}">
  <h4>Tablas</h4>
  <br/>
      <table class='tabla'>
        <c:forEach var="tablas" items="${tablas_dibrep}" varStatus="contador1">	
          <tr>
            <th align="middle">
	      <div class="clave">
	        <c:out value="${tablas.etiqueta}" /><br>
		<c:if test="${contador1.last}">
                  <input type=submit value='Borrar' name='boton' OnClick='javascript: document.forma.target=""; document.forma.action="<c:url value='/dibRep.fautapo'><c:param name="b" value="${tablas.id_tabla}"/></c:url>";'>
	        </c:if>
		<input type="hidden" name='tabla_<c:out value="${tablas.alias}" />' value='<c:out value="${tablas.id_tabla}"/>' >
	      </div>
	    </th>
	    <td align="left">
	  
	  <c:if test="${!empty tablas.campos_dibrep}">
	    <table class="tabla">
	        <tr>
                  <th><div class="clave">Ver Campos</div></th>
                  <th><div class="clave">Condicion</div></th>
                  <th><div class="clave"> Variable?</div></th>
                  <th><div class="clave" align="center">Suma<br>subtotal</div></th>
                  <th><div class="clave" align="center">Suma<br>Total</div></th>
                  <th><div class="clave">Encabezado<br>principales</div></th> 
                  <th><div class="clave">Orden<br>definido</div></th>
                <tr>
	      <c:forEach var="campos" items="${tablas.campos_dibrep}" varStatus="contador2">
                <tr>
		  <c:if test="${campos.id_campo_foraneo == null }">
	            <td class="textoEncabezado" align="left"> <input type="checkbox" name="id_campos" value="<c:out value='${tablas.alias}'/>_<c:out value='${campos.id_campo}'/>" onChange='activar_check("<c:out value='${tablas.alias}'/>_<c:out value='${campos.id_campo}'/>", "<c:out value='${campos.tipo_dato}'/>")' > <c:out value="${campos.etiqueta}"/> </td>
                  </c:if>
		  <c:if test="${campos.id_campo_foraneo != null }">
	            <td class="textoEncabezado" align="left"><input type="checkbox" disabled> <c:out value="${campos.etiqueta}"/> </td>
                  </c:if>
		    
		  <!--  INICIO JOJO  -->
                  <td  class="textoEncabezado" align="left">
		    <select id='condicion_<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' name='condicion_<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >
		      <option value="=" selected> = </option>
		      <option value=">"> > </option>
		      <option value="<"> < </option>
		      <option value="<>"> <> </option>
                      <option value="<="> <= </option>
                      <option value=">="> >= </option>
		    </select>
		  <c:if test="${!empty campos.combo}">
	            <SELECT id='campo_<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' NAME='campo_<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' class="colb">
                      <c:forEach var="combo" items="${campos.combo}">
                        <OPTION value='<c:out value="${combo.id_campo}" />'>
	                  <c:out value="${combo.campo}"/>
	                </OPTION>
                      </c:forEach>
                    </SELECT>
	          </c:if>
                 <c:if test="${empty campos.combo}">
		    <input type="text" name='campo_<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >
	         </c:if>
		 </td>
                 <!--  FIN JOJO  -->
		 <td class="textoEncabezado" align="center"><input type="checkbox" name="variables"  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' ></td>
		 
	        <c:if test="${campos.tipo_dato == 'dreal'}">
	          <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar_st" disabled value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
	          <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar"   value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
	        </c:if>
	        <c:if test="${campos.tipo_dato != 'dreal'}">
	          <c:if test="${campos.tipo_dato == 'dentero2'}">
	            <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar_st"  disabled value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
     	            <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar"  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
	          </c:if> 
	          <c:if test="${campos.tipo_dato != 'dentero2'}">
		    <c:if test="${campos.tipo_dato == 'dreal2'}">
	              <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar_st" disabled  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
     	              <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar"  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
		    </c:if>
		    <c:if test="${campos.tipo_dato != 'dreal2'}">
  		      <c:if test="${campos.tipo_dato == 'dreal3'}">
	                <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar_st" disabled  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
     	                <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar"  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
		      </c:if>
		      <c:if test="${campos.tipo_dato != 'dreal3'}">
	                <c:if test="${campos.tipo_dato == 'dentero3'}">
	                  <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar_st" disabled  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
     	                  <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar"  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
     		        </c:if>
	                <c:if test="${campos.tipo_dato != 'dentero3'}">
	                  <c:if test="${campos.tipo_dato == 'dentero4'}">
	                    <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar_st" disabled  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
     	                    <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar"  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
                          </c:if>
			  <c:if test="${campos.tipo_dato != 'dentero4'}">
			    <c:if test="${campos.tipo_dato == 'dmoneda'}">
	                      <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar_st" disabled  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
     	                      <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar"  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
			    </c:if>
			    
			    <c:if test="${campos.tipo_dato != 'dmoneda'}">
                              <c:if test="${campos.tipo_dato == 'dmoneda2'}"> 
	                        <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar_st" disabled  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
     	                        <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar"  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
			      </c:if>			      
			      <c:if test="${campos.tipo_dato != 'dmoneda2'}"> 
			        <c:if test="${campos.tipo_dato == 'dmoneda3'}"> 
	                          <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar_st" disabled  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
     	                          <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar"  value='<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >  </td>
			        </c:if>			      
			        <c:if test="${campos.tipo_dato != 'dmoneda3'}"> 
	                          <td class="textoEncabezado" align="center"><input type="checkbox" disabled> </td>
	                          <td class="textoEncabezado" align="center"><input type="checkbox" disabled> </td>
			        </c:if>			      
			      </c:if>
			    </c:if>			  
			  </c:if>
			</c:if>
		      </c:if>
		    </c:if>
		  </c:if>
		</c:if> 

                <td class="textoEncabezado" align="center"> <input type="checkbox" name="cabezas" value="<c:out value='${tablas.alias}'/>_<c:out value='${campos.id_campo}'/>"> </td>
                <td class="textoEncabezado" align="center"> <input type="text" name="orden_<c:out value='${tablas.alias}'/>_<c:out value='${campos.id_campo}'/>"  size='2' disabled  onKeyPress="return aceptaNumeros(event)"> </td>
               </tr>
	      </c:forEach>
	      </table>
	    </c:if>
	    </td>
          </tr>
        </c:forEach>
	  <tr>
	  <td colspan='2'> Campo Calculado::<input type='text' name='campo_calculado' value="<c:out value='${campos_calculados}' />" size='50'>Etiqueta::<input type='text' name='campo_calculado_etiqueta' value="<c:out value='${campos_calculados_etiquetas}' />"  size='25'></td>
          <tr>
            <td align="left">
              <input type=submit value='Listar' name='boton' OnClick='javascript: document.forma.target="_blank"; document.forma.action=" <c:url value='/dibRep1.fautapo'/>";'>
	    </td>
	    <td align="right">
              <input type=submit value='Guardar' name='boton' OnClick='javascript: document.forma.target=""; document.forma.action="<c:url value='/dibRep2.fautapo'/>";'>
            </td>
         </tr>
      </table>

  <input type="hidden" name='t' value='<c:out value="${t}"/>' >
  <input type="hidden" name='c' value='<c:out value="${consulta.id_consulta}"/>' >
</c:if>
</form>



<script>
  var nav4 = window.Event ? true : false;
  
  function aceptaNumeros(evt) {
    var key = nav4 ? evt.which : evt.keyCode;
    return (key <= 13 || (key >= 48 && key <= 57));
  }
  
  var ordenes = new Array();
  h=0;
  <c:forEach var="tablas" items="${tablas_dibrep}" varStatus="contador1">
    <c:forEach var="campos" items="${tablas.campos_dibrep}" varStatus="contador2">
      ordenes[h]="<c:out value='${tablas.alias}'/>_<c:out value='${campos.id_campo}'/>";
      h++;
    </c:forEach>
  </c:forEach>

new Array("<c:out value='${combo.id_campo}'/>","<c:out value='${combo.campo}'/>","<c:out value='${combo.campo_padre}'/>");
  
  var campos_marcados = new Array();
  k=0;
  <c:forEach var="campos_marcados1" items="${campos_marcados}" varStatus="contador1">     
    campos_marcados[k]= new Array("<c:out value='${campos_marcados1.alias}'/>_<c:out value='${campos_marcados1.id_campo}'/>","<c:out value='${campos_marcados1.orden}'/>");
    k++;
  </c:forEach>



  var campos_sumas_marcados = new Array();
  l=0;
  <c:forEach var="campos_sumas_marcados1" items="${campos_sumas_marcados}" varStatus="contador1">     
    campos_sumas_marcados[l]=new Array("<c:out value='${campos_sumas_marcados1.alias}'/>_<c:out value='${campos_sumas_marcados1.id_campo}'/>","<c:out value='${campos_sumas_marcados1.orden}'/>");
    l++;
  </c:forEach>

  var campos_variables_marcados = new Array();
  m=0;
  <c:forEach var="campos_variables_marcados1" items="${campos_variables_marcados}" varStatus="contador1">     
    campos_variables_marcados[m]="<c:out value='${campos_variables_marcados1.alias}'/>_<c:out value='${campos_variables_marcados1.id_campo}'/>";
    m++;
  </c:forEach>
  

  var campos_cabezas_marcados = new Array();
  cab=0;
  <c:forEach var="campos_cabezas_marcados" items="${lista_cabezas}" varStatus="contador1">     
    campos_cabezas_marcados[cab]="<c:out value='${lista_cabezas[contador1.index]}'/>";
    cab++;
  </c:forEach>

  var campos_sumas_st_marcados = new Array();
  su=0;
  <c:forEach var="campos_sumas_st_marcados" items="${lista_sumas_st}" varStatus="contador1">     
    campos_sumas_st_marcados[su]="<c:out value='${lista_sumas_st[contador1.index]}'/>";
    su++;
  </c:forEach>

  
  

  function activar_orden(){
    var orden = document.getElementById('orden');
    for(i=0; i<ordenes.length; i++){
      var caja_orden = document.getElementsByName("orden_" + ordenes[i])[0];
      if(orden.checked) {
        caja_orden.disabled=false;
      } else {
        caja_orden.disabled=true;
      }
    } 
  }


  function activar_check(nombre, tipo) {
    var orden = document.getElementById('orden');
    for(i=0; i<ordenes.length; i++){
      var caja_orden = document.getElementsByName("orden_" + ordenes[i])[0];
      if(orden.checked) {
        caja_orden.disabled=false;
      } else {
        caja_orden.disabled=true;
      }
    } 
  }

  function _sumar_con(objeto) {
    var sumar_st=document.getElementsByName('sumar_st');
    var sumar = document.getElementsByName('sumar');
    var contar_reg=document.getElementById('contar_reg');
    if (objeto.value=='suma_jsp') {
      cant = sumar_st.length;
      for(i=0;i<cant;i++){        
         sumar_st[i].disabled=false;
         sumar[i].disabled=true;
         contar_reg.disabled=true;
      }
    } else {
      cant = sumar.length;
      for(i=0;i<cant;i++) {        
        sumar_st[i].disabled=true;
        sumar[i].disabled=false;
	contar_reg.disabled=false;
      }    
    }
  }
  
  function marcar_campos() {
    var campo_marcado = document.getElementsByName('id_campos');
    for(i=0; i< campo_marcado.length; i++){
      var campo = document.getElementsByName('id_campos')[i];
      for (j=0; j<campos_marcados.length; j++) { 
        var orden = document.getElementsByName('orden_' + campos_marcados[j][0])[0];      
        if(campos_marcados[j][0]==campo.value) {
          campo.checked=true;
	  orden.value = campos_marcados[j][1];
          break;
	} 
      }
    }    
  }


  function marcar_sumas_campos(){

    var campo_suma_marcado = document.getElementsByName('sumar');

    for(i=0; i< campo_suma_marcado.length; i++){
      var campo1 = document.getElementsByName('sumar')[i];
      for (j=0; j<campos_sumas_marcados.length; j++){ 
        var orden1 = document.getElementsByName('orden_' + campos_sumas_marcados[j][0])[0];      
        if(campos_sumas_marcados[j][0]==campo1.value) {
          campo1.checked=true;
	  orden1.value= campos_sumas_marcados[j][1];
          break;
	} 
      }
    } 
  }
  

  function marcar_campos_variables() {
    var campos_variables = document.getElementsByName('variables'); 
    for(i=0; i< campos_variables.length; i++){
      campo_variable = document.getElementsByName('variables')[i]; 
      for(j=0; j< campos_variables_marcados.length; j++){
        if(campos_variables_marcados[j] == campo_variable.value)
          campo_variable.checked=true;      
      }        
    } 
  }




  function marcar_sumas_st_campos() {
    var campo_suma_marcado = document.getElementsByName('sumar_st');
    for(i=0; i< campo_suma_marcado.length; i++){
      var campo1 = document.getElementsByName('sumar_st')[i];
      for (j=0; j<campos_sumas_st_marcados.length; j++){ 
        if(campos_sumas_st_marcados[j]==campo1.value) {
          campo1.checked=true;
          break;
	} 
      }
    } 
  }


  function marcar_cabezas_campos() {
    var campo_cabeza_marcado = document.getElementsByName('cabezas');
    for(i=0; i< campo_cabeza_marcado.length; i++){
      var campo1 = document.getElementsByName('cabezas')[i];
      for (j=0; j<campos_cabezas_marcados.length; j++){ 
        if(campos_cabezas_marcados[j]==campo1.value) {
          campo1.checked=true;
          break;
	} 
      }
    } 
  }

  function marca_count(){
  count ='<c:out value="${count}" />';
    if (count =='0'){
      var contar_reg=document.getElementById('contar_reg');
      contar_reg.enabled=true;
      contar_reg.checked=true;    
    }
  }
  
  var campos_condiciones_marcados = new Array();
  k1=0;
  <c:if test="${campos_condiciones_marcados != null}"> 
  <c:forEach var="campos_condiciones_marcados1" items="${campos_condiciones_marcados}" varStatus="contador1">     
    campos_condiciones_marcados[k1]= new Array("<c:out value='${campos_condiciones_marcados1.campo}' />","<c:out value='${campos_condiciones_marcados1.condicion}' escapeXml='false' />","<c:out value='${campos_condiciones_marcados1.valores}' />");
    k1++;
  </c:forEach>
  </c:if>

    function marcar_campos_condiciones() {
      if (k1>0) {
        for(i=0; i< campos_condiciones_marcados.length; i++) {
          var campo = document.getElementById('campo_' + campos_condiciones_marcados[i][0]);
	  if(campo.type=='select-one')
	    for (kk=0; kk< campo.options.length; kk++) {
	      if (campo.options[kk].value==campos_condiciones_marcados[i][2]){
	      campo.options[kk].selected=true;
	      break;
	      }    
	    }
	  else 
             campo.value = campos_condiciones_marcados[i][2];
	  
	  var campoCondicion = document.getElementById('condicion_' + campos_condiciones_marcados[i][0]);
	    for (kk=0; kk< campoCondicion.options.length; kk++)
	      if (campoCondicion.options[kk].value==campos_condiciones_marcados[i][1]) {
	        campoCondicion.options[kk].selected=true;
	        break;
	      }    
	}
      }
    }
  
  
  
  
  
  
  
  
  function marcar() {
    var orden = document.getElementById('orden');
    orden.checked=true; 
    activar_orden();  
    marcar_campos();

    marcar_sumas_campos();
    marca_count();
    marcar_campos_variables();
    marcar_cabezas_campos();
    if (campos_sumas_st_marcados[0]!=''){
      var obj2 =document.getElementById('_suma2');      
      obj2.checked=false;
      var obj1 =document.getElementById('_suma1');
      obj1.checked=true;
      _sumar_con(obj1);
      marcar_sumas_st_campos();
    }
    marcar_campos_condiciones();
  }
  
</script>
</body>
<%@ include file="../Inferior.jsp" %>