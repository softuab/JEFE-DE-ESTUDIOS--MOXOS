<%@ include file="../../Superior.jsp" %>

<body onLoad='iniciar()'>

<div class="titulo">Ver N&uacute;mero de Estudiantes Programados Aprobados, Reprobados y Abandono por Materias</div>
<form name="fvolver" method="POST" action="./verNroEstProgAprReprAbanMaterias.fautapo">
  <div class="volver"><a href='javascript: document.fvolver.submit();' > Volver </a></div>
</form>

<form name='forma' method="post" action='<c:url value="/ListarNroEstProgAprReprAbanMaterias.fautapo"/>' target="_blank">
  <input type="hidden" name="gestion" value='<c:out value="${gestion}"/>' >
  <input type="hidden" name="periodo" value='<c:out value="${periodo}"/>' >
  <table class="formulario">
    <tr>
      <th colspan="3">INTRODUZCA LOS DATOS</th>
    </tr>
  <tr>
    <td class="etiqueta">Gestion</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${gestion}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Periodo</td>
    <td class="etiqueta">::</td>
    <td><c:out value="${periodo}"/></td>
  </tr>
  <tr>
    <td class="etiqueta">Grado<font color="red">(*)</font></td>
    <td class="etiqueta">::</td>
    <td>
       <select name="plan">
         <option value=""> - Elija una opción - 
           <c:forEach var="tipo" items="${lListarGradosProgramas}">
             <option value="<c:out value="${tipo.plan}"/>/<c:out value="${tipo.id_tipo_grado}"/>"> <c:out value="${tipo.tipo_grado}"/>
             </option>
           </c:forEach>
         </option>    
       </select>
     </td>
   </tr>
 </table>
 <center>
    <input type='button' value='Siguiente' class="siguiente" onClick='javascript:verificar();'>
  </center>
</form>

<script language="JavaScript">
function verificar(){
  if((document.forma.plan.value!="")){
    document.forma.submit();
  }
  else{
    alert('Por Favor Ingrese los Datos');
  }
}
</script>
</body>
<%@ include file="../../Inferior.jsp" %>