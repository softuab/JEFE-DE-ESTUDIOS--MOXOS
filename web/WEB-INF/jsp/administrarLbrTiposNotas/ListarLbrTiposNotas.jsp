<%@ include file="../Superior.jsp"%>

<div class="titulo">Administrar Lbr Tipos Notas</div>
<br>
<form name=formavolver method=post action='<c:url value="/administrarTiposNotas/verificarEntrada.fautapo"/>'>
      <div><a class="volver" href="javascript:document.formavolver.submit();"> Volver</a></div>
      <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>" >
      <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
      <input type="hidden" name="id_facultad"        value="<c:out value="${datosFacultad.id_facultad}"/>">
      <input type="hidden" name="id_departamento"    value="<c:out value="${datosDepartamento.id_departamento}"/>">
      <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${datosTipoEval.id_tipo_evaluacion}"/>">
</form>
<c:if test="${!empty cliente.id_rol}">
  <table class="tabla" border=0>
    <tr>
      <th>FACULTAD</th>
      <th>FCL DEPARTAMENTO</th>
      <th>TIPO EVALUACION</th>
      <th>GESTION</th>      
      <th>PERIODO</th>
    </tr>  
    <tr class=colb>
      <td align=center><c:out value="${datosFacultad.facultad}"/></td>
      <td align=center><c:out value="${datosDepartamento.departamento}"/></td>
      <td align=center><c:out value="${datosTipoEval.tipo_evaluacion}"/></td>      
      <td align=center><c:out value="${gestion}"/></td>
      <td align=center><c:out value="${periodo}"/></td>      
    </tr>
  </table>

  <br>
  <table  witdh="50%">
    <td valign=top>
      <table class="tabla" border=0>
        <tr>
	  <td colspan="3"></td>
	</tr>
	<tr>
	  <th colspan="3">INTRODUZCA LOS DATOS</th>
	</tr>
	<form name=fevaluacion action="<c:url value="/administrarTiposNotas/listarLbrTiposNotas.fautapo"/>" method="post">	
          <input type="hidden" name="gestion" value="<c:out value="${gestion}"/>" >
          <input type="hidden" name="periodo" value="<c:out value="${periodo}"/>">
          <input type="hidden" name="id_facultad" value="<c:out value="${datosFacultad.id_facultad}"/>">
          <input type="hidden" name="id_departamento" value="<c:out value="${datosDepartamento.id_departamento}"/>">
          <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${datosTipoEval.id_tipo_evaluacion}"/>">
        <tr>
          <td class="etiqueta" align=right>Fase<font color="red">(*)</font></td>
          <td class="etiqueta">::</td>
          <td><select name="id_lbr_fase" onchange="javascript:document.fevaluacion.submit();">	    
  	        <option value="">-- Elija una Fase --
                <c:forEach var="fases" items="${lListarLbrFases}" varStatus="contador">
                  <option value="<c:out value="${fases.id_lbr_fase}"/>" <c:if test="${fases.id_lbr_fase == datosLbrFase.id_lbr_fase}"> Selected </c:if>>
	          <c:out value="${fases.fase}"/>
                </c:forEach>
	      </select>
          </td>
        </tr>
        </form>  
	<tr>
          <td colspan="3">
	    <c:if test="${empty datosLbrFase}">
	      <div class="nota"><font color="red">(*)</font>Seleccione una Fase del Departamento </div>
	    </c:if>
	    <c:if test="${!empty datosLbrFase}">
	    <table class="tabla">
	      <tr>
	        <td colspan="4" align="left">
		  <form name="fnuevo<c:out value='${lista.id_dpto_grupo}'/>" action="<c:url value='/administrarTiposNotas/nuevoLbrTipoNota.fautapo'/>" method="post">
		      <input type="hidden" name="id_departamento" value="<c:out value="${datosDepartamento.id_departamento}"/>">
                      <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${datosTipoEval.id_tipo_evaluacion}"/>">  
		      <input type="hidden" name="id_facultad"          value="<c:out value="${datosFacultad.id_facultad}"/>">
		      <input type="hidden" name="gestion"              value="<c:out value='${gestion}'/>">
                      <input type="hidden" name="periodo"              value="<c:out value='${periodo}'/>">	  
		      <input type="hidden" name="id_lbr_fase"          value="<c:out value='${datosLbrFase.id_lbr_fase}'/>">	  
		      <input type="hidden" name="accion"               value="Nuevo">	  
                      <div> <a class="agregar" href="javascript:document.fnuevo<c:out value='${lista.id_dpto_grupo}'/>.submit();"> Nuevo</a> </div>
                  </form>       
		</td>
	      </tr>
	      <tr>
	        <th>Nro.</th>	
		<th>Lbr Tipo Nota</th>	
		<th>Modificar</th>	
		<th>Eliminar</th>	
	      </tr>	
	      <c:forEach var="tiposNotas" items="${lTiposNotasFase}" varStatus="contadorL">
	      <tr>
	        <td><c:out value="${contadorL.count}"/></td>
	        <td><c:out value="${tiposNotas.tipo_nota}"/></td>
		<td>
                   <form name="fmodificar<c:out value='${tiposNotas.id_lbr_tipo_nota}'/>" action="<c:url value='/administrarTiposNotas/nuevoLbrTipoNota.fautapo'/>" method="post">
		     <input type="hidden" name="id_departamento"      value="<c:out value='${tiposNotas.id_departamento}'/>">
                     <input type="hidden" name="id_tipo_evaluacion"   value="<c:out value='${tiposNotas.id_tipo_evaluacion}'/>">  
		     <input type="hidden" name="gestion"              value="<c:out value='${tiposNotas.gestion}'/>">
                     <input type="hidden" name="periodo"              value="<c:out value='${tiposNotas.periodo}'/>">	  
		     <input type="hidden" name="id_lbr_tipo_nota"     value="<c:out value='${tiposNotas.id_lbr_tipo_nota}'/>">	  
		     <input type="hidden" name="id_lbr_fase"          value="<c:out value='${datosLbrFase.id_lbr_fase}'/>">
		     <input type="hidden" name="id_facultad"          value="<c:out value="${datosFacultad.id_facultad}"/>">	  
		     <input type="hidden" name="accion"               value="Modificar">	  
                     <div> <a class="modificar" href="javascript:document.fmodificar<c:out value='${tiposNotas.id_lbr_tipo_nota}'/>.submit();"> Modificar</a> </div>
                   </form>       
	        </td>
		<td>
                  <form name="feliminar<c:out value='${tiposNotas.id_lbr_tipo_nota}'/>" action="<c:url value='/administrarTiposNotas/nuevoLbrTipoNota.fautapo'/>" method="post">
		     <input type="hidden" name="id_departamento"      value="<c:out value='${tiposNotas.id_departamento}'/>">
                     <input type="hidden" name="id_tipo_evaluacion"   value="<c:out value='${tiposNotas.id_tipo_evaluacion}'/>">  
		     <input type="hidden" name="gestion"              value="<c:out value='${tiposNotas.gestion}'/>">
                     <input type="hidden" name="periodo"              value="<c:out value='${tiposNotas.periodo}'/>">	  
		     <input type="hidden" name="id_lbr_tipo_nota"     value="<c:out value='${tiposNotas.id_lbr_tipo_nota}'/>">	  
		     <input type="hidden" name="id_lbr_fase"          value="<c:out value='${datosLbrFase.id_lbr_fase}'/>">	  
		     <input type="hidden" name="accion"               value="Eliminar">	  
		     <input type="hidden" name="id_facultad"          value="<c:out value="${datosFacultad.id_facultad}"/>">
                     <div> <a class="eliminar" href="javascript:document.feliminar<c:out value='${tiposNotas.id_lbr_tipo_nota}'/>.submit();">Eliminar</a> </div>
                  </form>       
	        </td>
	      </tr>
	      </c:forEach>
	    </table>
	    </c:if>
          </td>
        </tr>
      </table>	
    </td>
    </tr>
  </table>
 
</c:if>

<%@ include file="../Inferior.jsp" %>

    