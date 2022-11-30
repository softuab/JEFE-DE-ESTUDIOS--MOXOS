<%@ include file="../../Superior.jsp" %>
<script language='JavaScript' SRC="./validar.js">  </script>
<jsp:useBean id="now" class="java.util.Date"/>
<head>
<STYLE>
H1.SaltoDePagina
{
PAGE-BREAK-AFTER: always
}
</STYLE>
</head>

<!-- PARA LA PAGINACION -->
<c:set var="nroEstudiantes" value="0"/>
<c:set var="paginas2" value="0"/>
<c:set var="aux" value="0"/>

<c:forEach var="lestudiante" items="${listaEstudiantes}" varStatus="contador">

<c:set var="nroEstudiantes" value="${nroEstudiantes + 1}"/>
<c:set var="aux" value="${aux +1}"/>
	    <c:if test="${aux == paginacion}">
	    <c:set var="aux" value="0"/>
	    <c:set var="paginas2" value="${paginas2 +1}"/>
	    </c:if>
</c:forEach>
    <c:if test="${aux > 0}">
	        <c:set var="paginas2" value="${paginas2 +1}"/>
    </c:if>
<c:forEach var="pagina" begin="1" end="${paginas2}">

<!--   ENCABEZADO GENERAL     -->


<!--  Encabezado.....  -->
<table border="0" width="100%">
  <tr>
    <td width="14%" align="center">
      <img width="50%" src="<c:url value='${datosInstitucion.logo}'/>" border="4" ALT="logo institucion">
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

      <td align="center"><h1><b>PLANILLA DE CALIFICACIONES</h1></b></td>  

        </tr>
      </table>
    </td>
    <td width="14%">
      Fecha : <a href='javascript: window.print()'><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></a> 
    </td>
  </tr>
  <tr>
  <td></td>
  <td></td>
  <td>pagina  <c:out value='${pagina}'/> / <c:out value="${paginas2}"/></td>
  </tr>
</table>
<!--  Encabezado.....  -->
<hr>
<br>
<br>

<!--  DATOS ASIGNATURA  -->
  
<table border="0" width="97%">
    <tr>
     <th align="right">FACULTAD ::</th>
     <td><c:out value="${datosFacultad.facultad}"/></td>
      <th align="right">EVALUACION ::</th>
      <td><c:out value="${datosAsignacion.tipo_evaluacion}"/></td>
          
    </tr>
 
 <tr>
      <th align="right">CARRERA ::</th>
      <td><c:out value="${datosPrograma.programa}"/></td>     
 
      <th align="right">PERIODO ::</th>
      <td><c:out value="${datosAsignacion.periodo}"/></td>
           
 </tr>  
 
  <tr>
      <th align="right">DOCENTE ::</th>
      <td><c:out value="${datosDocente.nombre_completo}"/></td>
  
      <th align="right">GESTION ::</th>
      <td><c:out value="${datosAsignacion.gestion}"/></td>
  
  </tr>  
  <tr>
      <th align="right">ASIGNATURA ::</th>
      <td><c:out value="${datosAsignacion.sigla}"/> - <c:out value="${datosAsignacion.materia}"/></td>
  
      <th align="right">GRUPO ::</th>
      <td><c:out value="${datosAsignacion.grupo}"/></td>
  </tr>
   <tr>
      <th align="right">NIVEL ACADEMICO ::</th>
      <td><c:out value="${datosAsignacion.nivel_academico}"/></td>
  
      <th align="right"> </th>
      <td> </td>
  </tr>      
  </table>

