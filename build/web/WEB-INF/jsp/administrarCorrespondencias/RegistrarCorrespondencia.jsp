<%@ include file="../Superior.jsp"%>

  <c:if test='${accion=="Aviso" && tamanio == 0}'>
    <body onload="document.forma2.submit()">
      <form name=forma2 method="POST" action='<c:url value="/misPendientes.fautapo"/>'>
      <input type=hidden name="id_tipo_proceso" value="<c:out value="${id_tipo_proceso}"/>">
      </form>
    </body> 
  </c:if>


<c:if test='${empty fechainicio  && empty fechafin  && empty fechadellunes && empty id_estado }'>
  <c:if test='${accion=="Aviso" && tamanio == 0}'>
    <body onload="document.forma2.submit()">
      <form name=forma2 method="POST" action='<c:url value="/listarMisPendientesCorrespondencias.fautapo"/>'>
      </form>
    </body> 
  </c:if>
</c:if> 
<!--VOLVER PARA AGRUPADOS--> 
<c:if test='${!empty fechainicio  || !empty fechafin  || !empty fechadellunes || !empty id_estado }'>
  <c:if test='${accion=="Aviso" && tamanio == 0}'>
    <body onload="document.forma2.submit()">
      <form name=forma2 method="POST" action='<c:url value="/listarMisPendientesAgrupadosPorEstado.fautapo"/>'>
      </form>
    </body> 
  </c:if>
</c:if> 
<!--Fin-->

<c:if test='${accion!="Aviso"}'>

<html>
<body>

<div class="titulo"> Formulario </div>
  <br>
  <table>
    <tr>
      <c:if test="${id_tipo_proceso == 1}">
        <div><a class="volver" href="<c:url value="/listarMisPendientes.fautapo"><c:param name="id_tipo_proceso" value="${id_tipo_proceso}"/></c:url>">Volver </a></div>
      </c:if>
      <c:if test="${id_tipo_proceso == 2}">
        <div><a class="volver" href="<c:url value="/listarMisPendientesCorrespondencias.fautapo"><c:param name="id_tipo_proceso" value="${id_tipo_proceso}"/></c:url>">Volver </a></div>
      </c:if>
    </tr>
  </table>

<form name="forma" method="POST" action='<c:url value="/registrarCorrespondencia.fautapo"/>' >
  <table class="tabla">
    <tr>
      <th>#</th>
        <td align="right"><c:out value="${datosTramite.correlativo2}"/>/<c:out value="${datosTramite.gestion}"/></td>
      <th>PROCESO DE NEGOCIO</th>
       <td><c:out value="${datosTramite.proceso}"/></td>
      <th>ACTIVIDAD ACTUAL</th>
       <td><c:out value="${datosTramite.actividad}"/></td>
    </tr>
  </table>
<br>
  <table class="formulario" align="letf">
    <tr>
      <td>
      <table>
       <tr>
         <th>Destinatario</th>
         <td>
           <SELECT name="id_usuario_a" onchange=" javascript:document.forma.accion.value='Formulario';
	                                       javascript:document.forma.submit();">
             <option value="0">-- Seleccione --</option>
             <c:forEach var="lista" items="${listaMultiplesUsuarios}" >
               <option value="<c:out value="${lista.id_usuario}"/>" <c:if test="${lista.id_usuario == busUsuario.id_usuario}">selected</c:if>>
                 <c:out value="${lista.ubicacion_organica}"/>-<c:out value="${lista.nombres}"/>
	       </option>
             </c:forEach>
           </SELECT>  
          </td>
        </tr>
        </table>
      </td>
      <td>
        <table>
	  <tr>
	    <td>
	      <input type="radio" name="archivar_concluir" value="no" checked> No Archivar
	    </td>
	    <td>
	      <input type="radio" name="archivar_concluir" value="si"> Si Archivar
	    </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
