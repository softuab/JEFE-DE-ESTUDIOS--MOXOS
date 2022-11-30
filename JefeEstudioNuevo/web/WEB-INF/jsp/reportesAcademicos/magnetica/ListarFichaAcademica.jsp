<%@ include file="../../Superior.jsp" %>
<style>    input{background-color:red} </style>

<body onload='inicio(document.forma.id_persona)'>
<table border="0" align="center" class="tabla">
<tr>
<td valign="top">
<table class="tabla" align="center">
  <tr>
    <th>RU</th>
    <td class="colb"><c:out value="${datosEstudiante.id_estudiante}"/></td>
  </tr>    
  <tr>
    <th>Estudiante</th>
    <td class="colb">
      <c:out value="${datosEstudiante2.nombres}"/> &nbsp; 
      <c:out value="${datosEstudiante2.paterno}"/> &nbsp;
      <c:out value="${datosEstudiante2.materno}"/>
    </td>
  </tr>    
  <tr>
    <th>Programa</th>
    <td class="colb"><c:out value="${datosPrograma.programa}"/>
  </tr>    
  <tr>
    <th>Plan</th>
    <td class="colb"><c:out value="${datosEstudiante.id_plan}"/>
  </tr>      
  <c:forEach var="listaFoto" items="${lImagenes}" varStatus="contador"> 
          <tr>
            <td align="center" colspan="2" valign="top"> 
              <img  src='<c:url value="/"/>adjuntosMi/fotosEstudiantes/<c:out value="${listaFoto.adjunto}"/>' width="100" height="100" border="1"/>
            </td>
          </tr>
  </c:forEach>  
</table>  
</td>

<td valign="top">
<table class="tabla" align="center">  
    <form name=forma action="<c:url value="/magnetica/Entrada.fautapo"/>" method="POST">
    <input type="hidden" value="<c:out value='${registro}'/>" name="registro">

    <tr>   
	<th rowspan="8" valign="top">  <img src="../imagenes/logos/lector.gif" border="0" ALT="TARJETA"> </th>
    </tr>
    
    <tr>
	<th><input type="password" name="id_persona"></th>
    </tr>
    <tr>
        <th align="center" colspan="2">
	    <font color="#0B1D84">
	    <h3>INSERTE SU TARJETA MAGN&Eacute;TICA</h3>
	    <h3>PARA SALIR</h3>
	    </font>
	</th>	
     </tr>            

    </form>
</table>
</td>
<tr>

</table>

<div class="titulo">Ficha Acad&eacute;mica del Estudiante</div>
<h4>Listado de Materias Cursadas</h4>
<table class="tabla">
  <tr>
    <th>NRO.</th>
    <th>GESTION</th>
    <th>PLAN</th>
    <th>NIVEL</th>
    <th>SIGLA</th>
    <th>MATERIA</th>
    <th>NOTA</th>
    <th>TIPO_EVAL.</th>    
    <th>OBSERVACION</th>
  </tr>
  <c:forEach var="lista" items="${lFichaAcademica}" varStatus="contador">
    <!-- ********** Esto es para el efecto ************ -->
      <tr <c:if test="${(contador.count mod 2) == 0}">bgColor="#FFFFD9" %-- Est&acute;tico :( --%</c:if> onMouseOver="this.className='sobreFila'" onmouseout="this.className=''">
    <!-- ********** Fin  efecto ************ -->
    <td><c:out value="${contador.count}"/></td>
    <td><c:out value="${lista.periodo}"/>-<c:out value="${lista.gestion}"/></td>
    <td><c:out value="${lista.id_plan}"/></td>
    <td><c:out value="${lista.nivel_academico}"/></td>
    <td><c:out value="${lista.sigla}"/></td>
    <td><c:out value="${lista.materia}"/></td>
    <c:if test="${(lista.id_estado == 'R') || (lista.id_estado == 'D')}" >
      <td><font color="red"><c:out value="${lista.nota}"/></font></td>
<!--      <td></td> -->
    </c:if>
    <c:if test="${lista.id_estado == 'A'}">
      <td><c:out value="${lista.nota}"/></td>
<!--      <td> </td> -->
    </c:if>
    <c:if test="${lista.id_estado == 'C'}">
      <td><c:out value="${lista.nota}"/></td>
<!--      <td><c:out value="${lista.nro_resolucion}"/></td> -->
    </c:if>
      <td><c:out value="${lista.tipo_evaluacion}"/></td>    
      <td><c:out value="${lista.observacion}"/></td>
   </tr>
 </c:forEach>
</table>
<br>

<h4>Listado de Materias Convalidadas Autom&aacute;ticamente</h4>
<table class="tabla">
  <tr>
    <th>NRO.</th>
    <th>NIVEL</th>
    <th>SIGLA</th>
    <th>MATERIA</th>
    <th>NOTA</th>
  </tr>
  <c:forEach var="lista1" items="${lFichaAcademicaConvalidada}" varStatus="contador">
    <tr>
      <td><c:out value="${contador.count}"/></td>
      <td><c:out value="${lista1.nivel_academico}"/></td>
      <td><c:out value="${lista1.sigla}"/></td>
      <td><c:out value="${lista1.materia}"/></td>
      <td><c:out value="${lista1.nota}"/></td>
   </tr>
 </c:forEach>
 <tr>
<table>