<!--  DATOS ASIGNATURA  -->  


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
	          <c:if test="${l2.id_tipo_nota == l1.id_tipo_nota && l2.numero == 1}">
                     <c:set var="cols" value="${cols + 1}"/>
		  </c:if> 		            
		  <c:if test="${l2.id_tipo_nota == l1.id_tipo_nota && l2.numero == 2}">
                     <c:set var="cols" value="${cols + 1}"/>
		  </c:if> 		            
		  <c:if test="${l2.id_tipo_nota == l1.id_tipo_nota && l2.numero == 3}">
                     <c:set var="cols" value="${cols + 1}"/>
		  </c:if> 		            
               <c:if test="${l2.id_tipo_nota == l1.id_tipo_nota && l2.numero == 4}">
                     <c:set var="cols" value="${cols + 1}"/>
		  </c:if> 		            
	       </c:forEach>  
	   </c:if> 		       
         </c:forEach>
         
	 <c:forEach var="l2" items="${lListaImpresion}">
	    <c:if test="${l2.id_fase == l.id_fase && l2.numero == 1}">
              <c:set var="bandera" value="1"/>
	    </c:if> 		            
	    <c:if test="${l2.id_fase == l.id_fase && l2.numero == 2}">
              <c:set var="bandera" value="1"/>
	    </c:if> 		            
	    <c:if test="${l2.id_fase == l.id_fase && l2.numero == 3}">
              <c:set var="bandera" value="1"/>
	    </c:if> 		            
	       <c:if test="${l2.id_fase == l.id_fase   && l2.numero == 4}">
                     <c:set var="bandera" value="1"/>
		  </c:if> 		            
	 
	 </c:forEach>  
	 <c:if test="${bandera == 1}">
            <th  <c:if test="${cols > 0}"> colspan="${cols}" </c:if> ><c:out value="${l.fase}"/></th>      
	 </c:if> 		            
      </c:forEach>
    
<th rowspan="2">Nota Final</th> 
<th rowspan="2">Observacion Final</th> 
    
    </tr>
    <tr>
       <th >Nro.</th>    
       <th >R.U.</th>    
       <th >Nombres</th>    
       <c:forEach var="l" items="${lListarFases}" varStatus="contador">  
       <c:set var="ban3" value="0"/>
       
         <!--LISTAR FASES TIPOS NOTAS  -->
       <c:forEach var="l1" items="${lfasesTiposnotas}">
       
	      <c:if test="${l1.id_fase == l.id_fase && l.id_fase <=datosAsignacion.id_fase }">
	   
	        <th    colspan="${l1.cantidad}" nowrap><c:out value="${l1.tipo_nota}"/> </th>
	        <!--
	         <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
	         	  	
		    
		      <c:forEach var="l2" items="${lListaImpresion}">	              	              
	                <c:if test="${l2.nro_nota == nro_nota && l2.id_tipo_nota == l1.id_tipo_nota && l2.numero == 1}">
                          <th nowrap><c:out value="${l1.tipo_nota}"/>-<c:out value="${nro_nota}"/>&ordm;<br>(Evaluada) </th>
			        </c:if>      
	         </c:forEach>
	        
		 <c:set var="ban3" value="1"/>
		 </c:forEach>
		  -->    
	      </c:if> 		 
           </c:forEach>
           
	   
	   <c:forEach var="l1" items="${lfasesTiposnotas}">
	      <c:if test="${l1.id_fase == l.id_fase}">
	         <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
		     <c:forEach var="l2" items="${lListaImpresion}">
	                <c:if test="${l2.nro_nota == nro_nota && l2.id_tipo_nota == l1.id_tipo_nota && l2.numero == 2}">
                          <th nowrap><c:out value="${l1.tipo_nota}"/>2222-<c:out value="${nro_nota}"/>&ordm;<br>(Ponderada)<br><fmt:formatNumber value="${l1.ponderacion/l1.cantidad}" pattern ="#.00"/> % </th>
			</c:if>
		     </c:forEach>    
		    <c:set var="ban3" value="1"/>
		 </c:forEach>    
	      </c:if> 		 
           </c:forEach>
	   
<!--   NOTA PROMEDIADA PONDERADA      -->
          <c:forEach var="l1" items="${lfasesTiposnotas}">
	      <c:if test="${l1.id_fase == l.id_fase}">
	         <c:forEach var="nro_nota" begin="1" end="1">
		     <c:forEach var="l2" items="${lListaImpresion}">
	                <c:if test="${l2.nro_nota == nro_nota && l2.id_tipo_nota == l1.id_tipo_nota && l2.numero == 4}">
		       <th nowrap><c:out value="${l1.tipo_nota}"/>-<c:out value="${nro_nota}"/>&ordm;<br>(Ponderada)<br><c:out value="${l1.ponderacion}"/> % </th>
			</c:if>
		     </c:forEach>    
		    <c:set var="ban3" value="1"/>
		 </c:forEach>    
	      </c:if> 		 
           </c:forEach>
