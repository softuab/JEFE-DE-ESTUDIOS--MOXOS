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
        <input type="checkbox" id='glosa' name='glosa' value='si'><label class="etiqueta">PONER GLOSA DINAMICA<br>
        <input type="checkbox" id='orden' name='orden' value='si' onChange='activar_orden()'><label class="etiqueta">POR ORDEN DEFINIDO</label><br>
        <input type="checkbox" id='contar_reg' name='contar_reg' value='si' ><label class="etiqueta">AGRUPAR REGISTROS PARECIDOS</label><br>
        <input type='radio' name='_suma'  id='_suma1' value='suma_jsp' onClick='_sumar_con(this)'><label class="etiqueta">SUMA  X ENCABEZADOS</label><br>
    </td>
<tr>
  <td>
    <fieldset>
      <legend class="etiqueta">Adicionar Proceso a reporte<legend>
      <table>
        <tr>
          <td>
            <SELECT NAME='id_proceso'>
              <OPTION value="0">--Elegir Proceso--</OPTION>
                <c:forEach var="ListadoProcesos" items="${lProcesos}">
                  <OPTION value='<c:out value="${ListadoProcesos.id_proceso}" />' >
                    <c:out value="${ListadoProcesos.proceso}"/>
                  </OPTION>
                </c:forEach>
            </SELECT>
          </td>
        <tr>
          <td > 
            <input type=submit class="agregar" value='Agregar' name='boton' OnClick='javascript: document.forma.target=""; document.forma.action="<c:url value='/waykaDibRep.fautapo'/>";'>
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
<c:if test="${!empty proceso}">
  <h4>Proceso <br/> <div class="clave">
	              <c:out value="${proceso.proceso}" /> 
		    </div><br>
  </h4>
  <br/>
      <table class='tabla'>
          <tr>
            <th align="middle">
	        <input type="hidden" name='proceso_<c:out value="${proceso.id_proceso}" />' value='<c:out value="${proceso.id_proceso}"/>' >
	    </th>
	    <td align="left">

	  <c:if test="${!empty lCamposProceso}">
	    <table class="tabla">
	        <tr>
                  <th><div class="clave">Ver Campos</div></th>
                  <th><div class="clave">Condicion</div></th>
                  <th><div class="clave"> Variable?</div></th>		  
                  <th><div class="clave" align="center">Suma<br>Total</div></th>
                  <th><div class="clave">Encabezado<br>principales</div></th>
                  <th><div class="clave">Orden<br>definido</div></th>
                <tr>
	      <c:forEach var="campos" items="${lCamposProceso}" varStatus="contador2">
                <tr>
	            <td class="textoEncabezado" align="left"> <input type="checkbox" name="id_campos" value="<c:out value='${campos.id_campo}'/>" onChange='activar_check("<c:out value='${campos.id_campo}'/>", "<c:out value='${campos.id_tipo_validacion}'/>")' > <c:out value="${campos.campo}"/> </td>
		    
		  <!--  INICIO JOJO  -->
                  <td  class="textoEncabezado" align="left">
		    <select id='condicion_<c:out value="${campos.id_campo}"/>' name='condicion_<c:out value="${campos.id_campo}"/>' >
		      <option value="="> = </option>
		      <option value=">"> > </option>
		      <option value="<"> < </option>
		      <option value="<>"> <> </option>
                      <option value="<="> <= </option>
                      <option value=">="> >= </option>
		    </select>
		  <c:if test="${!empty campos.lista_combo}">
                    <input type="hidden" name="combo_<c:out value='${campos.id_campo}'/>" value="">
	            <SELECT id='campo_<c:out value="${campos.id_campo}"/>' name='campo_<c:out value="${campos.id_campo}"/>' class="colb" onChange="poblar(<c:out value='${campos.id_campo}' />, this.options[this.selectedIndex].value);" >
                    <OPTION value='0'>
                        -- Seleccione --
	            </OPTION>
        	      <c:if test="${campos.id_dominio_padre=='0'}">              
                        <c:forEach var="combo" items="${campos.lista_combo}"  >
                          <OPTION value='<c:out value="${combo.id_tupla}" />'>
	                    <c:out value="${combo.tupla}"/>
	                  </OPTION>
                        </c:forEach>
                      </c:if>
                    </SELECT>
	          </c:if>
                 <c:if test="${empty campos.lista_combo}">
		    <input type="text" id='campo_<c:out value="${campos.id_campo}"/>' name='campo_<c:out value="${campos.id_campo}"/>' >
	         </c:if>
		 </td>
		
		 <td class="textoEncabezado" align="center"><input type="checkbox" name="variables"  value='<c:out value="${campos.id_campo}"/>' ></td>		 
	        
		 <c:if test="${campos.id_tipo_validacion == '9'}">
	           <td class="textoEncabezado" align="center"> <input type="checkbox" name="sumar_st" value='<c:out value="${campos.id_campo}"/>' >  </td>
	         </c:if>
	         <c:if test="${campos.id_tipo_validacion != '9'}">
	             <td class="textoEncabezado" align="center"><input type="checkbox" disabled> </td>
		 </c:if> 
                 <td class="textoEncabezado" align="center"> <input type="checkbox" name="cabezas" value="<c:out value='${campos.id_campo}'/>"> </td>
                 <td class="textoEncabezado" align="center"> <input type="text" id="orden_<c:out value='${campos.id_campo}'/>" name="orden_<c:out value='${campos.id_campo}'/>"  size='2' disabled  onKeyPress="return aceptaNumeros(event)"> </td>
               </tr>
	      </c:forEach>
	      </table>
	    </c:if>
	    </td>
          </tr>
	  <tr>
	  <td colspan='2'> Campo Calculado::<input type='text' id='campo_calculado' name='campo_calculado' value='<c:out value="${campo_calculado}" />' size='50'>Etiqueta::<input type='text' id='campo_calculado_etiqueta' name='campo_calculado_etiqueta' value='<c:out value="${campo_calculado_etiqueta}" />' size='25'></td>
          <tr>
            <td align="left">
              <input type=submit value='Listar' name='boton' OnClick='javascript: document.forma.target="_blank"; document.forma.action="<c:url value='/waykaDibRep1.fautapo'/>";'>	    
	    </td>
	    <td align="right">
              <input type=submit value='Guardar' name='boton' OnClick='javascript: document.forma.target="_blank"; document.forma.action="<c:url value='/waykaDibRep2.fautapo'/>";'>	    
            </td>
         </tr>
      </table>



