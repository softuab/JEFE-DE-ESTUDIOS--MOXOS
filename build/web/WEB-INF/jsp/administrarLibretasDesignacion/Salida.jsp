<%@ include file="../Superior.jsp" %>

<c:if test="${!empty id_rol}">
  <div class=titulo> Administrar Libretas</div>
  <br>

  <table class="tabla"  border="0">
    <tr>
      <th align="center">CARRERA/PROGRAMA</th>
      <th align="center">SIGLA</th>
      <th align="center">MATERIA</th>
      <th align="center">GRUPO</th>
      <th align="center">GESTI&Oacute;N</th>
      <th align="center">PERIODO</th>
      <th align="center">FASE ACTUAL</th>
    <tr>    
      <td class="etiqueta" align="center"><c:out value="${programa}"/></td>
      <td class="etiqueta" align="center"><c:out value="${datosAsignacion.sigla}"/></td>    
      <td class="etiqueta" align="center"><c:out value="${datosAsignacion.materia}"/></td>    
      <td class="etiqueta" align="center"><c:out value="${datosAsignacion.grupo}"/></td>
      <td class="etiqueta" align="center"><c:out value="${datosAsignacion.gestion}"/></td>
      <td class="etiqueta" align="center"><c:out value="${datosAsignacion.periodo}"/></td>
      <td class="etiqueta" align="center"><c:out value="${datosAsignacion.fase}"/></td>
    </tr>
  </table>
  <br><br>
  <blink>
    <center>
    
      <div class='cuadroAviso' >
      <div class="titulo">Aviso</div> 
        <c:if test="${auxiliar != 1}">
          Notas guardadas<br>
        </c:if>  	
	<c:if test="${auxiliar == 2}">
          *** Fase Avanzada ***<br>
        </c:if>
	<c:if test="${auxiliar == 3}">
          *** Libreta cerrada (No existen mas fases) ***<br>
	  <input type="hidden" name="avanzado" value="<c:out value="${1}"/>">
        </c:if>  	
	<c:if test="${auxiliar == 4}">
	  *** Los datos fueron registrados correctamente ***<br>
	</c:if>  	
      </div>
    </center>  
  </blink>
  <c:if test="${auxiliar == 1}">
    <center>
      <form name="volver" method="POST" action='<c:url value="/administrarLibretas/listarEstudiantesProgramados.fautapo"/>'>
        <table>
          <tr>
            <td align="center"><input type="submit" name="boton"  value="Volver"></td>
          </tr>
	  <input type="hidden" name="id_materia"         value="<c:out value="${id_materia}"/>">
          <input type="hidden" name="id_grupo"           value="<c:out value="${id_grupo}"/>">
          <input type="hidden" name="grupo"              value="<c:out value="${grupo}"/>">    
          <input type="hidden" name="id_programa"        value="<c:out value="${id_programa}"/>">
          <input type="hidden" name="id_departamento"    value="<c:out value="${id_departamento}"/>">
          <input type="hidden" name="id_fase"            value="<c:out value="${id_fase}"/>">
          <input type="hidden" name="id_modelo_ahorro"   value="<c:out value="${id_modelo_ahorro}"/>">
          <input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${id_tipo_evaluacion}"/>">
          <input type="hidden" name="tipo_evaluacion"    value="<c:out value="${tipo_evaluacion}"/>">
	  <input type="hidden" name="materia"            value="<c:out value="${materia}"/>">
          <input type="hidden" name="nombres"            value="<c:out value="${nombres}"/>">
          <input type="hidden" name="gestion"            value="<c:out value="${gestion}"/>">
          <input type="hidden" name="periodo"            value="<c:out value="${periodo}"/>">
          <input type="hidden" name="id_tipo_grado"      value="<c:out value="${id_tipo_grado}"/>">	
	  <input type="hidden" name="aux"                value="1">	
        </table>  
      </form>
    </center>  
  </c:if>    
  <c:if test="${auxiliar == 2 || auxiliar == 3 || auxiliar == 4}">
    <center>
      <form name="volver" method="POST" action='<c:url value="/definirEvaluacion/listarAsignaciones.fautapo"/>'>
        <table>
          <tr>
            <td align="center"><input type="submit" name="boton"  value="Volver"></td>
          </tr>
	  <input type="hidden" name="id_materia"         value="<c:out value='${id_materia}'/>">
          <input type="hidden" name="id_grupo"           value="<c:out value='${id_grupo}'/>">
          <input type="hidden" name="grupo"              value="<c:out value='${grupo}'/>">    
          <input type="hidden" name="id_programa"        value="<c:out value='${id_programa}'/>">
          <input type="hidden" name="id_fase"            value="<c:out value='${id_fase}'/>">
          <input type="hidden" name="id_tipo_evaluacion" value="<c:out value='${id_tipo_evaluacion}'/>">
          <input type="hidden" name="tipo_evaluacion"    value="<c:out value='${tipo_evaluacion}'/>">
	  <input type="hidden" name="id_modelo_ahorro"   value="<c:out value='${id_modelo_ahorro}'/>">
          <input type="hidden" name="programa"           value="<c:out value='${programa}'/>">
          <input type="hidden" name="materia"            value="<c:out value='${materia}'/>">
          <input type="hidden" name="nombres"            value="<c:out value='${nombres}'/>">
          <input type="hidden" name="gestion"            value="<c:out value='${gestion}'/>">
          <input type="hidden" name="periodo"            value="<c:out value='${periodo}'/>">	  
	  <input type="hidden" name="id_tipo_grado"      value="<c:out value='${id_tipo_grado}'/>">
	  <input type="hidden" name="bandera"             value='1'>
        </table>  
      </form>
    </center>  
  </c:if>      
  
</c:if>    

<%@ include file="../Inferior.jsp" %>