<!--   -->
	   <c:forEach var="l1" items="${lfasesTiposnotas}">
	      <c:if test="${l1.id_fase == l.id_fase}">
	         <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
		     <c:forEach var="l2" items="${lListaImpresion}">
	                <c:if test="${l2.nro_nota == nro_nota && l2.id_tipo_nota == l1.id_tipo_nota && l2.numero == 3}">
			  <th>NOTA FINAL <br><c:out value="${l.fase}"/></th>
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
   

<!--   FIN ENCABEZADOS   GENERAL  -->
<!--- LISTA DE ESTUDIANTES -->
<c:set var="desde" value="${pagina * paginacion -paginacion}"/>                
                        <c:set var="hasta" value="${pagina * paginacion}"/>
<c:forEach var="lestudiante" items="${listaEstudiantes}" varStatus="contador">
                        
                <c:if test="${contador.count> desde && contador.count <=hasta}">     

<tr>
        <td><c:out value="${contador.count}"/></td>    
        <td><c:out value="${lestudiante.id_estudiante}"/></td>    
	<td><c:out value="${lestudiante.nombres}"/></td>    
	
      <c:forEach var="l" items="${lListarFases}">
      
        <c:forEach var="l1" items="${lfasesTiposnotas}">
             <c:if test="${l.id_fase==l1.id_fase}">         
	        <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
		   <c:forEach var="l2" items="${lListaImpresion}">
		     <c:if test="${l2.nro_nota == nro_nota && l2.id_tipo_nota == l1.id_tipo_nota && l1.id_fase == l2.id_fase && l2.numero == 1}">
	                <c:set var="cols" value="0"/>
	                <c:forEach var="lnota" items="${lEstudiantesEvaluacion}" varStatus="contador1">
	                    <c:if test="${l2.id_fase==lnota.id_fase && lnota.id_tipo_nota==l2.id_tipo_nota && lnota.nro_nota==nro_nota && lestudiante.id_estudiante==lnota.id_estudiante}">         
                                <td align="center"><c:out value="${lnota.nota}"/></td>
			         <c:set var="cols" value="1"/>
		            </c:if>
		        </c:forEach>     	
		        <c:if test="${cols==0}">         
	                   <td align="center"> 0.0&nbsp;</td>
	                </c:if> 		 	 
		    </c:if>  
		   </c:forEach>     	     
	        </c:forEach>
             </c:if> 
          </c:forEach> 
      	  		 
                    
	  <c:forEach var="l1" items="${lfasesTiposnotas}">
             <c:if test="${l.id_fase==l1.id_fase}">         
	        <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
		   <c:forEach var="l2" items="${lListaImpresion}">
		    <c:if test="${l2.nro_nota == nro_nota && l2.id_tipo_nota == l1.id_tipo_nota && l1.id_fase == l2.id_fase && l2.numero == 2}">
	                <c:set var="cols" value="0"/>
	                <c:forEach var="lnota" items="${lEstudiantesEvaluacion}" varStatus="contador1">
	                    <c:if test="${l2.id_fase==lnota.id_fase && lnota.id_tipo_nota==l2.id_tipo_nota && lnota.nro_nota==nro_nota && lestudiante.id_estudiante==lnota.id_estudiante}">         
                                <td align="center"><c:out value="${lnota.nota_ponderada}"/></td>
			         <c:set var="cols" value="1"/>
		            </c:if>
		        </c:forEach>     	
		        <c:if test="${cols==0}">         
	                   <td align="center"> 0.0&nbsp;</td>
	                </c:if> 		 	 
		    </c:if>
		   </c:forEach>     	     
	        </c:forEach>
             </c:if> 
          </c:forEach>
          
	  <!--   NOTA FINAL PONDERADA         -->	  
	  <c:forEach var="l1" items="${lfasesTiposnotas}">
             <c:if test="${l.id_fase==l1.id_fase}">         
	        <c:forEach var="nro_nota" begin="1" end="1">
		   <c:forEach var="l2" items="${lListaImpresion}">
		    <c:if test="${l2.nro_nota == nro_nota && l2.id_tipo_nota == l1.id_tipo_nota && l1.id_fase == l2.id_fase && l2.numero == 4}">
	                <c:set var="cols" value="0"/>
	                <c:forEach var="lnota" items="${lEstudiantesEvaluacion}" varStatus="contador1">
	                    <c:if test="${l2.id_fase==lnota.id_fase && lnota.id_tipo_nota==l2.id_tipo_nota && lnota.nro_nota==nro_nota && lestudiante.id_estudiante==lnota.id_estudiante}">         
                                <td align="center"><c:out value="${lnota.nota_final_ponderada}"/></td>
			         <c:set var="cols" value="1"/>
		            </c:if>
		        </c:forEach>     	
		        <c:if test="${cols==0}">         
	                   <td align="center">0.0 &nbsp;</td>
	                </c:if> 		 	 
		    </c:if>
		   </c:forEach>     	     
	        </c:forEach>
             </c:if> 
          </c:forEach>
	  
	  
	  
	  <!-- NOTA FINAL -->       	  		 
	  <c:forEach var="l1" items="${lfasesTiposnotas}">
             <c:if test="${l.id_fase==l1.id_fase}">         
	        <c:forEach var="nro_nota" begin="1" end="${l1.cantidad}">
		   <c:forEach var="l2" items="${lListaImpresion}">
		    <c:if test="${l2.nro_nota == nro_nota && l2.id_tipo_nota == l1.id_tipo_nota && l1.id_fase == l2.id_fase && l2.numero == 3}">
	                <c:set var="cols" value="0"/>
	                <c:forEach var="lnota" items="${lEstudiantesEvaluacion}" varStatus="contador1">
	                    <c:if test="${l2.id_fase==lnota.id_fase && lnota.id_tipo_nota==l2.id_tipo_nota && lnota.nro_nota==nro_nota && lestudiante.id_estudiante==lnota.id_estudiante}">         
                                <td align="center"><c:out value="${lnota.nota_final}"/></td>
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
	  <!-- FIN NOTA FINAL -->
	  
	  
	  
	  
	  <!--  OBSERVACION FINAL       -->
	  
	    
      
	  
	  
	  
      
      
      
          </c:forEach>    
	         <c:set var="cols2" value="0"/>
            <c:forEach var="lnota2" items="${lEvaluacionesf}" varStatus="contador1">
	          <c:if test="${'1000'== lnota2.id_fase && lestudiante.id_estudiante==lnota2.id_estudiante }">                  
          	           <td align="center"><c:out value="${lnota2.nota}"/></td>
	          	   <td align="center"><c:out value="${lnota2.estado}"/></td>
	          	   <c:set var="cols2" value="1"/>
                  </c:if>
	      </c:forEach>
	       <c:if test="${cols2==0}">         
	                   <td align="center"> - </td>
                          <td align="center"> - </td>
	       </c:if>
               
               
      </tr>         
     </c:if> 
    </c:forEach>    
