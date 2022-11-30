<%@ include file="../Superior.jsp" %>
<script language = 'JavaScript' SRC="./validar.js">  </script>

<div class="titulo">Administraci&oacute;n de Horarios</div>

<tabla>
  <form name=formavolver<c:out value="${contador.count}"/> method=post action='<c:url value="/administrarHorarios/listarMaterias.fautapo"/>'>
    <td>
      <div><a class="volver" href="javascript:document.formavolver<c:out value="${contador.count}"/>.submit();"> Volver</a></div>
      <input type="hidden" name="gestion"              value="<c:out value="${gestion}"/>">
      <input type="hidden" name="periodo"              value="<c:out value="${periodo}"/>">
      <input type="hidden" name="id_programa"          value="<c:out value="${datosPrograma.id_programa}"/>">	
      <input type="hidden" name="id_prg_plan"          value="<c:out value="${datosPrgPlan.id_prg_plan}"/>">
      <input type="hidden" name="id_tipo_evaluacion"   value="<c:out value="${datosTipoEval.id_tipo_evaluacion}"/>">
      <input type="hidden" name="id_materia"           value="<c:out value="${datosMateria.id_materia}"/>">	      
    </td>
  </form>
</table>

<br>
<table class="tabla">
  <tr>
    <th>PROGRAMA</th>
    <th>PLAN</th>
    <th>TIPO GRADO</th>
    <th>TIPO EVALUACION</th>
    <th>GESTI&Oacute;N</th>
    <th>PERIODO</th>
    <th>MATERIA</th>
    <th>GRUPO</th>
  </tr>
  <tr align="center">
    <td><c:out value="${datosPrograma.programa}"/>
    <td><c:out value="${datosPrgPlan.id_plan}"/>
    <td><c:out value="${datosPrgPlan.tipo_grado}"/>
    <td><c:out value="${datosTipoEval.tipo_evaluacion}"/>
    <td><c:out value="${gestion}"/>
    <td><c:out value="${periodo}"/>
    <td><c:out value="${datosMateria.sigla}"/> - <c:out value="${datosMateria.materia}"/>
    <td><c:out value="${grupo.grupo}"/>
  </tr>
</table>

<br>
<form action="<c:url value="/administrarHorarios/registrarHorarios.fautapo"/>" method=post>
  <input type="hidden" name="id_programa"        value='<c:out value="${datosPrograma.id_programa}"/>' >
  <input type="hidden" name="id_prg_plan"        value='<c:out value="${datosPrgPlan.id_prg_plan}"/>' >
  <input type="hidden" name="id_tipo_evaluacion" value='<c:out value="${datosTipoEval.id_tipo_evaluacion}"/>' >
  <input type="hidden" name="gestion"            value='<c:out value="${gestion}"/>' >
  <input type="hidden" name="periodo"            value='<c:out value="${periodo}"/>' >
  <input type="hidden" name="id_materia"         value='<c:out value="${datosMateria.id_materia}"/>' >
  <input type="hidden" name="id_grupo"           value='<c:out value="${grupo.id_grupo}"/>' >
  <input type="hidden" name="id_dpto_grupo"      value='<c:out value="${grupo.id_dpto_grupo}"/>' >
  <input type="hidden" name="id_modelo_ahorro"   value='<c:out value="${grupo.id_modelo_ahorro}"/>' >

  <table class="tabla">
    <tr>
      <th>HORAS \ D&Iacute;AS</th>
      <c:forEach var="dias" items="${lDeDias}" varStatus="contador0" >
        <th><c:out value="${dias.dia}"/></th>
      </c:forEach>
      <c:forEach var="horario" items="${lDeHorarios}" varStatus="contador">
        <c:if test="${horario.id_dia == 1}">
	  <!-- ********** Esto es para el efecto ************ -->
            <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
          <!-- ********** Fin  efecto ************ --> 
          <th><c:out value="${horario.hora}"/></th>
        </c:if>
        <td>
          <c:if test="${horario.nro_aulas == 0}">
            <c:out value="${horario.aula}"/>
            Sin aulas
          </c:if>
          <c:if test="${horario.nro_aulas > 0}">
            <input type=checkbox name=horario value='<c:out value="${horario.id_hora}"/>:<c:out value="${horario.id_dia}"/>'
              <c:if test="${horario.id_aula != 0}">
                checked
              </c:if>
            ><c:out value="${horario.aula}"/>
            <select name="id_aula<c:out value="${horario.id_hora}"/>:<c:out value="${horario.id_dia}"/>">
              <c:if test="${horario.id_aula != 0}">
                <option value="<c:out value="${horario.id_aula}"/>" >
                  <c:out value="${horario.aula}"/>
                </option>
              </c:if>
              <c:forEach var="aula" items="${horario.aulas}" >
                <option value="<c:out value="${aula.id_aula}"/>" >
                  <c:out value="${aula.aula}"/>
                </option>
              </c:forEach>
            </select>
          </c:if>
        </td>
      </c:forEach>
    </tr>    
    <tr>
      <th colspan="8"><input class="aceptar" type=submit value='Registrar'></th>
    </tr>
  </table>
</form>

<%@ include file="../Inferior.jsp" %>