<%@ include file="../Superior.jsp" %>
<c:if test="${!empty c}">
  <div class="titulo">MODIFICAR REPORTES</div>
</c:if>
<c:if test="${empty c}">
  <div class="titulo">GENERADOR DE REPORTES</div>
</c:if>


<br>
<br>
<body OnLoad="cargar_marcados();">
<form name='forma' method=post>

<table class="formulario" width='100%'>
  <tr >
    <th width='70%'>Titulo</th><th width='30%'>Opciones</th>
 <tr>
    <td>
      <label class="etiqueta"><textarea name='descripcion'  cols="60%" rows='2' ><c:out value='${descripcion}' /></textarea></label>
    </td>
    <td  rowspan="2">
        <input type='text' id='paginacion' name='paginacion' value='50' size='4' onKeyPress="return aceptaNumeros(event)"><label class="etiqueta">PAGINACION PDF</label><br>
        <input type="text" id='limite' name='limite' value='<c:out value="${limite}" />' size='4' onKeyPress="return aceptaNumeros(event)"><label class="etiqueta">LIMITE REGISTROS</label><br>
        <input type="checkbox" id='glosa' name='glosa' value='si'><label class="etiqueta">PONER GLOSA DINAMICA<br>
        <input type="checkbox" id='orden' name='orden' value='si' onChange='activar_orden()'><label class="etiqueta">POR ORDEN DEFINIDO</label><br>
        <input type="checkbox" id='contar_reg' name='contar_reg' value='si' ><label class="etiqueta">AGRUPAR REGISTROS PARECIDOS</label><br>
        <input type='radio' name='_suma'  id='_suma1' value='suma_jsp' onClick='_sumar_con(this)'><label class="etiqueta">SUMA SUBTOTAL X ENCABEZADOS</label><br>
        <input type='radio' name='_suma'  id='_suma2' value='suma_java' checked onClick='_sumar_con(this)'><label class="etiqueta">SUMA TOTAL</label>
    </td>
<tr>
  <td>
    <fieldset>
      <legend class="etiqueta">Adicionar tablas a reporte<legend>
      <table>
        <tr>
          <td>
            <SELECT NAME='id_tabla'>
              <OPTION value="0">--Elegir Tabla--</OPTION>
                <c:forEach var="ListadoTablas" items="${listadoTablas}">
                  <OPTION value='<c:out value="${ListadoTablas.id_tabla}" />' >
                    <c:out value="${ListadoTablas.etiqueta}"/>
                  </OPTION>
                </c:forEach>
            </SELECT>
          </td>
        <tr>
          <td > 
            <input type=submit class="agregar" value='Agregar' name='boton' OnClick='javascript: document.forma.target=""; document.forma.action="<c:url value='/dibRep.fautapo'/>";'>
          </td>
        </tr>   
     </table>
    </fieldset>
</tr>
<tr class='etiqueta_izq'>
   <td align='top'> 
     <INPUT type="radio" name='op' value="EXCEL"><label class="etiqueta">  EXCEL</label> <INPUT type="radio" name='op' value="PDF"><label class="etiqueta">  PDF </label><INPUT type="radio" name='op' value="HTML" checked> <label class="etiqueta"> HTML </label></label>
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
		      <option value="="> = </option>
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
		    <input type="text" id='campo_<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' name='campo_<c:out value="${tablas.alias}"/>_<c:out value="${campos.id_campo}"/>' >
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
                <td class="textoEncabezado" align="center"> <input type="text" id="orden_<c:out value='${tablas.alias}'/>_<c:out value='${campos.id_campo}'/>" name="orden_<c:out value='${tablas.alias}'/>_<c:out value='${campos.id_campo}'/>"  size='2' disabled  onKeyPress="return aceptaNumeros(event)"> </td>
               </tr>
	      </c:forEach>
	      </table>
	    </c:if>
	    </td>
          </tr>
        </c:forEach>
	  <tr>
	  <td colspan='2'> Campo Calculado::<input type='text' id='campo_calculado' name='campo_calculado' value='<c:out value="${campo_calculado}" />' size='50'>Etiqueta::<input type='text' id='campo_calculado_etiqueta' name='campo_calculado_etiqueta' value='<c:out value="${campo_calculado_etiqueta}" />' size='25'></td>
          <tr>
            <td align="left">
              <input type=submit value='Listar' name='boton' OnClick='javascript: document.forma.target="_blank"; document.forma.action="<c:url value='/dibRep1.fautapo'/>";'>
	    </td>
	    <td align="right">
              <input type=submit value='Guardar' name='boton' OnClick='javascript: document.forma.target=""; document.forma.action="<c:url value='/dibRep2.fautapo'/>";'>
            </td>
         </tr>
      </table>

  <input type="hidden" name='t' value='<c:out value="${t}"/>' >
  <input type="hidden" name='c' value='<c:out value="${c}"/>' >
