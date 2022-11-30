<%@ include file="../Superior.jsp"%>

<body>
<div class="titulo"> Creaci&oacute;n de Kardex </div>
<br>

<form name="forma" method="POST">
  <table class="formulario">
    <tr>
      <th align="center">Kardex</th>
      <td>
        <select name="id_proceso" OnChange='javascript: document.forma.submit()'>
          <option value="">-- Seleccione --</option>
          <c:forEach var="lista" items="${lProcesos}" >
            <option value="<c:out value="${lista.id_proceso}"/>" <c:if test="${lista.id_proceso == id_proceso}">selected</c:if>>
              <c:out value="${lista.proceso}"/>
  	    </option>
          </c:forEach>
        </select>  
      </td>
    </tr>
  </table>
  <br>
  
  <c:if test="${!empty lformulario}">
    <table border="0">
      <tr>
        <td valign="top">
          <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
	      <td>
	      <table border="0" width="100%" class="tabla">
		 <!--AQUI LA FECHA Y HORA ACTUAL-->
	         <tr>
		 <th>
	         Fecha:
	         <html>
                 <head>
                 <title> Fecha actual 2 </title>
                 </head>
                 <body>
                 <script>
                  var mydate=new Date();
	          var year=mydate.getYear();
	          if (year < 1000)
	          year+=1900;
	          var day=mydate.getDay();
	          var month=mydate.getMonth()+1;
	          if (month<10)
	          month="0"+month;
	          var daym=mydate.getDate();
	          if (daym<10)
	          daym="0"+daym;
	          document.write("<font color='000000' face='Arial'>"+daym+"/"+month+"/"+year+"</font>")
	          </script>
	          </body>
                  </html>
	          - Hora:
                  <html>
                  <head>
	          <title>Reloj con Javascript</title>
	          <script language="JavaScript">
	           function mueveReloj(){
	           momentoActual = new Date()
	           hora = momentoActual.getHours()
	           minuto = momentoActual.getMinutes()
	           segundo = momentoActual.getSeconds()
	           horaImprimible = hora + " : " + minuto + " : " + segundo
	           document.forma.reloj.value = horaImprimible
	           setTimeout("mueveReloj()",1000)
	           }
                  </script>
                 </head>
                 <body onload="mueveReloj()">
                 <input type="text" name="reloj" size="10" style="background-color : #f0f0f0; color : Black; font-family : Verdana, Arial, Helvetica; font-size : 11pt; text-align : center;" onfocus="window.document.form_reloj.reloj.blur()">
                 </body>
                 </html>
                </th>
     
                <!--FIN HORA-->
   	        </tr>
                <c:set var="req" value="0"/>
                <c:set var="nro_fila_ant" value="0"/>
                <c:forEach var="lista1" items="${lformulario}" varStatus="contador">
                  <c:if test="${contador.last==true}">
                    <input type=hidden name="nu_registros" value="<c:out value="${contador.count}"/>">
                  </c:if>
                  <input type="hidden" name='id_campo_<c:out value="${contador.count}"/>'        value='<c:out value="${lista1.id_campo}"/>' >
                  <input type="hidden" name="id_form"                                            value='<c:out value="${lista1.id_form}"/>' >
                  <input type="hidden" name='id_tipo_permiso_<c:out value="${contador.count}"/>' value='<c:out value="${lista1.id_tipo_permiso}"/>' >
                  <input type="hidden" name='id_dominio_<c:out value="${contador.count}"/>'      value='<c:out value="${lista1.id_dominio}"/>' >
                  <c:if test='${lista1.id_tipo_permiso!=""}'>
                    <c:if test="${lista1.nro_fila == fila_minima}">
	             <tr>
		       <td>
		       <table border="0" width="100%" class="tabla">
		         <tr>
	            </c:if>
  	            <c:if test="${nro_fila_ant != lista1.nro_fila}">
		            </tr>
		          </table>
		        </td>
		      </tr>
		      <tr>
		        <td>
		        <table border="0" class="tabla">
		          <tr>
                      <c:set var="nro_fila_ant" value="${lista1.nro_fila}"/>
                    </c:if>

	            <c:if test="${nro_fila_ant == lista1.nro_fila}">
		      <c:if test="${lista1.nro_columna > 1}">
			      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	              </c:if>
		      <c:if test="${lista1.permiso == 'no'}">
  	                <td class="etiqueta" align="right"><c:out value="${lista1.campo}"/></td>
                        <td valign="top">
		      </c:if>
		      <c:if test="${lista1.permiso == 'si'}">
                        <td valign="top" class="etiqueta2">
		 	  <p>
  	                  <c:out value="${lista1.campo}"/><br>
		      </c:if>
		      <c:if test='${lista1.id_tipo_permiso == "W"}'>
                        <c:if test='${lista1.filas ==1 && lista1.columnas!=0}'>
	 	          <c:if test='${(lista1.rango1=="0")&&(lista1.rango2=="0")}'>
	                    <input type='text' id='<c:out value="${lista1.id_campo}"/>' name='valor_<c:out value="${contador.count}"/>' value='<c:out value="${lista1.valor}"/>' size='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' <c:if test="${lista1.id_tipo_validacion != 'T'}"> onblur='validar(this,"<c:out value='${lista1.id_tipo_validacion}'/>")' </c:if> onkeyup='funciones()' >
	                  </c:if>
		          <c:if test='${(lista1.rango1!="0")||(lista1.rango2!="0")}'>
	                    <input type='text' id='<c:out value="${lista1.id_campo}"/>' name='valor_<c:out value="${contador.count}"/>' value='<c:out value="${lista1.valor}"/>' size='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' onblur='validarNota(this,"<c:out value='${lista1.rango1}'/>","<c:out value='${lista1.rango2}'/>")' onkeyup='funciones()' >
	                  </c:if>
		        </c:if>
	                <c:if test='${lista1.filas > 1 && lista1.columnas != 0}'>
		          <c:if test='${lista1.rango1=="0"||lista1.rango2=="0"}'>
                            <textArea id='<c:out value="${lista1.id_campo}"/>' name='valor_<c:out value="${contador.count}"/>' rows='<c:out value="${lista1.filas}"/>' cols='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' <c:if test="${lista1.id_tipo_validacion != 'T'}">  onblur='validar(this,"<c:out value='${lista1.id_tipo_validacion}'/>")' </c:if> ><c:out value="${lista1.valor}"/></textarea>
	                  </c:if>
		          <c:if test='${lista1.rango1!="0"||lista1.rango2!="0"}'>
                            <textArea id='<c:out value="${lista1.id_campo}"/>' name='valor_<c:out value="${contador.count}"/>' rows='<c:out value="${lista1.filas}"/>' cols='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' onblur='validarNota(this,"<c:out value='${lista1.rango1}'/>","<c:out value='${lista1.rango2}'/>")'><c:out value="${lista1.valor}"/></textarea>
	                  </c:if>
                        </c:if>
                      </c:if>
		      
		      <!--PARA LA FECHA -->
		      <c:if test='${lista1.id_tipo_permiso=="D"}'>
                        <c:if test='${lista1.filas ==1 && lista1.columnas!=0}'>
	 	          <c:if test='${lista1.rango1=="0"||lista1.rango2=="0"}'>
			     <!--AQUI-->
			     <input type="text" name="valor_<c:out value="${contador.count}"/>" value='<c:out value="${lista1.valor}"/>' size=20> 
			     <small><a href="javascript:showCal('valor_<c:out value="${contador.count}"/>')"><img src="./imagenes/formularios/calendario.jpeg" border="0" ></a></small>
			     <!--FIN-->
	                  </c:if>
		        </c:if>
                      </c:if>

		      <!--PARA LA TABLA -->
		      <c:if test='${lista1.id_tipo_permiso=="T"}'>
                        <input type='text' id='<c:out value="${lista1.id_campo}"/>' name='valor_<c:out value="${contador.count}"/>' value='<c:out value="${lista1.valor}"/>' size='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' readonly onkeyup='funciones()' >
    		        <small><a href="javascript:showTabla(forma.valor_<c:out value="${contador.count}"/>, forma.primarios_<c:out value="${contador.count}"/>, forma.campos_<c:out value="${contador.count}"/>, '<c:out value="${lista1.id_dominio_padre}"/>','<c:out value="${lista1.id_campo_foraneo}"/>', '<c:out value="${lista1.valores}"/>', '<c:out value="${lista1.campos}"/>', '<c:out value="${lista1.primarios}"/>', '<c:out value="${lista1.cadena}"/>', '<c:out value="${lista1.etiqueta}"/>');">
                        <img src="./imagenes/formularios/baseDatos.gif" border="0" ></a></small>
                        <input type="hidden" id='p<c:out value="${lista1.id_campo}"/>' name='primarios_<c:out value="${contador.count}"/>' >
			<input type="hidden" name='campos_<c:out value="${contador.count}"/>' >
			<script>
			  dominio_padreA[<c:out value="${lista1.id_dominio}"/>]='<c:out value="${lista1.id_campo}"/>';
                        </script>
                      </c:if>

                      <!--Dibuja un combo -->
		      <c:if test='${lista1.id_tipo_permiso=="C"}'>
	                <c:if test='${lista1.filas!=0 && lista1.columnas!=0}'>
  		  	  <c:if test="${lista1.id_tipo_dominio == '1'}">
 		            <select id='<c:out value="${lista1.id_campo}"/>' name='combo_<c:out value="${lista1.id_dominio}"/>'
			      onChange='funciones(); <c:if test="${ lista1.id_dato == 1}">
			      poblar(<c:out value='${lista1.id_dominio}' />, this.options[this.selectedIndex].value)
            		      </c:if>' >
                            <c:if test='${lista1.resultado!=1}'>
	                      <option value="0">--Seleccione--</option>
                            </c:if>
		            <c:forEach var="lista" items="${lista1.tuplas}" varStatus="contador1">
  	                      <c:if test='${lista.id_tupla_padre=="0"}'>
			        <option value="<c:out value="${lista.id_tupla}"/>" >
	                          <c:out value="${lista.tupla}"/>
	                        </option>
	                      </c:if>
			    </c:forEach>
	                    </select>
                          </c:if>

			  <c:if test="${lista1.id_tipo_dominio != '1'}">
       	                    <select id='<c:out value="${lista1.id_campo}"/>' name='combo_<c:out value="${lista1.id_dominio}"/>' <c:if test="${ lista1.id_dato == 1}">	  
      	                                                                   onchange="javascript:document.forma.combito.value='<c:out value="${contador.count}"/>'; document.forma.submit();"
       		                                                           </c:if> >
                            <c:if test="${lista1.resultado != 1}">
	                      <option value="0">--Seleccione--</option>
                            </c:if>
		            <c:forEach var="lista" items="${lista1.tuplas}">
  	                      <option value="<c:out value="${lista.id_tupla}"/>"  <c:if test="${lista.id_tupla == lista1.seleccionado}">selected </c:if> <c:if test="${lista1.resultado == 1}">selected </c:if>>
	                        <c:out value="${lista.tupla}"/>
	                      </option>
	                    </c:forEach>
	                    </select>
                          </c:if>
			</c:if>
                      </c:if>

                      <!-- Dibujamos un check -->
                      <c:if test='${lista1.id_tipo_permiso=="K"}'>
                        <c:if test='${lista1.filas!=0 && lista1.columnas!=0}'>
		          <table valign=top width="100%">
			    <tr>
	   	            <c:forEach var="lista" items="${lista1.tuplas}" varStatus="cont1">
		              <td class=colb align=right><c:out value="${lista.tupla}"/>
   	                      <td class=colh><input type=checkbox name="check<c:out value="${contador.count}"/>" value="<c:out value="${lista.id_tupla}"/>" <c:if test="${lista.id_tupla == lista.seleccionado}">checked</c:if> >
                              <c:if test="${cont1.count % 4  == '0'}" >
 			        </tr>
			        <tr>
		              </c:if>
	                    </c:forEach>
		            </tr>
		          </table>
                        </c:if>
                      </c:if>

                      </td>
  	            </c:if>
	          </c:if>
               </c:forEach>
             </table>
             </td>
	   </tr>
	 </table>
	</td>
 
        <!-- columna 2 -->
        
      </tr>
    </table>
    <center>
      <input type="submit" class="aceptar" value='Aceptar' onClick="document.forma.accion11.value='Guardar';
								    document.forma.action='<c:url value="/registrarKardexNuevo1.fautapo"/>'">
    </center>
    <input type="hidden" name="accion11"   value="">
    <input type="hidden" name="id_campo"   value='<c:out value="${id_campo}"/>'>
    <input type="hidden" name="id_form"    value='<c:out value="${id_form}"/>'>
    <input type="hidden" name="valor"      value='<c:out value="${valor}"/>'>	 
    <input type="hidden" name="recargado"  value='si'> 
    <input type="hidden" name="combito"    value='0'>
    <input type="hidden" name="aplicacion" value='<c:url value="/"/>' >
    <input type="hidden" name="banderakardex"     value='<c:out value="${banderakardex}"/>' >
    <input type="hidden" id="basurero"     value='0'>
  </c:if>
