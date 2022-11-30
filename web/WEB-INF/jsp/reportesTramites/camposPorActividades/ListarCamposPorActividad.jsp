<%@ include file="../../Superior.jsp" %>

<div class="titulo"> Reporte de campos por actividad</div>

<br>
<form name="forma" method="POST" >
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
    <tr>
      <td class="etiqueta">Tipo de proceso <font color='red'>(*)</font> </td>
      <td class="etiqueta">::</td>	      
      <td>
        <select name="id_proceso">
	  <option value="">-- seleccionar --
            <c:forEach var="lista" items="${lProcesos}" >
	      <OPTION value="<c:out value="${lista.id_proceso}"/>"<c:if test="${lista.id_proceso == id_proceso}">selected</c:if>>
	      <c:out value="${lista.proceso}"/>
            </c:forEach>
	</select>  
      </td>
    </tr>
  </table>
  <center>
    <input type="submit" name="boton" class="buscar" value="Buscar">
  </center>

  <div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios.</div>

  <br>
  <c:if test="${sw=='1'}">   
    <table class="tabla">
      <tr>
        <td></td>
        <td colspan=20 align="center"><b>ACTIVIDADES</td>
      </tr>
      <c:forEach var="listaca" items="${lCamposActividades}" varStatus="contador">
        <!-- ********** Esto es para el efecto ************ -->
          <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
        <!-- ********** Fin  efecto ************ -->
        <c:if test="${contador.count == 1}"><!--en caso que sea titulo-->
          <th>Nro</th>
          <c:forEach var="var" items="${listaca.lista}">
            <th><c:out value="${var.valor}"/></th>
          </c:forEach>
        </c:if>
      
        <c:if test="${contador.count != 1}"><!--en caso que sea la siguiente linea de campos y pemisos-->
          <td><c:out value="${contador.count-1}"/></td>
          <c:forEach var="var" items="${listaca.lista}">
             <td><c:out value="${var.valor}"/></td>
          </c:forEach>
        </c:if>
        </tr>
      </c:forEach>
    </table>
  </c:if>
</form>

<%@ include file="../../Inferior.jsp" %>
