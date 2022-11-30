<%@ include file="../Superior.jsp" %>

<div class=titulo> Administraci&oacute;n de Horarios</div>
<br>
<table class="tabla">
  <tr>
    <th>PROGRAMA</th>
    <th>PLAN</th>
    <th>TIPO GRADO</th>
    <th>TIPO EVALUACION</th>
    <th>GESTI&Oacute;N</th>
    <th>PERIODO</th>
    <th>SIGLA - MATERIA</th>
    <th>GRUPO</th>
  </tr>
  <tr align="center">
    <td><c:out value="${datosPrograma.programa}"/>
    <td><c:out value="${datosPrgPlan.id_plan}"/>
    <td><c:out value="${datosPrgPlan.tipo_grado}"/>
    <td><c:out value="${datosTipoEval.tipo_evaluacion}"/>
    <td><c:out value="${datosDptoGrupo.gestion}"/>
    <td><c:out value="${datosDptoGrupo.periodo}"/>
    <td><c:out value="${datosMateria.sigla}"/>&nbsp;-&nbsp;<c:out value="${datosMateria.materia}"/>
    <td><c:out value="${datosDptoGrupo.grupo}"/>
  </tr>
</table>

<br><br>
<blink>
<center>
  <div class='cuadroAviso' >
    <div class="titulo">Aviso</div> 
    <c:out value="${mensaje}"/>
  </div>
</center>  
</blink>

<center>
  <form name="volver" method="POST" action='<c:url value="/administrarHorarios/listarMaterias.fautapo"/>'>
    <table>
      <tr>
        <td align="center"><input type="submit" name="boton"  value="Volver"></td>
      </tr>
      <input type="hidden" name="gestion"             value="<c:out value="${gestion}"/>">
      <input type="hidden" name="periodo"             value="<c:out value="${periodo}"/>">
      <input type="hidden" name="id_programa"         value="<c:out value="${datosPrograma.id_programa}"/>">	
      <input type="hidden" name="id_prg_plan"         value="<c:out value="${datosPrgPlan.id_prg_plan}"/>">	
      <input type="hidden" name="id_tipo_evaluacion"  value="<c:out value="${datosTipoEval.id_tipo_evaluacion}"/>">
    </table>  
  </form>
</center>  

<%@ include file="../Inferior.jsp" %>