<%@ include file="../../Superior.jsp" %>

<div class="titulo">Ver Detalle de notas</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<table class="tabla">
  <tr>
    <th>RU</th>
    <td class="colb"><c:out value="${datosEstudiante.id_estudiante}"/>
    <th>Estudiante</th>
    <td class="colb"><c:out value="${cliente.nombres}"/>
  </tr>
  <tr>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosPrograma.programa}"/>
    <th>Plan</th>
    <td class="colb"><c:out value="${datosEstudiante.id_plan}"/>
  </tr>
</table>
<br>

<table class="tabla">
  <tr>
    <th colspan=2 rowspan=2>Datos Notas</th>    
    <c:forEach var="l" items="${lListarFases}" varStatus="contador">    
       <c:set var="cols" value="0"/>
       <c:forEach var="l1" items="${lfasesTiposnotas}">
          <c:if test="${l1.id_fase == l.id_fase}">
             <c:set var="cols" value="${cols + l1.cantidad}"/>
	  </c:if> 		      
       </c:forEach>                
      <th  <c:if test="${cols > 0}"> colspan="${cols}" </c:if> ><c:out value="${l.fase}"/></th>      
    </c:forEach>
  </tr>
  <tr>
     <c:forEach var="l" items="${lListarFases}" varStatus="contador">    
        <c:set var="ban3" value="0"/>
           <c:forEach var="l1" items="${lfasesTiposnotas}">
	      <c:if test="${l1.id_fase == l.id_fase}">
                 <th colspan="${l1.cantidad}"><c:out value="${l1.tipo_nota}"/></th>
		 <c:set var="ban3" value="1"/>
	      </c:if> 		 
           </c:forEach>
	   <c:if test="${ban3==0}">         
	        <th> &nbsp;</th>
	   </c:if> 		 
     </c:forEach>      
  </tr>
  <tr>
    <td><c:out value="${sigla}"/></td>
    <td><c:out value="${materia}"/></td>
    <c:forEach var="l" items="${lListarFases}">
       <c:set var="ban" value="0"/>
       <c:forEach var="l1" items="${lfasesTiposnotas}">
          <c:if test="${l.id_fase==l1.id_fase}">         
	      <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
	         <c:set var="cols" value="0"/>
	         <c:forEach var="lnota" items="${lnotasContinua}" varStatus="contador1">
	            <c:if test="${l1.id_fase==lnota.id_fase && lnota.id_tipo_nota==l1.id_tipo_nota && lnota.nro_nota==nro_nota}">         
		       <c:set var="cols" value="1"/>
                       <td><c:out value="${lnota.nota}"/></td>
		    </c:if>
		 </c:forEach>     	
		 <c:if test="${cols==0}">         
	             <td> &nbsp;</td>
	         </c:if> 		 	 
	      </c:forEach>
	      <c:set var="ban" value="1"/>
          </c:if> 
       </c:forEach>       	  		 
       <c:if test="${ban==0}">         
          <td> &nbsp;</td>
       </c:if> 		 	 
    </c:forEach>       
  </tr>
</table>
<%@ include file="../../Inferior.jsp" %>