<br>
  <table border="0">
   <tr>
     <!-- columna 1 -->
     <td valign="top">
       <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td>
	    <table class="tabla" border="0" width="100%">
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
	          document.write("<font color='000000' face='Arial'>"+year+"-"+month+"-"+daym+"</font>")
	          </script>
	          </body>
                  </html>
	          <!-- - Hora:
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
                 <input type="text" name="reloj" size="8" style="background-color : #f0f0f0; color : Black; font-family : Verdana, Arial, Helvetica; font-size : 11pt; text-align : center;" onfocus="window.document.form_reloj.reloj.blur()">
                 </body>
                 </html>
		 -->
                </th>
     
                <!--FIN HORA-->
   	        </tr>

              <c:set var="req" value="0"/>
              <c:set var="nro_fila_ant" value="0"/>
	      
              <c:forEach var="lista1" items="${lformulario}" varStatus="contador">
                <c:if test="${contador.last==true}">
                  <input type=hidden name="nu_registros" value="<c:out value="${contador.count}"/>">
                </c:if>
		<input type=hidden name='id_tramite_<c:out value="${contador.count}"/>' value='<c:out value="${id_tramite}"/>' >
                <input type=hidden name='id_campo_<c:out value="${contador.count}"/>_0' value='<c:out value="${lista1.id_campo}"/>' >
                <input type=hidden name='id_form_<c:out value="${contador.count}"/>' value='<c:out value="${lista1.id_form}"/>' >
                <input type=hidden name='id_tipo_permiso_<c:out value="${contador.count}"/>_0' value='<c:out value="${lista1.id_tipo_permiso}"/>' >
                <input type=hidden name='id_dominio_<c:out value="${contador.count}"/>_0' value='<c:out value="${lista1.id_dominio}"/>' >
	        <c:set var="id_formulario_0" value="${lista1.id_form}"/>
		<c:if test='${lista1.id_tipo_permiso!=""}'>
                  <c:if test="${lista1.nro_fila == fila_minima}">
	            <tr>
		      <td>
		      <table border="0" class="tabla" >
		        <tr>
	          </c:if>
  	          <c:if test="${nro_fila_ant != lista1.nro_fila}">
		           </tr>
		         </table>
		       </td>
		     </tr>
		     <tr>
		       <td>
		         <table border="0" class="tabla" >
		           <tr>
                     <c:set var="nro_fila_ant" value="${lista1.nro_fila}"/>
                  </c:if>
	          <c:if test="${nro_fila_ant == lista1.nro_fila}">
		     <c:if test="${lista1.nro_columna > 1}">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	             </c:if>
	             <td class="etiqueta" align="right"><c:out value="${lista1.campo}"/></td>
                     <td valign="top">
	             <c:if test='${lista1.id_tipo_permiso=="W"}'>
                       <c:if test='${lista1.filas ==1 && lista1.columnas!=0}'>
		         <c:if test='${lista1.rango1=="0"&&lista1.rango2=="0"}'>
	                   <input type=text id='<c:out value="${lista1.id_campo}"/>'  name='valor_<c:out value="${contador.count}"/>_0' value='<c:out value="${lista1.valor}"/>' size='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' <c:if test="${lista1.id_tipo_validacion != 'T'}"> onblur='validar(this,"<c:out value='${lista1.id_tipo_validacion}'/>")' </c:if> onkeyup='funciones()' >
	                 </c:if>
		         <c:if test='${lista1.rango1!="0"||lista1.rango2!="0"}'>
	                   <input type=text id='<c:out value="${lista1.id_campo}"/>'  name='valor_<c:out value="${contador.count}"/>_0' value='<c:out value="${lista1.valor}"/>' size='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' onblur='validarNota(this,"<c:out value='${lista1.rango1}'/>","<c:out value='${lista1.rango2}'/>")'  onkeyup='funciones()'>
	                 </c:if>
		       </c:if>
	               <c:if test='${lista1.filas > 1 && lista1.columnas!=0}'>
		         <c:if test='${lista1.rango1=="0"&&lista1.rango2=="0"}'>
                           <textArea id='<c:out value="${lista1.id_campo}"/>'  name='valor_<c:out value="${contador.count}"/>_0' rows='<c:out value="${lista1.filas}"/>' cols='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' <c:if test="${lista1.id_tipo_validacion != 'T'}">  onblur='validar(this,"<c:out value='${lista1.id_tipo_validacion}'/>")' </c:if>><c:out value="${lista1.valor}"  escapeXml="False"/></textarea>
	                 </c:if>
		         <c:if test='${lista1.rango1!="0"||lista1.rango2!="0"}'>
                           <textArea id='<c:out value="${lista1.id_campo}"/>'  name='valor_<c:out value="${contador.count}"/>_0' rows='<c:out value="${lista1.filas}"/>' cols='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' onblur='validarNota(this,"<c:out value='${lista1.rango1}'/>","<c:out value='${lista1.rango2}'/>")' ><c:out value="${lista1.valor}" escapeXml="False" /></textarea>  		     
	                 </c:if>
                       </c:if>
                     </c:if>
		     
		      <!--PARA LA TABLA -->
		      <c:if test='${lista1.id_tipo_permiso=="T"}'>
                        <input type='text' id='<c:out value="${lista1.id_campo}"/>' name='valor_<c:out value="${contador.count}"/>_0' value='<c:out value="${lista1.valor}"/>' size='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' readonly onkeyup='funciones()' >
     		        <small><a href="javascript:showTabla(forma.valor_<c:out value="${contador.count}"/>, forma.primarios_<c:out value="${contador.count}"/>, forma.campos_<c:out value="${contador.count}"/>, '<c:out value="${lista1.id_dominio_padre}"/>','<c:out value="${lista1.id_campo_foraneo}"/>', '<c:out value="${lista1.valores}"/>', '<c:out value="${lista1.campos}"/>', '<c:out value="${lista1.primarios}"/>', '<c:out value="${lista1.cadena}"/>', '<c:out value="${lista1.etiqueta}"/>');">
                        <img src="./imagenes/formularios/baseDatos.gif" border="0" ></a></small>
                        <input type="hidden" name='primarios_<c:out value="${contador.count}"/>_0' >
			<input type="hidden" name='campos_<c:out value="${contador.count}"/>_0' >
			<script>
			  dominio_padreA[<c:out value="${lista1.id_dominio}"/>]='<c:out value="${lista1.id_campo}"/>';
                        </script>
                      </c:if>
		      
		     <!--PARA LA FECHA -->
		      <c:if test='${lista1.id_tipo_permiso=="D"}'>
                        <c:if test='${lista1.filas ==1 && lista1.columnas!=0}'>
	 	          <c:if test='${lista1.rango1=="0"||lista1.rango2=="0"}'>
			     <!--AQUI-->
			        <input type="text" name="valor_<c:out value="${contador.count}"/>_0"  value='<c:out value="${lista1.valor}"/>' size=20> <small><a href="javascript:showCal('valor_<c:out value="${contador.count}"/>_0')"> <img src="./imagenes/formularios/calendario.jpeg" border="0" > </a></small>
			      <!--FIN-->
	                  </c:if>
			  <!--
		          <c:if test='${lista1.rango1 != "" || lista1.rango2 != ""}'>
			     UN SEGUNDO?
	                    <input type=text name='valor_<c:out value="${contador.count}"/>_0' value='<c:out value="${lista1.valor}"/>' size='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' onblur='validarNota(this,"<c:out value='${lista1.rango1}'/>","<c:out value='${lista1.rango2}'/>")'>
	                  </c:if>
			  -->
		        </c:if>
                      </c:if>
  
                     <!--Dibuja un combo-->
                     <c:if test='${lista1.id_tipo_permiso=="C"}'>
                       <c:if test='${lista1.filas!=0 && lista1.columnas!=0}'>
  		  	  <c:if test="${lista1.id_tipo_dominio == '1'}">
 		            <SELECT id='<c:out value="${lista1.id_campo}"/>_0'   name='combo_<c:out value="${lista1.id_dominio}"/>_0'
			      onChange='funciones();<c:if test="${ lista1.id_dato == 1}">
			    	poblar(<c:out value='${lista1.id_dominio}' />, this.options[this.selectedIndex].value)
       		           </c:if>'>
                            
			   <c:out value="${lista1.resultado}"/>
			   <c:if test="${lista1.resultado != 1}">
	                      <option value="0">--Seleccione--</option>
                           </c:if>
			    
			   <c:forEach var="lista" items="${lista1.tuplas}">
			     <c:if test="${(lista.id_tupla_padre == '0')||(lista.id_tupla == lista1.seleccionado)}">
  	                       <OPTION value="<c:out value="${lista.id_tupla}"/>"  <c:if test="${lista.id_tupla == lista1.seleccionado}">selected </c:if> <c:if test="${lista1.resultado == 1}">selected </c:if>>
	                         <c:out value="${lista.tupla}"/>
	                       </option>
	                     </c:if>
			   </c:forEach>
	                  </SELECT>
                        </c:if>

			<c:if test="${lista1.id_tipo_dominio != '1'}">
       	                  <SELECT name='combo_<c:out value="${lista1.id_dominio}"/>_0' 
			    <c:if test="${ lista1.id_dato == 1}">	       
      	                      onchange="javascript:document.forma.combito.value='<c:out value="${contador.count}"/>'; document.forma.submit();"
       		            </c:if> >
			    
                            <c:if test="${lista1.resultado != 1}">
	                      <option value="0">--Seleccione--</option>
                            </c:if>
		            
			    <c:forEach var="lista" items="${lista1.tuplas}">
  	                      <OPTION value="<c:out value="${lista.id_tupla}"/>"  <c:if test="${lista.id_tupla == lista1.seleccionado}">selected </c:if> <c:if test="${lista1.resultado == 1}">selected </c:if>>
	                        <c:out value="${lista.tupla}"/>
	                      </option>
	                    </c:forEach>
	                  </SELECT>
                        </c:if>
                       </c:if>
                     </c:if>
	  
	             <!-- Dibujamos un check -->
                     <c:if test='${lista1.id_tipo_permiso=="K"}'>
                       <c:if test='${lista1.filas!=0 && lista1.columnas!=0}'>
  	                 <table width="100%" cellspacing="2" cellpadding="3">
		           <tr>
	   	           <c:forEach var="lista" items="${lista1.tuplas}" varStatus="cont1">
		             <td class="etiqueta" align=right><c:out value="${lista.tupla}"/></td>
   	                     <td class="colh"><input type=checkbox name="check<c:out value="${contador.count}"/>_0" value="<c:out value="${lista.id_tupla}"/>" <c:if test="${lista.id_tupla == lista.seleccionado}">checked</c:if> >
                             <c:if test="${cont1.count % 4  == '0'}" >
 			       </tr>
			       <tr>
		             </c:if>
	                   </c:forEach>
		           </tr>
	                 </table>
                       </c:if>
                     </c:if>

                     <c:if test='${lista1.id_tipo_permiso=="R" }'>
                       <c:out value="${lista1.valor}" escapeXml="False" />
                         <input type="hidden" name='valor_<c:out value="${contador.count}"/>_0' value='<c:out value="${lista1.valor}"/>' size="10" maxlength="10">
                     </c:if>
		     </td>
 	           </c:if>
		 </c:if>
		
                  <c:if test='${lista1.id_tipo_permiso!="R" && lista1.id_tipo_permiso!="W" && lista1.id_tipo_permiso!="C"&& lista1.id_tipo_permiso!="D"&& lista1.id_tipo_permiso!="T"}'>
                    <input type="hidden" name='valor_<c:out value="${contador.count}"/>_0' value='<c:out value="${lista1.valor}"/>' size="10" maxlength="10">
                  </c:if>	
                </c:forEach>
	      </table>
              </td>
	    </tr>
	  </table>
	</td>
        <!-- columna 2 -->
  
        <!-- Chek -->
        <td valign="top">
        <table class="tabla">
	  <!--<tr>
            <th colspan="4">MANDAR ARCHIVAR</th>
          </tr>
          <tr>
            <td colspan="4"><input type="checkbox" name="archivo_concluir" VALUE="si">Archivar </td>
          </tr>
	  -->
	  <tr>
	    <th colspan="4">PROVEIDO</th>
          </tr>
         <tr>
           <td colspan="4"><textArea name="proveido_0" rows="4" cols="30" escapeXml="False" ><c:out value="${datosProveido.proveido}" /></textarea></td>
	   <input type=hidden name='id_tramite<c:out value="${contador.count}"/>' value='<c:out value="${id_tramite}"/>' >
           <input type=hidden name='id_actividad<c:out value="${contador.count}"/>' value='<c:out value="${id_actividad}"/>'>
	   <input type=hidden name='id_proveido' value='<c:out value="${id_proveido}"/>'>
	   <input type=hidden name='id_proceso' value='<c:out value="${id_proceso}"/>'>
         </td>
       </tr>
       <tr>
         <td colspan="4" align="center">
	   <input type="submit" class="adjuntar" value="Adjuntar" onclick="document.forma.action='adjuntarArchivoCorresp.fautapo'">
         </td>
       </tr>
      <tr>
        <td colspan="3" valign="top">
        <table class="tabla" valign="top">
	  <tr>
            <th>CARGO</th>
	    <th>UNIDAD</th>
            <th>REMITENTE</th>
    	    <th>HISTORICO DE PROVEIDOS</th>
          </tr>  
          <c:forEach var="cod" items="${lProveidos}" varStatus="contador" >
            <!-- ********** Esto es para el efecto ************ -->
              <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
            <!-- ********** Fin  efecto ************ -->
              <td><c:out value="${cod.cargo}"/></td>
	      <td><c:out value="${cod.ubicacion_organica}"/></td>
              <td><c:out value="${cod.usuario}"/></td>
              <td><c:out value="${cod.proveido}" escapeXml="False" /></td>			   
             </tr>
           </c:forEach>
         </table>
        </td>
	<td valign="top">
        <table class="tabla">
	  <tr>
	    <th>ADJUNTOS</th>
          </tr>  
            <c:forEach var="datosAdjunto" items="${lAdjuntos}" varStatus="contador">
              <!-- ********** Esto es para el efecto ************ -->
                <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
              <!-- ********** Fin  efecto ************ -->
	        <td>
		  <div class="descargar">
                  <a href='<c:out value="${aplicacion}"/>adjuntos/<c:out value="${datosAdjunto.adjunto}"/>'><c:out value="${datosAdjunto.archivo}"/></a>
		  </div><br>
		</td>
	      </tr>
	    </c:forEach>
        </table>
        </td>
      </tr>
    </table>      
    <!-- Atachar -->
    <table>
      <tr>
        <td>
          <a href="<c:url value="/registrarTramite.fautapo">
          <c:param name="id_tramite" value="${id_tramite}"/>
          </c:url>">
	</td>
        <c:forEach var="listaDocu" items="${lAdjuntos}">
          <tr>
            <td align=left colspan=5  class=textoParrafo><a href=<c:out value="aplicacion"/>adjuntos/<c:out value="${listaDocu.archivo}"/> type="text">
              <c:out value="${listaDocu.archivo}"/></a>
	    </td>
          </tr>
        </c:forEach>
        </a>
        </td>
      </tr>
    </table>
    </td>
    <!-- Fin  Atachar -->
     </table>    
   </td>
 </tr>
