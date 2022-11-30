<%@ include file="../../Superior.jsp"%>

<body>
<div class="titulo"> Mis Pendientes Kardex </div>
<br>
<form name="forma" method="POST" action='<c:url value="/listarMisPendientesKardex.fautapo"/>' >
  <table class="formulario">
    <tr>
      <th align="center">Kardex</th>
      <td>
        <select name="id_proceso" OnChange='javascript: document.forma.submit()'>
          <option value="">-- Seleccione --</option>
          <c:forEach var="lista" items="${lProcesos}" >
            <option value="<c:out value="${lista.id_proceso}"/>" <c:if test="${lista.id_proceso == id_proceso}">selected</c:if>>
              <c:out value="${lista.proceso}"/>
  	    </option>
          </c:forEach>
        </select>  
      </td>
    </tr>
  </table>
  <input type="hidden" name="banderakardex" value="<c:out value="${banderakardex}"/>">
</form>

<%@ include file="../../Inferior.jsp" %>
