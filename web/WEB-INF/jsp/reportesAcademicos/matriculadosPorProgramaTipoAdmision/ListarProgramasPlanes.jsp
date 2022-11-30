<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />

<div class="titulo">Estudiantes Matriculados Por Fechas</div>
<div class="volver"><a href='<c:url value="/matriculadosPorProgramaTipoAdmision/Entrada.fautapo"/>'>Volver</a></div>

<form name='forma' method="post" action='<c:url value="/matriculadosPorProgramaTipoAdmision/ListarEstudiantes.fautapo"/>' target="_blank">
  <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>' >
  <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>  
      <td class="etiqueta">Fecha inicio <font color='red'>(*)</font> </td>
      <td class="etiqueta"> :: </td>
      <td>
        <input type="text" name="valor_1" size="10" value='<fmt:formatDate value="${now}" pattern="${formatoFecha}" />' readonly>
        <small><a href="javascript:showCal('valor_1')"><img src="../imagenes/formularios/calendario.jpeg" border="0" ></a></small>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Fecha final <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>  
      <td>
        <input type="text" name="valor_2" size="10" value='<fmt:formatDate value="${now}" pattern="${formatoFecha}" />' readonly>
        <small><a href="javascript:showCal('valor_2')"><img src="../imagenes/formularios/calendario.jpeg" border="0" ></a></small>
      </td>
    </tr>
    <tr>
      <!--<td class="etiqueta">Tipo de Estudiante</td>
      <td class="etiqueta">::</td>
      <td>
       <select name="id_tipo_estudiante">
         <option value=""> - Elija una opción - </option>    
          <c:forEach var="tipo" items="${lTiposEstudiantes}">
            <option value="<c:out value="${tipo.id_tipo_estudiante}"/>"> <c:out value="${tipo.tipo_estudiante}"/></option>
          </c:forEach>
        </select>
      </td>-->
    </tr>
  </table>
  <center>
    <input type='button' value='Siguiente' class="siguiente" onClick='obligar(document.forma, "<c:out value='${obligatorios}'/>")'>
  </center>
</form>

<script language="JavaScript">
  var calFormat = "<c:out value='${formatoFecha}'/>";  
</script>

<%@ include file="../../Inferior.jsp" %>