</table>

<!--INICIO CORRESPONDENCIAS -->
<br>
<c:if test="${id_actividad_actual != id_actividad_m}">
<table>
  <tr>
  <td>
    <table class="tabla">
      <tr>
        <th align=center>OTROS DESTINATARIOS EOEOEOE</th>
      <tr>
        <td>
        <select name="usuarios2" size=6 onchange="javascript:document.forma.submit();"multiple>
          <c:forEach var="usuariosm" items="${listaMultiplesUsuarios}">
            <OPTION value="<c:out value="${usuariosm.id_usuario}"/>">
	  <c:out value="${usuariosm.ubicacion_organica}"/>-<c:out value="${usuariosm.nombres}"/>
          </c:forEach>
          </select>
          </td>
        </tr>
      </table>
  </td>
  </tr>
</table>
</c:if>

<c:if test="${usuarios2 != null}">
  <c:forEach var="usuarios3" items="${listaUsuarios1}" varStatus="contadorU">
    <c:if test="${contadorU.last == true}">
      <input type=hidden name="cuantos" value="<c:out value="${contadorU.count}"/>"> 
    </c:if>
 <br>
 <table>
   <tr>
     <!-- columna 1 -->
     <td valign="top">
       <table border="0">
	  <tr>
	    <td valign="top">
	    <table class="tabla" border="0" width="100%">
              <tr>
                <th class="colh" align=center>FORMULARIO</th>
   	      </tr>
              <tr>
	        <td>
	          <input type="radio" name="eliminado" value="<c:out value="${usuarios3.id_usuario}"/>"  />
	          <c:out value="${usuarios3.nombres}"/>
	          <input type=hidden name=contador value="<c:out value="${contadorU.count}"/>"/>
	          <input type=hidden name="id_usuario_d:<c:out value="${contadorU.count}"/>" value="<c:out value="${usuarios3.id_usuario}"/>">
	        </td>
    	      </tr>

              <c:set var="nro_fila_ant" value="0"/>
 <!--Copia de correspondencias -->    
              <c:forEach var="lista1" items="${lformulario}" varStatus="contador">
                <c:if test="${contador.last==true}">
                  <input type=hidden name="nu_registros" value="<c:out value="${contador.count}"/>">
                </c:if>
		<input type=hidden name='id_tramite_<c:out value="${contador.count}"/>' value='<c:out value="${id_tramite}"/>' >
                <input type=hidden name='id_campo_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' value='<c:out value="${lista1.id_campo}"/>' >
                <input type=hidden name='id_form_<c:out value="${contador.count}"/>' value='<c:out value="${lista1.id_form}"/>' >
                <input type=hidden name='id_tipo_permiso_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' value='<c:out value="${lista1.id_tipo_permiso}"/>' >
                <input type=hidden name='id_dominio_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' value='<c:out value="${lista1.id_dominio}"/>' >
		<c:if test='${lista1.id_tipo_permiso!=""}'>
                  <c:if test="${lista1.nro_fila == fila_minima}">
	            <tr>
		      <td>
		      <table border="0" class="tabla" >
		        <tr>
	          </c:if>
  	          <c:if test="${nro_fila_ant != lista1.nro_fila}">
		           </tr>
		         </table>
		       </td>
		     </tr>
		     <tr>
		       <td>
		         <table border="0" class="tabla" >
		           <tr>
                     <c:set var="nro_fila_ant" value="${lista1.nro_fila}"/>
                  </c:if>
	          <c:if test="${nro_fila_ant == lista1.nro_fila}">
		     <c:if test="${lista1.nro_columna > 1}">
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	             </c:if>
	             <td class="etiqueta" align="right"><c:out value="${lista1.campo}"/></td>
                     <td valign="top">
	             <c:if test='${lista1.id_tipo_permiso=="W"}'>
                       <c:if test='${lista1.filas ==1 && lista1.columnas!=0}'>
		         <c:if test='${lista1.rango1=="0"&&lista1.rango2=="0"}'>
	                   <input type=text id='<c:out value="${lista1.id_campo}"/>'  name='valor_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' value='<c:out value="${lista1.valor}"/>' size='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' <c:if test="${lista1.id_tipo_validacion != 'T'}"> onblur='validar(this,"<c:out value='${lista1.id_tipo_validacion}'/>")' </c:if> onkeyup='funciones()' >
	                 </c:if>
		         <c:if test='${lista1.rango1!="0"||lista1.rango2!="0"}'>
	                   <input type=text id='<c:out value="${lista1.id_campo}"/>'  name='valor_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' value='<c:out value="${lista1.valor}"/>' size='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' onblur='validarNota(this,"<c:out value='${lista1.rango1}'/>","<c:out value='${lista1.rango2}'/>")'  onkeyup='funciones()'>
	                 </c:if>
		       </c:if>
	               <c:if test='${lista1.filas > 1 && lista1.columnas!=0}'>
		         <c:if test='${lista1.rango1=="0"&&lista1.rango2=="0"}'>
                           <textArea id='<c:out value="${lista1.id_campo}"/>'  name='valor_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' rows='<c:out value="${lista1.filas}"/>' cols='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' <c:if test="${lista1.id_tipo_validacion != 'T'}">  onblur='validar(this,"<c:out value='${lista1.id_tipo_validacion}'/>")' </c:if>><c:out value="${lista1.valor}"  escapeXml="False"/></textarea>
	                 </c:if>
		         <c:if test='${lista1.rango1!="0"||lista1.rango2!="0"}'>
                           <textArea id='<c:out value="${lista1.id_campo}"/>'  name='valor_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' rows='<c:out value="${lista1.filas}"/>' cols='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' onblur='validarNota(this,"<c:out value='${lista1.rango1}'/>","<c:out value='${lista1.rango2}'/>")' ><c:out value="${lista1.valor}" escapeXml="False" /></textarea>  		     
	                 </c:if>
                       </c:if>
                     </c:if>
		     
		      <!--PARA LA TABLA -->
		      <c:if test='${lista1.id_tipo_permiso=="T"}'>
                        <input type='text' id='<c:out value="${lista1.id_campo}"/>' name='valor_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' value='<c:out value="${lista1.valor}"/>' size='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' readonly onkeyup='funciones()' >
   		        <small><a href="javascript:showTabla(forma.valor_<c:out value="${contador.count}"/>, forma.primarios_<c:out value="${contador.count}"/>, forma.campos_<c:out value="${contador.count}"/>, '<c:out value="${lista1.id_dominio_padre}"/>','<c:out value="${lista1.id_campo_foraneo}"/>', '<c:out value="${lista1.valores}"/>', '<c:out value="${lista1.campos}"/>', '<c:out value="${lista1.primarios}"/>');">
                        <img src="./imagenes/formularios/baseDatos.gif" border="0" ></a></small>
                        <input type="hidden" name='primarios_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' >
			<input type="hidden" name='campos_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' >
			<script>
			  dominio_padreA[<c:out value="${lista1.id_dominio}"/>]='<c:out value="${lista1.id_campo}"/>';
                        </script>
                      </c:if>
		      
		     <!--PARA LA FECHA -->
		      <c:if test='${lista1.id_tipo_permiso=="D"}'>
                        <c:if test='${lista1.filas ==1 && lista1.columnas!=0}'>
	 	          <c:if test='${lista1.rango1=="0"||lista1.rango2=="0"}'>
			     <!--AQUI-->
			        <input type="text" name="valor_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>"  value='<c:out value="${lista1.valor}"/>' size=20> <small><a href="javascript:showCal('valor_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>')"> <img src="./imagenes/formularios/calendario.jpeg" border="0" > </a></small>
			      <!--FIN-->
	                  </c:if>
			  <!--
		          <c:if test='${lista1.rango1 != "" || lista1.rango2 != ""}'>
			     UN SEGUNDO?
	                    <input type=text name='valor_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' value='<c:out value="${lista1.valor}"/>' size='<c:out value="${lista1.columnas}"/>' maxlength='<c:out value="${lista1.caracteres}"/>' onblur='validarNota(this,"<c:out value='${lista1.rango1}'/>","<c:out value='${lista1.rango2}'/>")'>
	                  </c:if>
			  -->
		        </c:if>
                      </c:if>
  
                     <!--Dibuja un combo-->
                     <c:if test='${lista1.id_tipo_permiso=="C"}'>
                       <c:if test='${lista1.filas!=0 && lista1.columnas!=0}'>
  		  	  <c:if test="${lista1.id_tipo_dominio == '1'}">
 		            <SELECT id='<c:out value="${lista1.id_campo}"/>_<c:out value="${contadorU.count}"/>' name='combo_<c:out value="${lista1.id_dominio}"/>_<c:out value="${contadorU.count}"/>'
			      onChange='funciones();<c:if test="${ lista1.id_dato == 1}">
			    	poblar(<c:out value='${lista1.id_dominio}' />, this.options[this.selectedIndex].value)
       		           </c:if>'>
                            
			   <c:out value="${lista1.resultado}"/>
			   <c:if test="${lista1.resultado != 1}">
	                      <option value="0">--Seleccione--</option>
                           </c:if>
			    
			   <c:forEach var="lista" items="${lista1.tuplas}">
			     <c:if test="${(lista.id_tupla_padre == '0')||(lista.id_tupla == lista1.seleccionado)}">
  	                       <OPTION value="<c:out value="${lista.id_tupla}"/>"  <c:if test="${lista.id_tupla == lista1.seleccionado}">selected </c:if> <c:if test="${lista1.resultado == 1}">selected </c:if>>
	                         <c:out value="${lista.tupla}"/>
	                       </option>
	                     </c:if>
			   </c:forEach>
	                  </SELECT>
                        </c:if>

			<c:if test="${lista1.id_tipo_dominio != '1'}">
       	                  <SELECT name='combo_<c:out value="${lista1.id_dominio}"/>_<c:out value="${contadorU.count}"/>' 
			    <c:if test="${ lista1.id_dato == 1}">	       
      	                      onchange="javascript:document.forma.combito.value='<c:out value="${contador.count}"/>'; document.forma.submit();"
       		            </c:if> >
			    
                            <c:if test="${lista1.resultado != 1}">
	                      <option value="0">--Seleccione--</option>
                            </c:if>
		            
			    <c:forEach var="lista" items="${lista1.tuplas}">
  	                      <OPTION value="<c:out value="${lista.id_tupla}"/>"  <c:if test="${lista.id_tupla == lista1.seleccionado}">selected </c:if> <c:if test="${lista1.resultado == 1}">selected </c:if>>
	                        <c:out value="${lista.tupla}"/>
	                      </option>
	                    </c:forEach>
	                  </SELECT>
                        </c:if>
                       </c:if>
                     </c:if>
	  
	             <!-- Dibujamos un check -->
                     <c:if test='${lista1.id_tipo_permiso=="K"}'>
                       <c:if test='${lista1.filas!=0 && lista1.columnas!=0}'>
  	                 <table width="100%" cellspacing="2" cellpadding="3">
		           <tr>
	   	           <c:forEach var="lista" items="${lista1.tuplas}" varStatus="cont1">
		             <td class="etiqueta" align=right><c:out value="${lista.tupla}"/></td>
   	                     <td class="colh"><input type=checkbox name="check<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>" value="<c:out value="${lista.id_tupla}"/>" <c:if test="${lista.id_tupla == lista.seleccionado}">checked</c:if> >
                             <c:if test="${cont1.count % 4  == '0'}" >
 			       </tr>
			       <tr>
		             </c:if>
	                   </c:forEach>
		           </tr>
	                 </table>
                       </c:if>
                     </c:if>

                     <c:if test='${lista1.id_tipo_permiso=="R" }'>
                       <c:out value="${lista1.valor}" escapeXml="False" />
                         <input type=hidden name='valor_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' value='<c:out value="${lista1.valor}"/>' size="10" maxlength="10">
                     </c:if>
		     </td>
 	           </c:if>
		 </c:if>
		
                  <c:if test='${lista1.id_tipo_permiso!="R" && lista1.id_tipo_permiso!="W" && lista1.id_tipo_permiso!="C"&& lista1.id_tipo_permiso!="D"&& lista1.id_tipo_permiso!="T"}'>
                    <input type="hidden" name='valor_<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' value='<c:out value="${lista1.valor}"/>' size="10" maxlength="10">
                  </c:if>	
                </c:forEach>
	      </table>
              </td>
	    </tr>
	  </table>
	</td>
        <!-- columna 2 -->
  
        <!-- Chek -->
        <td valign="top">
          <table class="tabla">
            <tr>
              <th colspan="4">PROVEIDO</th>
            </tr>
            <tr>
              <td colspan="4"><textArea name="proveido_<c:out value="${contadorU.count}"/>" rows="4" cols="30" escapeXml="False" ><c:out value="${datosProveido.proveido}" /></textarea></td>
              <input type=hidden name='id_tramite<c:out value="${contador.count}"/>' value='<c:out value="${id_tramite}"/>' >
              <input type=hidden name='id_actividad<c:out value="${contador.count}"/>_<c:out value="${contadorU.count}"/>' value='<c:out value="${id_actividad}"/>'>
	      <input type=hidden name='id_proveido_o' value='<c:out value="${id_proveido}"/>_<c:out value="${contadorU.count}"/>'>
	      <input type=hidden name='id_proceso' value='<c:out value="${id_proceso}"/>'>	      
	      <input type=hidden name='proceso' value='<c:out value="${proceso}"/>'>	      	      
              </td>
            </tr>
           </table>
        </td> 
 <!--FIN Copia de correspondencias -->                  
       </table>    
     </td>
    </tr>
   </table>              
   <c:if test="${id_actividad_actual != id_actividad_m}">
     <input type=hidden name=codigos  value='<c:out value="${codigos}"/>'>
   </c:if>
  </c:forEach>

