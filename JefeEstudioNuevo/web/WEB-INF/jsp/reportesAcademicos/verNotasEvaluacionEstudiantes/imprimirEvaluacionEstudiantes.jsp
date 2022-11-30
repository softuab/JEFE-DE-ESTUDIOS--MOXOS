<%@ include file="../../Superior.jsp" %>
<script language='JavaScript' SRC="./validar.js">  </script>
<table border="0" width="100%">
  <tr>
    <td width="14%" align="center">
      <img src="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion">
    </td>
    <td width="72%" align="center">
      <table width="100%" heigth="100%" cellpading="2" cellspacing="0" >
        <tr>
          <td align="center"><h1><b><c:out value='${datosInstitucion.institucion}'/></h1></td>
        <tr>
        <tr>
          <td align="center"><font size="3"><b><c:out value='${datosInstitucion.localidad}'/> - <c:out value='${datosInstitucion.departamento}'/> - <c:out value='${datosInstitucion.pais}'/></b></font></td>
        <tr>
        </tr>
          <td align="center"><c:out value='${datosInstitucion.actividad}'/></td>
        </tr>
      </table>
    </td>
    <td width="14%">
      Fecha : <a href='javascript: window.print()'><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></a> 
    </td>
  </tr>
</table>
<hr>

<br>
<br>
  <table border="0" width="97%">
    <tr>
      <th align="left">DOCENTE:</th>
      <td><c:out value="${docente}"/></td>
      <th align="left">PROGRAMA :</th>
      <td><c:out value="${programa}"/></td>      
      <th align="left">GESTI&Oacute;N :</th>
      <td><c:out value="${gestion}"/></td>
      <th align="left">PERIODO :</th>
      <td><c:out value="${periodo}"/></td>      
    </tr>
    <tr>
      <th align="left">ASIGNATURA :</th>
      <td><c:out value="${materia}"/></td>
      <th align="left">SIGLA :</th>
      <td><c:out value="${sigla}"/></td>
      <th align="left">GRUPO :</th>
      <td><c:out value="${grupo}"/> </td>
      <th></th>
      <td></td>
    </tr>  
  </table>
  <br>
  <table class="tabla" width="97%">
    <tr>
      <th colspan="3">N&oacute;mina de Estudiantes</th>    
      <c:forEach var="l" items="${lListarFases}" varStatus="contador">    
         <c:set var="cols" value="0"/>
	 <c:set var="bandera" value="0"/>
         <c:forEach var="l1" items="${lfasesTiposnotas}">
	   <c:if test="${l1.id_fase == l.id_fase}">
	       <c:forEach var="l2" items="${lListaImpresion}">
	          <c:if test="${l2.id_tipo_nota == l1.id_tipo_nota}">
                     <c:set var="cols" value="${cols + 1}"/>
		  </c:if> 		            
	       </c:forEach>  
	   </c:if> 		       
         </c:forEach>
	 <c:forEach var="l2" items="${lListaImpresion}">
	    <c:if test="${l2.id_fase == l.id_fase}">
              <c:set var="bandera" value="1"/>
	    </c:if> 		            
	 </c:forEach>  
	 <c:if test="${bandera == 1}">
            <th  <c:if test="${cols > 0}"> colspan="${cols}" </c:if> ><c:out value="${l.fase}"/></th>      
	 </c:if> 		            
      </c:forEach>
    </tr>
    <tr>
       <th >Nro.</th>    
       <th >R.U.</th>    
       <th >Nombres</th>    
       <c:forEach var="l" items="${lListarFases}" varStatus="contador">    
       <c:set var="ban3" value="0"/>
           <c:forEach var="l1" items="${lfasesTiposnotas}">
	      <c:if test="${l1.id_fase == l.id_fase}">
	         <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
		     <c:forEach var="l2" items="${lListaImpresion}">
	                <c:if test="${l2.nro_nota == nro_nota && l2.id_tipo_nota == l1.id_tipo_nota}">
                          <th><c:out value="${l1.tipo_nota}"/> (<c:out value="${nro_nota}"/>) </th>
			</c:if> 		   
		     </c:forEach>    
		    <c:set var="ban3" value="1"/>
		 </c:forEach>    
	      </c:if> 		 
           </c:forEach>
       </c:forEach>      
    </tr>
    <c:set var="reprobado" value="0"/>
    <c:set var="aprobado" value="0"/>
    <c:forEach var="lestudiante" items="${listaEstudiantes}" varStatus="contador">
      <tr>
        <td><c:out value="${contador.count}"/></td>    
        <td><c:out value="${lestudiante.id_estudiante}"/></td>    
	<td><c:out value="${lestudiante.nombres}"/></td>    
	<c:forEach var="l" items="${lListarFases}">
          <c:forEach var="l1" items="${lfasesTiposnotas}">
             <c:if test="${l.id_fase==l1.id_fase}">         
	        <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
		   <c:forEach var="l2" items="${lListaImpresion}">
		     <c:if test="${l2.nro_nota == nro_nota && l2.id_tipo_nota == l1.id_tipo_nota && l1.id_fase == l2.id_fase}">
	                <c:set var="cols" value="0"/>
	                <c:forEach var="lnota" items="${levalContinua}" varStatus="contador1">
	                    <c:if test="${l2.id_fase==lnota.id_fase && lnota.id_tipo_nota==l2.id_tipo_nota && lnota.nro_nota==nro_nota && lestudiante.id_estudiante==lnota.id_estudiante}">         
                                <td align="center"><c:out value="${lnota.nota}"/></td>
			         <c:set var="cols" value="1"/>
		            </c:if>
		        </c:forEach>     	
		        <c:if test="${cols==0}">         
	                   <td> &nbsp;</td>
	                </c:if> 		 	 
		    </c:if>  
		   </c:forEach>     	     
	        </c:forEach>
             </c:if> 
          </c:forEach>       	  		 
        </c:forEach>       
      </tr>  
    </c:forEach>    
  </table>      
<%@ include file="../../Inferior.jsp" %>