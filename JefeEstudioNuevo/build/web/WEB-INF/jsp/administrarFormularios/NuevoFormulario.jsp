<%@ include file="../Superior.jsp"%>

<c:if test="${accion == 'Modificar'}">
  <div class="titulo"> Modificando Formularios</div>
</c:if>
<c:if test="${accion == 'Adicionar'}">
  <div class="titulo"> Agregando Formularios</div>
</c:if>

<div><a class="volver" href="<c:url value="/listarFormularios.fautapo"></c:url>">Volver</a></div>
<br>

<form name="adicionarform" method="POST" action='<c:url value="/confirmarFormulario.fautapo"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta"> Proceso <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td>
        <SELECT NAME="id_proceso">
          <option value="0">-- seleccione --
            <c:forEach var="lista" items="${lProcesos}">
              <option value='<c:out value="${lista.id_proceso}"/>' <c:if test="${lista.id_proceso == datosFormulario.id_proceso}"> selected </c:if> >
                <c:out value="${lista.proceso}"/>
              </option>
            </c:forEach>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td class="etiqueta">Formulario <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>
      <td><input type="text" name="form" size="100" value='<c:out value="${datosFormulario.form}"/>'></td>
    </tr>    
  </table>     
  <center>
    <input type="submit" class="siguiente" value='Siguiente'>
  </center>
  <input type="hidden" name='id_form'    value='<c:out value="${id_form}"/>'>
  <input type="hidden" name='accion'     value='<c:out value="${accion}"/>'>
</form>

<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

<%@ include file="../Inferior.jsp"%>