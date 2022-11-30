<%@ include file="../../Superior.jsp" %>
<script language='JavaScript' SRC="./validar.js">  </script>

<div class=titulo> Cambio Clave(PIN) Docente - Autoridad</div>
<br>

<table class="formulario">
  <tr>
    <th>Aviso !</th>
  </tr>
  <tr>
    <td align="center"> 
      <c:out value="${mensaje}"/>
    </td>
  </tr>
  <tr>
    <td align="center">
      <form name="fvolver" action="<c:url value="/cambioPinDocenteGeneral/buscarDocente.fautapo"/>" method="POST">
        <a class="volver" href="javascript:document.fvolver.submit();" >Volver</a></td>
        <input type="hidden" name="nombre" value="<c:out value="${nombre}"/>" >
        <input type="hidden" name="dip" value="<c:out value="${dip}"/>" >    
      </form>
    </td>   
  </tr>       
</table>
        
<%@ include file="../../Inferior.jsp" %>  
  
  
  
  
  
  
  