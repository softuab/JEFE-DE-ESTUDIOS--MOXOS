<%@ include file="../Superior.jsp" %>

<c:if test="${!empty id_rol}">
<div class=titulo>Admin. Insertar fechas y Resolucion</div>
<br>
<tabla>
  <form name="formavolver" method=post action='<c:url value="/retrocederFaseDesignacionModificar/listarProgramasFacultad.fautapo"/>'>
    <td>
      <div><a class="volver" href="javascript:document.formavolver.submit();"> Volver</a></div>
    
	 <input type="hidden" name="id_programa"   value="<c:out value='${id_programa}'/>">
      <input type="hidden" name="gestion"       value="<c:out value='${gestion}'/>">
      <input type="hidden" name="periodo"       value="<c:out value='${periodo}'/>">	  
    </td>
  </form>
</table>
<table class="tabla">
  <tr>
    <th>FACULTAD</th>
    <th>PROGRAMA</th>
    <th>PLAN</th>
    <th>GESTI&Oacute;N</th>
    <th>PERIODO</th>
    <th>TIPO EVALUACION</th>
	<th><div class="clave">DATOS</div></th>
  </tr>
  <tr align="center">
    <td class="etiqueta"><c:out value="${datosFacultad.facultad}"/>
    <td class="etiqueta"><c:out value="${datosPrograma.programa}"/>
    <td class="etiqueta"><c:out value="${datosPrgPlan.id_plan}"/>
    <td class="etiqueta"><c:out value="${gestion}"/>
    <td class="etiqueta"><c:out value="${periodo}"/>
    <td class="etiqueta"><c:out value="${datosTipoEval.tipo_evaluacion}"/>
	<c:if test="${iResultadoFaseResolucion != 0}" > 
	<form name='formaFases<c:out value="${contador.count}"/>' method=post action='<c:url value="/retrocederFaseDesignacionModificar.fautapo"/>'>
         <td> 
		 
           <a href='javascript:document.formaFases<c:out value='${lista.gestion}'/>.submit();'>Retroceder Fase</a>
	    <input type="hidden" name="id_dpto_grupo"  value="<c:out value='${lista.id_dpto_grupo}'/>">
		     <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>">
      <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
      <!--  <input type="hidden" name="id_programa"        value="<c:out value="${programa.id_programa}"/>"> -->
		<input type="hidden" name="id_programa"   value="<c:out value='${id_programa}'/>">
            <input type="hidden" name="id_tipo_evaluacion" value='<c:out value="${datosTipoEval.id_tipo_evaluacion}"/>' >
			  <input type="hidden" name="id_plan" value='<c:out value="${datosPrgPlan.id_plan}"/>' >
			   <input type="hidden" name="id_prg_plan"    value="<c:out value='${datosPrgPlan.id_prg_plan}'/>">
                     	  <input type="hidden" name="id_programa"   value="<c:out value='${id_programa}'/>">
		          
    </form>
</c:if>
  </tr>
</table>  
<br>
<h3> Lista de Materias </h3>
<table class="tabla">
  <tr>
    <th><div class="clave">NIVEL ACAD&Eacute;MICO</div></th>
    <th><div class="clave">SIGLA</div></th>
    <th><div class="clave">MATERIA</div></th>
    <th><div class="clave">GRUPO</div></th>
    <th><div class="clave">DOCENTE</div></th>
    <th><div class="clave">FECHA DE INICIO</div></th>
	<th><div class="clave">FECHA FIN</div></th>
	<th><div class="clave">NRO RES.H.C.C.</div></th>
	<th><div class="clave">NRO RES.H.C.F.</div></th>
	<th><div class="clave">NRO RES.H.C.U.</div></th>
    
  </tr>
  <c:forEach var="listado1" items="${listarplanestudios.pageList}" varStatus="contador">
     <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ --> 

    <td valign="top" align="center"><c:out value="${listado1.nivel_academico}"/>
    <td valign="top">
      <c:out value="${listado1.sigla}"/>
    </td>
    <td valign="top"><c:out value="${listado1.materia}"/></td>
    <td valign="top">
      <c:if test="${listado1.nro_asignaciones > 0}">
         <table>
           <c:forEach var="lista" items="${listado1.materias}" >
	     <tr>
	       <td>
                <c:out value="${lista.grupo}"/>
	       </td>
	     </tr>
           </c:forEach>
	 </table> 
        </form>
      </c:if>
      <c:if test="${listado1.nro_asignaciones == 0 }">
        <center><font color="red">--</font></center>
      </c:if>
    </td>
    <td valign="top">
      <c:if test="${listado1.nro_asignaciones > 0}">
         <table>
           <c:forEach var="lista" items="${listado1.materias}" >
	     <tr>
	       <td>
                <c:out value="${lista.nombres}"/>
	       </td>
	     </tr>
		 <tr>
	       <td>
                <c:out value="${lista.fec_inicio}"/>
	       </td>
	     </tr>
		 <tr>
	       <td>
                <c:out value="${lista.fec_fin}"/>
	       </td>
	     </tr>
		 <tr>
	       <td>
                <c:out value="${lista.nro_resolucionhcc}"/>
	       </td>
	     </tr>
		 <tr>
	       <td>
                <c:out value="${lista.nro_resolucionhcf}"/>
	       </td>
	     </tr>
		 <tr>
	       <td>
                <c:out value="${lista.nro_resolucionhcu}"/>
	       </td>
	     </tr>
		
           </c:forEach>
	 </table> 
        </form>
      </c:if>
      <c:if test="${listado1.nro_asignaciones == 0}">
        <center><font color="red">---</font></center>
      </c:if>
    </td>
   <!-- <td valign="top">
      <c:if test="${listado1.nro_asignaciones > 0}">
         <table>
           <c:forEach var="lista" items="${listado1.materias}" >
	     <tr>
	       <td>
                <c:out value="${lista.id_fase_resolucion}"/> - <c:out value="${lista.id_fase_resolucion}"/>
	       </td>
	     </tr>
           </c:forEach>
	 </table> 
        </form>
      </c:if>
      <c:if test="${listado1.nro_asignaciones == 0}">
        <center><font color="red">----</font></center>
      </c:if>
    </td> -->
	 <td valign="top"><c:out value="${iResultadoFaseResolucion}"/>-
	 <c:if test="${iResultadoFaseResolucion==0 }">
        Fase Inicial
      </c:if>
	  <c:if test="${iResultadoFaseResolucion==1 }">
        Fase de Designacion H.C.C.
      </c:if>
	  <c:if test="${iResultadoFaseResolucion==2 }">
        Fase de Designacion H.C.F.
      </c:if>
	  <c:if test="${iResultadoFaseResolucion==3 }">
         Fase de Designacion H.C.U.
      </c:if>
	 
	 </td>
    
    
  </tr>
  </c:forEach>
</table>
  
</c:if>

<%@ include file="../Inferior.jsp" %>