</c:if>
  <input type="hidden" name='ruta' value="<c:url value='/'/>" >
  <input type="hidden" name='t' value="<c:out value='${proceso.id_proceso}'/>" >
  <input type="hidden" name='c' value='<c:out value="${c}"/>' >

</form>
<script>
  var nav4 = window.Event ? true : false;
  
  function aceptaNumeros(evt) {
    var key = nav4 ? evt.which : evt.keyCode;
    return (key <= 13 || (key >= 48 && key <= 57));
  }

  //-----------------------LLENADO DE DATOS PARA COMBOS
  var combo = new Array();
  var padre_hijo = new Array();
  h = 0;
  <c:forEach var="campos1" items="${lCamposProceso}" varStatus="contador1">
    <c:if test='${campos1.id_tipo_permiso=="C"}'>
      <c:if test='${campos1.id_dominio_padre==0}'>
        padre_hijo[h]=new Array("0", "<c:out value='${campos1.id_campo}'/>");
      </c:if>
      <c:if test='${campos1.id_dominio_padre!=0}'> 
        <c:forEach var="campos2" items="${lCamposProceso}" varStatus="contador2">
          <c:if test='${campos1.id_dominio_padre==campos2.id_dominio}'> 
           padre_hijo[h]=new Array("<c:out value='${campos2.id_campo}'/>", "<c:out value='${campos1.id_campo}'/>");
          </c:if>
        </c:forEach>
      </c:if>
      h++;
      combo[<c:out value="${campos1.id_campo}"/>]=new Array();
       <c:forEach var="lista" items="${campos1.lista_combo}"  varStatus="contador3">
          combo[<c:out value="${campos1.id_campo}"/>][<c:out value="${contador3.index}"/>]=new Array("<c:out value='${lista.id_tupla}'/>","<c:out value='${lista.tupla}'/>","<c:out value='${lista.id_tupla_padre}'/>");
       </c:forEach>
    </c:if>
  </c:forEach>
  //-----------------------------FIN DE LLENADO DE COMBOS

 function limpiar(obj_combo) {
    for (i=1; i<obj_combo.length; i++) {
      if (eval("typeof(document.getElementsByName('combo_' + obj_combo[i])[0])!='undefined'")) {
        combito = document.getElementsByName("campo_" + obj_combo[i])[0];
        if(combito.options.length !=null)
          for (m=combito.options.length-1;m>0;m--)
            combito.options[m]=null;
            combito.options[0]= new Option("-- Seleccione --","0");    
      }      
    }
 } 

  function buscarHijo(padre) {
    hijo = new Array();
    kkk = 1;
    hijo[0] = padre ;
    for (j=0; j<kkk; j++) {
      for (i=0;i<padre_hijo.length;i++) {
        if (padre_hijo[i][0]==hijo[j]) {
          hijo[kkk] = padre_hijo[i][1];
          kkk = kkk + 1;
        } 
      }
    }
    return hijo;
  }

  function poblar(dominio, filtro) {
    dominio1= buscarHijo(dominio);
    limpiar(dominio1);
    for (kk=1;kk<dominio1.length;kk++)
    if (eval("typeof(document.getElementsByName('campo_'+ dominio1[kk])[0])!='undefined'")) {
      objeto = document.getElementsByName("campo_"+ dominio1[kk])[0];
      var burbuja = new Array();
      k = 1;
      if(filtro != '-1'){
        for (i=0;i<combo[dominio1[kk]].length;i++)
          if(filtro == combo[dominio1[kk]][i][2]){
            objeto.options[k] = new Option(combo[dominio1[kk]][i][1],combo[dominio1[kk]][i][0]);
            k++;
          }
      } else {
        for (i=0;i<combo[dominio1[kk]].length;i++){
          objeto.options[k] = new Option(combo[dominio1[kk]][i][1],combo[dominio1[kk]][i][0]);
          k++;
        }
      }
      objeto.options[0] = new Option("-- Seleccione --","0");    
      objeto.options[0].selected=true;
    }
  }
  
  var ordenes = new Array();
  h=0;
  <c:forEach var="campos" items="${lCamposProceso}" varStatus="contador1">
      ordenes[h]="<c:out value='${campos.id_campo}'/>";
      h++;
  </c:forEach>    
  
  function activar_orden() {
    var orden = document.getElementById('orden');
    for(i=0; i<ordenes.length; i++) {
      var caja_orden = document.getElementsByName("orden_" + ordenes[i])[0];
      if(orden.checked) {
        caja_orden.disabled=false;
      } else {
        caja_orden.disabled=true;
      }
    } 
  }
  
</script>
<%@ include file="../Inferior.jsp" %>