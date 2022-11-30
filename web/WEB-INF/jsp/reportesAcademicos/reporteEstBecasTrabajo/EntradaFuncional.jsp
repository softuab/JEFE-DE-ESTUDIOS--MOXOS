<%@ include file="../../Superior.jsp" %>
<body onload='inicio(document.forma.gestion)'>
<script language='JavaScript' SRC="./validar.js"></script>

<script language='JavaScript'>
    function asignarUO(){   
	    var x   = document.getElementById("combo");
	    document.getElementById("ubicacion_organica").value=x.options[x.selectedIndex].text;
    }
</script>

  <div class="titulo">Listado de Estudiantes Beca-Trabajo, por Unidad Funcional</div>
  <br>
  <form name=forma action="<c:url value="/listarEstBecasTrabajoFuncional.fautapo"/>" method="POST">
  <input type="hidden" id="ubicacion_organica" name="ubicacion_organica">
    <table class="formulario">
      <tr>
        <th colspan="3" align="center">INTRODUZCA LOS DATOS</th>
      </tr>
      <tr>
        <td class="etiqueta">Usuario</td>
        <td class="etiqueta">::</td>
        <td><c:out value="${cliente.nombres}" /></td>
      </tr>
      <tr>
        <td class="etiqueta">Gesti&oacute;n <font color="red">(*)</font></td>
        <td class="etiqueta">::</td>
        <td><input type="text" name="gestion" value='<c:out value="${cliente.gestion}" />' onblur='validar(gestion,"9")' size="4" maxlength="4"></td>
      </tr>
      <tr>
        <td class="etiqueta">Periodo <font color="red">(*)</font></td>
        <td class="etiqueta">::</td>
        <td><input type="text" name="periodo" value='<c:out value="${cliente.periodo}" />' onblur='validar(periodo,"9")' size="1" maxlength="1"> </td>
      </tr>

      <tr>
        <td class="etiqueta">Unidad Funcional <font color="red">(*)</font></td>
        <td class="etiqueta">::</td>      
	<td>
          <select name="id_ubicacion_organica" onChange="asignarUO()" id="combo">
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
        <td colspan="3" align="center"><input class="siguiente" type="submit" value="Buscar"></td>
      </tr>      
    </table>
  </form>
</body>
<%@ include file="../../Inferior.jsp" %>