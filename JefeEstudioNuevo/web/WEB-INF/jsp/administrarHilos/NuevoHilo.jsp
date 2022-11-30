<%@ include file="../Superior.jsp"%>

<div class="titulo"> Nuevo hilo </div>
<div><a class="volver" href="<c:url value="/listarHilos.fautapo"></c:url>">Volver </a></div>
<br>

<form name="forma" method="POST">
  <table class="formulario" align="left">
    <tr>
      <th colspan="3" align="center">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">De</td>
      <td class="etiqueta">::</td>
      <td><c:out value="${nombres}"/></td>
    </tr>
    <tr>
      <td class="etiqueta">A</td>
      <td class="etiqueta">::</td>
      <td>
        <SELECT name="id_destinatario">
          <c:forEach var="usuarios" items="${lUsuarios}">
            <OPTION value='<c:out value="${usuarios.id_usuario}"/>' > 
              <c:out value="${usuarios.nombres}"/>
            </OPTION>
          </c:forEach>
        </SELECT>	
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Tipo de hilo</td>
      <td class="etiqueta">::</td>
      <td>
        <SELECT name="id_tipo_hilo">
          <c:forEach var="hilos" items="${lHilos}">
            <OPTION value='<c:out value="${hilos.id_tipo_hilo}"/>' > 
              <c:out value="${hilos.tipo_hilo}"/>
            </OPTION>
          </c:forEach>
        </SELECT>	
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Privado</td>
      <td class="etiqueta">::</td>
      <td>Si<input type="radio" name="privado" value="si"> &nbsp; No<input type="radio" name="privado" value="no" checked></td>
    </tr>
    <tr>
      <td class="etiqueta">Asunto</td>
      <td class="etiqueta">::</td>
      <td><textarea name="asunto" rows="2" cols="30"></textarea></td>
    </tr>
    <tr>
      <td><input type="submit" name="boton" value='Crear'></td>
      <td><input type="submit" name="boton" value=" Limpiar "></td>
    </tr>
  </table>
</form>
<%@ include file="../Inferior.jsp"%>