</form>

<script>
<!--
  var variables = new Array();
  n=0;

  var operaciones = new Array();
  m=0;

  var combo = new Array();
  var padre_hijo = new Array();
  h = 0;
  <c:forEach var="lista1" items="${lformulario}" varStatus="contador">
      <c:if test='${lista1.operacion}'>
        operaciones[m] = new Array("<c:out value='${lista1.id_campo}'/>","<c:out value='${lista1.formula}'/>");
        ++m;
      </c:if>
    <c:if test='${(lista1.id_tipo_permiso=="C")||(lista1.id_tipo_permiso=="W")}'>
      variables[n] = '#<c:out value="${lista1.id_campo}"/>#';
      ++n;
      <c:if test='${lista1.id_tipo_permiso=="C"}'>
        padre_hijo[h] =new Array("<c:out value='${lista1.id_dominio_padre}'/>", "<c:out value='${lista1.id_dominio}'/>"); 
        h++;
        combo[<c:out value="${lista1.id_dominio}"/>]=new Array();
        <c:forEach var="lista" items="${lista1.tuplas}"  varStatus="contador1">
          combo[<c:out value="${lista1.id_dominio}"/>][<c:out value="${contador1.index}"/>]=new Array("<c:out value='${lista.id_tupla}'/>","<c:out value='${lista.tupla}'/>","<c:out value='${lista.id_tupla_padre}'/>");
        </c:forEach>
      </c:if>
    </c:if>
  </c:forEach>
  

  function limpiar(objeto){
    var listaLimpiar = new Array();
    k = 0;
    listaLimpiar[k] = "combo_" + objeto;
    while (buscarHijo(objeto)!='-1000000'){
      k++;
      objeto = buscarHijo(objeto);
      listaLimpiar[k] = "combo_" + objeto;            
    }
    for (i=0; i<listaLimpiar.length; i++)
      if (eval("typeof(document.getElementsByName(listaLimpiar[i])[0])!='undefined'")) {
        combito = document.getElementsByName(listaLimpiar[i])[0];
        if(combito.options.length !=null)
        for (m=combito.options.length-1;m>0;m--)
          combito.options[m]=null;
          combito.options[0]= new Option("--Seleccione--","0");    
      }
  }

  function buscarHijo(padre){
    hijo = "-1000000";
    for (i=0;i<padre_hijo.length;i++) {
      if (padre_hijo[i][0]==padre) {
        hijo = padre_hijo[i][1];
        break;
      } 
    }
    return hijo;
  }

  function poblar(dominio, filtro) {
    dominio= buscarHijo(dominio);
    limpiar(dominio);
    if (eval("typeof(document.getElementsByName('combo_'+ dominio)[0])!='undefined'")) {
      objeto = document.getElementsByName("combo_"+ dominio)[0];
      var burbuja = new Array();
      k = 1;
      if(filtro != '-1'){
        for (i=0;i<combo[dominio].length;i++)
          if(filtro == combo[dominio][i][2]){
            objeto.options[k] = new Option(combo[dominio][i][1],combo[dominio][i][0]);
            k++;
          }
      } else {
        for (i=0;i<combo[dominio].length;i++){
          objeto.options[k] = new Option(combo[dominio][i][1],combo[dominio][i][0]);
          k++;
        }
      }
      objeto.options[0] = new Option("--Seleccione--","0");    
      if (k == 2) {
        objeto.options[1].selected=true;
      } else {
        objeto.options[0].selected=true;
      }
    }
  }
  

function funciones() {
  var objetos;
  for (k=0; k<operaciones.length; k++){
    resultado = document.getElementById(operaciones[k][0]);
    if (resultado == null) {
      resultado = document.getElementById('basurero');
    }
    if (true) {
      operaciones1 = "";
      for (i=0;i<variables.length;i++){
        t=true;
        prueba = operaciones[k][1].split(variables[i]);
	s = prueba[1];
	if(prueba[1]==undefined)
	  t=false;
	if (t) {
          if (operaciones1=="") {
            variables1=operaciones[k][1].split(variables[i])
          } else {
            variables1=operaciones1.split(variables[i]);	
	  }
          variable = variables[i].split('#');
          objetos = document.getElementById(variable[1]);
	  
	  if(objetos.type=='select-one')
	  operaciones1 = variables1[0] + objetos.options[objetos.selectedIndex].text + variables1[1] ;
	  else 
          operaciones1 = variables1[0] + objetos.value + variables1[1] ;
	}
      }
      try{
      resultado.value = eval(operaciones1);
      } catch(e){
      resultado.value ='0';
      }
    }
  }  
}
-->
</script>

<%@ include file="../Inferior.jsp" %>