</c:if>
  <input type="hidden" name='ruta' value="<c:url value='/'/>" >

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
  
  //---------------------RECUPERAR VALORES

  var campos_marcados = new Array();
  k=0;
  <c:if test="${campos_marcados != null}"> 
  <c:forEach var="campos_marcados1" items="${campos_marcados}" varStatus="contador1">     
    campos_marcados[k]= "<c:out value='${campos_marcados1.campo}' />";
    k++;
  </c:forEach>
  </c:if>

    function marcar_campos() {
      if (k>0){
        var campo_marcado = document.getElementsByName('id_campos');
        for(i=0; i< campo_marcado.length; i++){
          var campo = document.getElementsByName('id_campos')[i];
	  //alert(i + "  -- " + campo.value + "--" + campos_);
          for(j=0; j< campos_marcados.length; j++) {
            if(campos_marcados[j]==campo.value) {
              campo.checked=true;
	      break;
	    } 
          }
	}
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


  var campos_variables_marcados = new Array();
  k2=0;
  <c:if test="${campos_variables_marcados != null}"> 
  <c:forEach var="campos_variables_marcados1" items="${campos_variables_marcados}" varStatus="contador1">     
    campos_variables_marcados[k2]="<c:out value='${campos_variables_marcados1.campo}' />";
    k2++;
  </c:forEach>
  </c:if>

    function marcar_campos_variables() {
      if (k2>0){
        var campo_variable_marcado = document.getElementsByName('variables');
        for(i=0; i< campo_variable_marcado.length; i++){
          var campo = document.getElementsByName('variables')[i];
	  //alert(i + "  -- " + campo.value + "--" + campos_);
          for(j=0; j< campos_variables_marcados.length; j++) {
            if(campos_variables_marcados[j]==campo.value) {
              campo.checked=true;
	      break;
	    } 
          }
	}
      }
    }


  var campos_sumas_st_marcados = new Array();
  k3=0;
  <c:if test="${campos_sumas_st_marcados != null}"> 
  <c:forEach var="campos_sumas_st_marcados1" items="${campos_sumas_st_marcados}" varStatus="contador1">     
    campos_sumas_st_marcados[k3]="<c:out value='${campos_sumas_st_marcados1.campo}' />";
    k3++;
  </c:forEach>
  </c:if>

    function marcar_campos_sumas_st() {
      if (k3>0){
        var campo_suma_st_marcado = document.getElementsByName('sumar_st');
        for(i=0; i< campo_suma_st_marcado.length; i++){
          var campo = document.getElementsByName('sumar_st')[i];
	  //alert(i + "  -- " + campo.value + "--" + campos_);
          for(j=0; j< campos_sumas_st_marcados.length; j++) {
            if(campos_sumas_st_marcados[j]==campo.value) {
              campo.checked=true;
	      break;
	    } 
          }
	}
      }
    }


  var campos_sumas_marcados = new Array();
  k4=0;
  <c:if test="${campos_sumas_marcados != null}"> 
  <c:forEach var="campos_sumas_marcados1" items="${campos_sumas_marcados}" varStatus="contador1">     
    campos_sumas_marcados[k4]="<c:out value='${campos_sumas_marcados1.campo}' />";
    k4++;
  </c:forEach>
  </c:if>

    function marcar_campos_sumas() {
      if (k4>0){
        var campo_suma_marcado = document.getElementsByName('sumar');
        for(i=0; i< campo_suma_marcado.length; i++){
          var campo = document.getElementsByName('sumar')[i];
	  //alert(i + "  -- " + campo.value + "--" + campos_);
          for(j=0; j< campos_sumas_marcados.length; j++) {
            if(campos_sumas_marcados[j]==campo.value) {
              campo.checked=true;
	      break;
	    } 
          }
	}
      }
    }

  var campos_cabezas_marcados = new Array();
  k5=0;
  <c:if test="${campos_cabezas_marcados != null}"> 
  <c:forEach var="campos_cabezas_marcados1" items="${campos_cabezas_marcados}" varStatus="contador1">     
    campos_cabezas_marcados[k5]="<c:out value='${campos_cabezas_marcados1.campo}' />";
    k5++;
  </c:forEach>
  </c:if>

    function marcar_campos_cabezas() {
      if (k5>0){
        var campo_cabeza_marcado = document.getElementsByName('cabezas');
        for(i=0; i< campo_cabeza_marcado.length; i++){
          var campo = document.getElementsByName('cabezas')[i];
	  //alert(i + "  -- " + campo.value + "--" + campos_);
          for(j=0; j< campos_cabezas_marcados.length; j++) {
            if(campos_cabezas_marcados[j]==campo.value) {
              campo.checked=true;
	      break;
	    } 
          }
	}
      }
    }



  var campos_orden_marcados = new Array();
  k6=0;
  <c:if test="${campos_orden_marcados != null}"> 
  <c:forEach var="campos_orden_marcados1" items="${campos_orden_marcados}" varStatus="contador1">     
    campos_orden_marcados[k6]= new Array("<c:out value='${campos_orden_marcados1.campo}' />","<c:out value='${campos_orden_marcados1.valores}' />");
    k6++;
  </c:forEach>
  </c:if>

  function marcar_campos_orden() {
      if (k6>0) {
        for(i=0; i< campos_orden_marcados.length; i++) {
          var campo = document.getElementById(campos_orden_marcados[i][0]);
	      campo.value = campos_orden_marcados[i][1];        
        }
      }    
  }






   function marcar_opciones(){
     var glosa = document.getElementById('glosa');
     glosa1 = '<c:out value="${glosa}" escapeXml="false" />';
     if (glosa1=='si')
       glosa.checked=true;
     
     var orden = document.getElementById('orden');
     orden1 = '<c:out value="${orden}" />';
     if (orden1=='si'){
       orden.checked=true;
       activar_orden();
       marcar_campos_orden();
     }
    
     var contar_reg = document.getElementById('contar_reg');
     contar_reg1 = '<c:out value="${contar_reg}" />';
     if (contar_reg1=='si')
       contar_reg.checked=true;

     var _suma1 = document.getElementById('_suma1');
     var _suma2 = document.getElementById('_suma2');
     suma1 = '<c:out value="${_suma}" />';
     if (suma1=='suma_jsp'){
        _suma1.checked=true;
	_suma2.checked=false;
	_sumar_con(_suma1);
     } else {
        _suma1.checked=false;
	_suma2.checked=true;
     	_sumar_con(_suma2);
     }
     
     var op = document.getElementsByName('op');
     op1 = '<c:out value="${op}" />';
     for (i=0; i<op.length; i++){
     var op2 = document.getElementsByName('op')[i];
     if (op1==op2.value)
       op2.checked=true;
     else 
       op2.checked=false;
     }
   }
   

  function cargar_marcados() {
    marcar_campos();
    marcar_campos_condiciones();
    marcar_campos_variables();
    marcar_campos_sumas_st();
    marcar_campos_sumas();
    marcar_campos_cabezas();
    marcar_opciones();
  }

</script>
<%@ include file="../Inferior.jsp" %>