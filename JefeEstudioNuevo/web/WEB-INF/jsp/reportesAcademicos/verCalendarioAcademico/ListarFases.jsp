<%@ include file="../../Superior.jsp" %>

<div class="titulo">Ver Actas Por Fases</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<table class="tabla" border="0">
  <tr>
    <th>PROGRAMA</th>
    <th>PLAN</th>
    <th>GESTI&Oacute;N</th>
    <th>PERIODO</th>
  </tr>
  <tr>
    <td class="etiqueta"><c:out value="${datosPrograma.programa}"/></td>
    <td class="etiqueta"><c:out value="${id_plan}"/></td>
    <td class="etiqueta"><c:out value="${datosAsignacion.gestion}"/></td>
    <td class="etiqueta"><c:out value="${datosAsignacion.periodo}"/></td>
  </tr>
</table>

<form name='forma' method="post" action='<c:url value="/calendarioAcademico/ListarActaCalificaciones.fautapo"/>' target="_blank">
  <input type="hidden" name="id_programa" value='<c:out value="${id_programa}"/>' >
  <input type="hidden" name="id_plan" value='<c:out value="${id_plan}"/>' >
  <input type="hidden" name="id_asignacion" value='<c:out value="${id_asignacion}"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3">SELECCIONE LA FASE</th>
    </tr>
    <tr>
      <td class="etiqueta">Materia</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosAsignacion.materia}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">Grupo</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${datosAsignacion.grupo}"/></td>
    </tr>
    <tr>
      <td class="etiqueta"> Fase <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <select name="id_fase">
	  <option value="">-- seleccione --
    	  <c:forEach var="lista" items="${lFases}">
	    <option value="<c:out value="${lista.id_fase}"/>" <c:if test="${lista.id_fase == id_fase}">selected</c:if>> 
	      <c:out value="${lista.fase}"/>
	    </option>
	  </c:forEach>
	</select>
      </td>
    </tr>
  </table>
  <center>
    <input type='submit' value='Siguiente' class="siguiente">
  </center>
</form>

<%@ include file="../../Inferior.jsp" %>