<!--- FIN LISTA DE ESTUDIANTES -->



  
  </table>  
  
  
  
  <!--OBSERVACIONES -->  
  <c:if test="${pagina== paginas2}">   
   <br>
  <br>
  <br>


<table border="0"  width="100%">
  <tr>
  <th  align="center">
__________________________________________
     <br> <c:out value="${datosDocente.nombre_completo}"/>
     <br>
DOCENTE
  </th>
  <td align="center">
  
<table class ="tabla">  
  <th>  OBSERVACIONES</th>
  
 
  <tr><td><br></td></tr>
 <tr><td><br></td></tr>
  <tr><td>______________________________________________________________________________</td></tr>
</table>  
  </td>
  <td align="center">
    <table class="tabla">
      <tr>
        <th colspan="4">RESUMEN DE RENDIMIENTO</th>
      </tr>
      <tr>
        <th>APROBADOS</th>
        <th>REPROBADOS</th>
       <!-- <th>ABANDONOS</th>-->
        <th>TOTAL</th>
      </tr>
      <c:forEach var="lista" items="${lTotales}" varStatus="contador">
        <tr>
          <td align="center"><c:out value="${lista.aprobados}"/></td>
          <td align="center"><c:out value="${lista.reprobados}"/></td>
          <!--<td align="center"><c:out value="${lista.abandonos}"/></td>-->
          <td align="center"><c:out value="${lista.cantidad}"/></td>
        </tr>
      </c:forEach>
    </table>
 </td>
  </tr>
 </table>
  
 </c:if>
<!-- FIN OBSERVACIONES -->  
  <H1 class=SaltoDePagina> </h1>    


  
  </c:forEach>
 

  
  
  
  
  

<%@ include file="../../Inferior.jsp" %>
