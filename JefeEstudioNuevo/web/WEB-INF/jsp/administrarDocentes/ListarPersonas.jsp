<%@ include file="../Superior.jsp" %>

<form action="<c:out value="${direccion}"/>" method=post name="forma">
 <table width="100%">
    <tr>
      <td align="right">
        <c:if test='${pagina > 1}'>
	  <a href=<c:out value="${direccion}"/>?&pagina=1&patron=<c:out value="${patron}"/>> &lt;&lt; Primera P&aacute;gina</a>
          <a href=<c:out value="${direccion}"/>?&pagina=<c:out value="${pagina - 1}"/>&patron=<c:out value="${patron}"/>>&lt; Anterior</a>
        </c:if>
        -
	<a href=<c:out value="${direccion}"/>?pagina=<c:out value="${pagina+1}"/>&patron=<c:out value="${patron}"/>>Siguiente > </a>
      </td>
    </tr>
  </table>

   <table class=formulario>
    <tr>
       <td>
        <input type="text" name="patron" value='<c:out value="${patron}"/>' size="40"><input type='button' value="" class="buscar" onclick='forma.action="<c:out value="${direccion}"/>"; forma.submit();' >
      </td>      
    </tr>	
  </table>
</form>

<c:if test='${size != 1}'>
<form action="<c:out value="${direccion}"/>" method=post name="formita">
<center>
  <table class="tabla">
    <tr>
      <th>DIP - Persona</th>
    </tr>    
  <c:forEach var="lista" items="${lPersona}" varStatus="contador">
    <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ --> 
    <td>
      <a href="JavaScript:close();" 
      onClick='window.opener.document.forma.persona.value = "<c:out value="${lista.dip}"/> - <c:out value="${lista.nombres}"/>";
      window.opener.document.forma.id_persona.value = "<c:out value="${lista.id_persona}"/>";'>
      <c:out value="${lista.dip}"/> - <c:out value="${lista.nombres}"/>
      </a>
    </td>
    </tr>
  </c:forEach>
</table>
</center>
</form>
</c:if>
<c:if test='${size == 1}'>
  <c:forEach var="lista" items="${lPersona}" varStatus="contador">
    <script> 
      window.opener.document.forma.persona.value = "<c:out value="${lista.dip}"/> - <c:out value="${lista.nombres}"/>"; 
      window.opener.document.forma.id_persona.value = "<c:out value="${lista.id_persona}"/>";
      close();
    </script>
  </c:forEach>
</c:if>
