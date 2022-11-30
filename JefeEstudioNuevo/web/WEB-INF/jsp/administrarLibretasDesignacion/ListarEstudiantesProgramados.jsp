<%@ include file="../Superior.jsp" %>

<script language='JavaScript' SRC="./validar.js">  </script>

<c:if test="${!empty id_rol}">
  <div class=titulo> Administrar Libretas </div>
  <br>
  
  <table class="tabla"  border="0">
    <tr>
      <th>CARRERA/PROGRAMA</th>
      <th>SIGLA</th>
      <th>MATERIA</th>
      <c:if test="${!empty materia_modelo_ahorro}">
        <th>MATERIA MODELO-AHORRO</th>
      </c:if>	
      <th>GRUPO</th>
      <th>GESTI&Oacute;N</th>
      <th>PERIODO</th>
      <th>FASE ACTUAL</th>
    <tr>    
      <td align="center"><c:out value="${programa}"/></td>
      <td align="center"><c:out value="${datosAsignacion.sigla}"/></td>    
      <td  align="center"><c:out value="${datosAsignacion.materia}"/></td>    
      <c:if test="${!empty materia_modelo_ahorro}">
        <td class="colh" align="center"><c:out value="${materia_modelo_ahorro}"/></td>    
      </c:if>	
      <td align="center"><c:out value="${datosAsignacion.grupo}"/></td>
      <td align="center"><c:out value="${datosAsignacion.gestion}"/></td>
      <td align="center"><c:out value="${datosAsignacion.periodo}"/></td>
      <td align="center"><c:out value="${datosAsignacion.fase}"/></td>
    </tr>
  </table>
  <br>
  <tabla>
    <form name=formavolver<c:out value="${contador.count}"/> method=post action='<c:url value="/definirEvaluacion/listarAsignaciones.fautapo"/>'>
      <td>
        <div><a class="volver" href="javascript:document.formavolver<c:out value="${contador.count}"/>.submit();"> Volver</a></div>
	  <input type="hidden" name="id_materia"         value="<c:out value='${datosAsignacion.id_materia}'/>">
          <input type="hidden" name="id_grupo"           value="<c:out value='${datosAsignacion.id_grupo}'/>">
          <input type="hidden" name="id_programa"        value="<c:out value='${datosAsignacion.id_programa}'/>">
          <input type="hidden" name="id_fase"            value="<c:out value='${datosAsignacion.id_fase}'/>">
          <input type="hidden" name="id_tipo_evaluacion" value="<c:out value='${datosAsignacion.id_tipo_evaluacion}'/>">
	  <input type="hidden" name="id_modelo_ahorro"   value="<c:out value='${datosAsignacion.id_modelo_ahorro}'/>">
          <input type="hidden" name="nombres"            value="<c:out value='${nombres}'/>">
          <input type="hidden" name="gestion"            value="<c:out value='${datosAsignacion.gestion}'/>">
          <input type="hidden" name="periodo"            value="<c:out value='${datosAsignacion.periodo}'/>">	  
	  <input type="hidden" name="id_tipo_grado"      value="<c:out value='${id_tipo_grado}'/>">
	  <input type="hidden" name="bandera"             value='1'>
      </td>
    </form>
  </table>
  
  <table border=0 width=100%>
    <tr>
      <td width=15% valign=top>
        <form name="forma1" method="post">
          <table class="formulario" border="0">
            <tr>
              <th colspan="3" >EVALUACI&Oacute;N DEFINIDA</th>
            </tr>	
            <tr>
              <th align="center"><font size="2">ITEM</font></th>	
	      <th colspan="2" align=center><font size="2">PONDERACI&Oacute;N</font> </th>	
            </tr>	
            <c:forEach var="items" items="${listaItems}" varStatus="contador">
	      <!-- ********** Esto es para el efecto ************ -->
                <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
              <!-- ********** Fin  efecto ************ --> 
              <td>
  	        <input type="radio" name="id_tipo_nota_s" value="<c:out value="${items.id_lbr_tipo_nota}"/>:<c:out value="${items.cantidad}"/>"
                <c:if test="${items.id_tipo_nota == id_tipo_nota}">checked</c:if>> 
	      </td>
              <td><c:out value="${items.cantidad}"/> - <c:out value="${items.tipo_nota}"/></td> 
              <td><c:out value="${items.ponderacion}"/>%</td> 
             </tr>
            </c:forEach>
            <tr>
              <td align="center" colspan="3"><input type=submit value="Ver Notas"></td>
            </tr>
          </table>
          </td>
          <td width=5% valign=top>&nbsp;</td>
          <td width=80% valign=top>
            <c:if test="${id_tipo_nota != null}">
               <table class="tabla" cellspacing="1">
                 <tr>
                   <th colspan="2">Tipo Nota: </th>
	           <th><c:out value="${tipo_nota}"/></th>
	           <th colspan="<c:out value="${cantidad}"/>"><input type="submit" value="Calificar notas"></th>
                 </tr>
                 <tr>	
	           <th align="center" rowspan="2">No.</th>
                   <th align="center" rowspan="2">R.U.</th>
                   <th align="center" rowspan="2">NOMBRES</th>
                   <th colspan="<c:out value="${cantidad}"/>" align=center>NOTA</th>
                 <tr>
                   <c:forEach var="cantNotas" items="${numItems}" varStatus="contador">
                     <th class=colh><c:out value="${contador.count}"/>
                       <input type="radio" name="nro_nota_s" value="<c:out value="${contador.count}"/>" <c:if test="${contador.count == nro_nota}">checked</c:if>> 
                     </th> 
                   </c:forEach>    
                 </tr> 
         <!-- LISTA DE ESTUDIANTES, EVALUACION REGULAR  -->	
	         <c:if test="${id_tipo_grado == 1 && id_tipo_evaluacion != '2'}"> 	
		   <c:set var="contadorA" value="1"/>
                   <c:forEach var="datos" items="${listaNotas.pageList}" varStatus="contador">
		     <!-- ********** Esto es para el efecto ************ -->
                       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
                     <!-- ********** Fin  efecto ************ --> 
                       <c:if test="${!empty datos.notas}">
                         <td><c:out value="${contadorA}"/></td>
                         <td><c:out value="${datos.id_estudiante}"/></td> 
                         <td><c:out value="${datos.nombres}"/></td> 
		       </c:if>
	               <c:forEach var="notas" items="${datos.notas}">
	                 <c:if test="${notas.nro_nota == nro_nota}">
			   <td><c:out value="${notas.nota}"/>&nbsp;<input type="text" id='<c:out value="${datos.id_estudiante}"/>' 
	                        name='nota:<c:out value="${datos.id_estudiante}"/>' size="3" maxlength="3" onKeyUp="cargar_total(this)" 
	                         value='<fmt:formatNumber value="${notas.nota}"
				         groupingUsed="false" maxIntegerDigits="3"
				         maxFractionDigits="0" /> '>
			 </td>
	                 </c:if> 
	                 <c:if test="${notas.nro_nota != nro_nota}">
                           <td ><c:out value="${notas.nota}"/></td>
	                 </c:if>
                       </c:forEach>    
                     </tr>
		     <c:if test="${!empty datos.notas}">
		       <c:set var="contadorA" value="${contadorA+1}"/>
		     </c:if>
                   </c:forEach>    
	         </c:if>
        <!-- LISTA DE ESTUDIANTES, EVALUACION CONTINUA  -->	
	         <c:if test="${id_tipo_grado == 1 && id_tipo_evaluacion == 2}"> 	
		   <c:set var="contadorA" value="1"/>
                   <c:forEach var="datos" items="${listaNotas.pageList}" varStatus="contador">
		     <!-- ********** Esto es para el efecto ************ -->
                       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
                     <!-- ********** Fin  efecto ************ --> 
		       <c:if test="${!empty datos.notas}">
                         <td><c:out value="${contadorA}"/></td>
                         <td><c:out value="${datos.id_estudiante}"/></td> 
                         <td><c:out value="${datos.nombres}"/></td> 
		       </c:if>     	 
	               <c:forEach var="notas" items="${datos.notas}">
	                 <c:if test="${notas.nro_nota == nro_nota}">
	                   <td><input type=text name="nota:<c:out value="${datos.id_estudiante}"/>" value="<c:out value="${notas.nota}"/>" maxlength=10 size=10></td> 
	                 </c:if> 
	                 <c:if test="${notas.nro_nota != nro_nota}">
                           <td><c:out value="${notas.nota}"/> </td>
	                 </c:if>
                       </c:forEach>    
                     </tr>
		     <c:if test="${!empty datos.notas}">
		       <c:set var="contadorA" value="${contadorA+1}"/>
		     </c:if>
                   </c:forEach>    
	         </c:if>    	 
        <!-- LISTA DE POSTULANTES  -->	
	         <c:if test="${id_tipo_grado == 2}"> 	
		   <c:set var="contadorA" value="1"/>
                   <c:forEach var="datos" items="${listaNotas.pageList}" varStatus="contador">
		     <!-- ********** Esto es para el efecto ************ -->
                       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
                     <!-- ********** Fin  efecto ************ --> 
                       <c:if test="${!empty datos.notas}">
                         <td><c:out value="${contadorA}"/></td>
                         <td><c:out value="${datos.id_postulante}"/></td> 
                         <td><c:out value="${datos.nombres}"/></td> 
		       </c:if>    
	               <c:forEach var="notas" items="${datos.notas}">
	                 <c:if test="${notas.nro_nota == nro_nota}">
	                   <td><input type=text name="nota:<c:out value="${datos.id_postulante}"/>" value="<c:out value="${notas.nota}"/>" maxlength=10 size=10></td> 
		         </c:if> 
	                 <c:if test="${notas.nro_nota != nro_nota}">
                           <td ><c:out value="${notas.nota}"/> </td>
	                 </c:if>
                       </c:forEach>    
                     </tr>
		     <c:if test="${!empty datos.notas}">
		       <c:set var="contadorA" value="${contadorA+1}"/>
		     </c:if>
                   </c:forEach>    
	         </c:if>	
                 <tr>
                   <td colspan="10" align="center"><input type=submit value="Guardar Notas" onclick="document.forma1.action='<c:url value="/administrarLibretas/registrarNotasEstudiantes.fautapo"/>'"></td>
                </tr> 
              </table>
            </c:if>
	  <input type="hidden" name="id_asignacion"      value="<c:out value="${datosAsignacion.id_asignacion}"/>">    
	  <input type="hidden" name="id_tipo_grado"      value="<c:out value="${id_tipo_grado}"/>">
	  <input type="hidden" name="id_programa"        value="<c:out value="${id_programa}"/>">
	  <input type="hidden" name="id_tipo_nota_s"     value="<c:out value="${id_tipo_nota_s}"/>">
          <input type="hidden" name="id_materia"         value="<c:out value="${datosAsignacion.id_materia}"/>">
          <input type="hidden" name="id_grupo"           value="<c:out value="${datosAsignacion.id_grupo}"/>">
          <input type="hidden" name="id_departamento"    value="<c:out value="${datosAsignacion.id_departamento}"/>">
          <input type="hidden" name="id_fase"            value="<c:out value="${datosAsignacion.id_fase}"/>">
          <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${datosAsignacion.id_tipo_evaluacion}"/>">
          <input type="hidden" name="id_modelo_ahorro"   value="<c:out value="${datosAsignacion.id_modelo_ahorro}"/>">
          <input type="hidden" name="materia"            value="<c:out value="${datosAsignacion.materia}"/>">
          <input type="hidden" name="gestion"            value="<c:out value="${datosAsignacion.gestion}"/>">
          <input type="hidden" name="periodo"            value="<c:out value="${datosAsignacion.periodo}"/>">

        </form>
      </td>
    </tr>
  </table>      
</c:if>    

<script>
  var lista_notas = new Array();
  h=0;
  <c:forEach var="listas" items="${listaNotas.pageList}" varStatus="contador">
    lista_participantes[h]= new Array('<c:out value="${listas.id_estudiante}"/>');
    h++;
  </c:forEach>

 function cargar_total(objeto) {
    if (objeto.value > 100) {
      alert("El dato : '"+objeto.value+"'  no es un n&uacute;mero v&aacute;lido. Introduzca un n&uacute;mero del 0 al 100.");
    }
 }
  
  </script>


<%@ include file="../Inferior.jsp" %>