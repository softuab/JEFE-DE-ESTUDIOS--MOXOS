<%@ include file="../../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date" />
<div class="titulo"> Tramites/procesos por Funcionarios</div>

<c:if test="${accion != 'Buscar'}">
  <form  name="forma" method="POST" action='<c:url value="/tramitesPorFuncionarios2.fautapo"/>'>
    <br>
    <table class="formulario">
      <tr>
        <th colspan="3">INTRODUZCA LOS DATOS</th>
      </tr>  
      <tr>
        <td class="etiqueta">Área <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>
        <td>
          <select name="id_ubicacion_organica">
    	    <option value="0">-- Seleccionar --</option>
            <c:forEach var="lista" items="${lUbicacionesOrganicas}" >
	      <option value="<c:out value="${lista.id_ubicacion_organica}"/>">
	        <c:out value="${lista.ubicacion_organica}"/>
              </option>
	    </c:forEach>
	  </select>
        </td>
      </tr>
      <tr> 
        <td class="etiqueta">Fecha inicio <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>
        <td>
          <input type="text" name="valor_1" size="10" value='<fmt:formatDate value="${now}" pattern="${formatoFecha}"/>' readonly>
	  <small><a href="javascript:showCal('valor_1')"><img src="./imagenes/formularios/calendario.jpeg" border="0" ></a></small>
        </td>
      </tr>
      <tr>
        <td class="etiqueta">Fecha final <font color='red'>(*)</font> </td>
        <td class="etiqueta">::</td>  
        <td>
          <input type="text" name="valor_2" size="10" value='<fmt:formatDate value="${now}" pattern="${formatoFecha}"/>' readonly>
	  <small><a href="javascript:showCal('valor_2')"><img src="./imagenes/formularios/calendario.jpeg" border="0" ></a></small>
        </td>
      </tr>
    </table>
    <center>
      <input type="submit" name="boton" class="buscar" value="Buscar">
    </center>
  </form>
  <div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>
</c:if>

<c:if test="${accion == 'Buscar'}">
  <div><a class="volver" href='tramitesPorFuncionarios.fautapo'> Volver</a></div>
  <br>
  <table class="tabla">
    <tr>
      <th>Periodo de</th>
      <td class="colb"><c:out value="${fecha_ini}"/>
      <th>al</th>
      <td class="colb"><c:out value="${fecha_fin}"/>
    </tr>
  </table>

  <br>
  <table class="tabla"> 
    <tr>
      <th>FUNCIONARIO</th>
      <th>PROCESO</th>
      <th>CANTIDAD</th>
    </tr>  
    <c:forEach var="cod" items="${lTramitesFuncionarios}" varStatus="contador" >
    <!-- ********** Esto es para el efecto ************ -->
       <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9"</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
     <!-- ********** Fin  efecto ************ -->
     <form name='forma<c:out value="${contador.index}"/>' method="post" action='<c:url value="/listarTramitesPorFuncionario.fautapo"/>' >
       <td><c:out value="${cod.usuario}"/></td>
       <td>
         <a href='javascript: document.forma<c:out value="${contador.index}"/>.submit()' >
          <c:out value="${cod.proceso}"/>
          <input type="hidden" name="para"       value='<c:out value="${cod.para}"/>'> 
          <input type="hidden" name="id_proceso" value='<c:out value="${cod.id_proceso}"/>'> 
	  <input type="hidden" name="fecha_ini"  value='<c:out value="${fecha_ini}"/>' >
          <input type="hidden" name="fecha_fin"  value='<c:out value="${fecha_fin}"/>'>
	  <input type="hidden" name="id_ubicacion_organica"  value='<c:out value="${id_ubicacion_organica}"/>' >
	 </a>      
       </td>
       <td align="right"><c:out value="${cod.cantidad}"/></td>
     </form> 
    </tr>
    </c:forEach>
  </table>
</c:if>

<script>
<!--
  var calFormat = "<c:out value='${formatoFecha}'/>";
-->
</script>

<%@ include file="../../Inferior.jsp" %>