</c:if>  
  
<!--FIN CORRESPONDENCIAS -->
<center>
 <input type="submit" class="aceptar" value="Aceptar" OnClick='javascript:document.forma.accion.value="Grabar"'></td>
 <c:if test="${id_actividad_actual != id_actividad_m}">
       <input type="submit" name="boton" class="cancelar" value="<c:out value="${usuarios3.id_usuario}"/> Eliminar" onchange="javascript:document.forma.submit();" >
    </c:if>
</center>
  <input type="hidden" name="id_tramite"          value='<c:out value="${id_tramite}"/>' >
  <input type="hidden" name="id_actividad_actual" value='<c:out value="${id_actividad}"/>'>
  <input type="hidden" name="id_proveido"         value='<c:out value="${id_proveido}"/>'>
  <input type="hidden" name="id_proceso"          value='<c:out value="${id_proceso}"/>'>
  <input type="hidden" name="id_tipo_proceso"     value='<c:out value="${id_tipo_proceso}"/>'>  
  <input type="hidden" name="id_form"             value='<c:out value="${id_form}"/>'>
  <input type="hidden" name="accion"              value='<c:out value="${accion}"/>'>
  <input type="hidden" name="recargado"           value="si"> 
  <input type="hidden" name="combito"             value="0"> 
  <input type="hidden" name="nro_pagina_actual"   value='<c:out value="${nro_pagina_actual}"/>'>
  <input type="hidden" name="fechainicio"         value='<c:out value="${fechainicio}"/>' >
  <input type="hidden" name="fechafin"            value='<c:out value="${fechafin}"/>' >
  <input type="hidden" name="fechadellunes"       value='<c:out value="${fechadellunes}"/>' >
  <input type="hidden" name="id_estado"           value='<c:out value="${id_estado}"/>' >
  <input type="hidden" name="nro_pagina_actual"   value='<c:out value="${nro_pagina_actual}"/>'>
  <input type="hidden" name="aplicacion"          value='<c:url value="/"/>' >
  <input type="hidden" id="basurero"    value="0">
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
        operaciones[0] = new Array("<c:out value='${lista1.id_campo}'/>","<c:out value='${lista1.formula}'/>");
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
    while (buscarHijo(objeto)!='-1000000') {
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
          //combito.options[0]= new Option("--Seleccione--","0");    
      }
  }

  function buscarHijo(padre){
    hijo = "-1000000";
    for (i=0;i<padre_hijo.length;i++){
      if (padre_hijo[i][0]==padre){
        hijo = padre_hijo[i][1];
        break;
      } 
    }
    return hijo;
  }

  function poblar(dominio, filtro){
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
    if (true){
      operaciones1 = "";
      for (i=0;i<variables.length;i++){
        t=true;
        prueba = operaciones[k][1].split(variables[i]);
	s = prueba[1];
	if(prueba[1]==undefined)
	  t=false;
	if (t) {
          if(i==0){
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

</c:if>
<%@ include file="../Inferior.jsp" %>