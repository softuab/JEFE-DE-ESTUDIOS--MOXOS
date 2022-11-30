<%@ include file="../Superior.jsp" %>

<c:if test="${!empty id_rol}">
  <div class=titulo> Administrar Libretas</div>
  <br>
  <a class="volver" href="javascript:history.back();">Volver</a>
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
      <td class="etiqueta" align="center"><c:out value="${programa}"/></td>
      <td class="etiqueta" align="center"><c:out value="${sigla}"/></td>    
      <td class="etiqueta" align="center"><c:out value="${materia}"/></td>    
      <c:if test="${!empty materia_modelo_ahorro}">
        <td class="etiqueta" align="center"><c:out value="${materia_modelo_ahorro}"/></td>    
      </c:if>
      <td class="etiqueta" align="center"><c:out value="${grupo}"/></td>
      <td class="etiqueta" align="center"><c:out value="${gestion}"/></td>
      <td class="etiqueta" align="center"><c:out value="${periodo}"/></td>
      <td class="etiqueta" align="center"><c:out value="${fase}"/></td>
    </tr>
  </table>
  <br>
  <form name=forma1 method=post>
    <table border=0 align="center">
      <tr>
        <td valign=top>
          <c:if test="${id_tipo_nota != null}">
            <table class="tabla" border=0 cellspacing=1>
              <tr>
                <th colspan=2>Tipo Nota: </th>
	        <th><c:out value="${tipo_nota}"/></th>
	        <th colspan="<c:out value="${cantidad}"/>"></th>
              </tr>
              <tr>	
	        <th align="center" rowspan=2>No.</th>
                <th align="center" rowspan=2>R.U.</th>
                <th align="center" rowspan=2>NOMBRES</th>
                <th colspan="<c:out value="${cantidad}"/>" align="center">NOTA</th>
              </tr>
              <tr>
                <c:forEach var="cantNotas" items="${numItems}" varStatus="contador">
                  <th><c:out value="${contador.count}"/></td> 
                </c:forEach>    
             </tr> 	
             <tr>
               <c:forEach var="cantNotas" items="${numItems}" varStatus="contador">
                 </td> 
               </c:forEach>    
             </tr> 	
	<!--LISTA DE ESTUDIANTES, EVALUACION REGULAR  -->
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
	               <td class="cabeceraForm"><c:out value="${notas.nota}"/></td> 
	             </c:if> 
	             <c:if test="${notas.nro_nota != nro_nota}">
                       <td><c:out value="${notas.nota}"/></td> 
	             </c:if>     
	           </c:forEach>    
                 </tr>
	         <c:if test="${!empty datos.notas}">
		   <c:set var="contadorA" value="${contadorA+1}"/>
	         </c:if>
               </c:forEach>    
	     </c:if>
	<!--LISTA DE ESTUDIANTES, EVALUACION CONTINUA  -->
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
	               <td class="cabeceraForm"><c:out value="${notas.nota}"/></td> 
	             </c:if> 
	             <c:if test="${notas.nro_nota != nro_nota}">
                       <td><c:out value="${notas.nota}"/></td> 
	             </c:if>     
	           </c:forEach>    
                 </tr>
		 <c:if test="${!empty datos.notas}">
		   <c:set var="contadorA" value="${contadorA+1}"/>
		 </c:if>
               </c:forEach>    
	     </c:if>	     
	<!--LISTA DE POSTULANTES  -->
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
	               <td class="cabeceraForm"><c:out value="${notas.nota}"/></td> 
	             </c:if> 
	             <c:if test="${notas.nro_nota != nro_nota}">
                       <td><c:out value="${notas.nota}"/></td> 
	             </c:if>     
	           </c:forEach>    
                 </tr>
	         <c:if test="${!empty datos.notas}">
		   <c:set var="contadorA" value="${contadorA+1}"/>
	         </c:if>
               </c:forEach>    
	     </c:if>	     
             <tr>
               <td colspan=3 align=right><input type=submit value="Modificar Notas" onclick="document.forma1.action='<c:url value="/administrarLibretas/listarEstudiantesProgramados.fautapo"/>'"></td>
	       <td colspan="<c:out value="${cantidad}"/>" align=right><input type=submit value="Confirmar" onclick="document.forma1.action='<c:url value="/administrarLibretas/salida.fautapo?auxiliar=1"/>'"></td>
             </tr> 
           </table>
         </c:if>
	 <input type="hidden" name="id_asignacion"      value="<c:out value="${datosAsignacion.id_asignacion}"/>">
         <input type="hidden" name="id_materia"         value="<c:out value="${datosAsignacion.id_materia}"/>">
         <input type="hidden" name="id_grupo"           value="<c:out value="${datosAsignacion.id_grupo}"/>">
         <input type="hidden" name="id_programa"        value="<c:out value="${id_programa}"/>">
         <input type="hidden" name="id_departamento"    value="<c:out value="${datosAsignacion.id_departamento}"/>">
         <input type="hidden" name="id_fase"            value="<c:out value="${datosAsignacion.id_fase}"/>">
         <input type="hidden" name="id_modelo_ahorro"   value="<c:out value="${datosAsignacion.id_modelo_ahorro}"/>">
         <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${datosAsignacion.id_tipo_evaluacion}"/>">
         <input type="hidden" name="id_tipo_nota_s"     value="<c:out value="${id_tipo_nota_s}"/>">
         <input type="hidden" name="nro_nota_s"         value="<c:out value="${nro_nota}"/>">
         <input type="hidden" name="gestion"            value="<c:out value="${datosAsignacion.gestion}"/>">
         <input type="hidden" name="periodo"            value="<c:out value="${datosAsignacion.periodo}"/>">
	 <input type="hidden" name="id_tipo_grado"      value="<c:out value="${id_tipo_grado}"/>">
        </form>
      </td>
    </tr>
  </table>      
</c:if>    

<%@ include file="../Inferior.jsp" %>