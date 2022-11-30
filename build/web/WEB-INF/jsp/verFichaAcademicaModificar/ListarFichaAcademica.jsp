<%@ include file="../../Superior.jsp" %>

<jsp:useBean id="now" class="java.util.Date" />
<div class="titulo">Ver Ficha Acad&eacute;mica</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>
<head>
  <title>Sistema Integrado - Moxos</title>
  <link rel="stylesheet" href="<c:url value='/pagina.css'/>" type="text/css">
  <link rel="stylesheet" href="<c:url value='/basico.css'/>" type="text/css">
</head>

<form name="forma" action="nuevoRegistro.fautapo" method="post">
  <input type="hidden" name="_yabe" value="">
  <input type="hidden" name="id_estudiante"        value="<c:out value="${datosEstudiante.id_estudiante}"/>">
 
<table class="tabla">
  <tr>
    <th>RU</th>
    <td class="colb"><c:out value="${datosEstudiante.id_estudiante}"/></td>
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
    <th>Plan</th>
    <td class="colb"><c:out value="${datosEstudiante.id_plan}"/>
  </tr>
</table>

<h4>Listado de Materias Cursadas</h4>

<table class="tabla">
  <tr>
    <th>NRO.</th>
    <th>GESTION</th>
    <th>PLAN</th>
    <th>NIVEL</th>
    <th>SIGLA</th>
    <th>MATERIA</th>
    <th>TIPO EVAL</th>
    <th>NOTA</th>
    <th>OBSERVACION</th>
	<th>MODIFICAR</th>
	<th>ELIMINAR</th>
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
     <td><c:out value="${lista.tipo_evaluacion}"/></td>
	 
    <c:if test="${(lista.id_estado == 'R') || (lista.id_estado == 'D')}" >
      <td><font color="red"><c:out value="${lista.nota}"/></font></td>	
      <td><font color="red"><c:out value="${lista.estado}"/></td>
	  
    </c:if>    
    
    <c:if test="${lista.id_estado == 'A'}">
      <td><c:out value="${lista.nota}"/></td>
      <td><c:out value="${lista.estado}"/></td>
    </c:if>
	
    <c:if test="${lista.id_estado == 'C'}">
      <td><c:out value="${lista.nota}"/></td>
      <td><c:out value="${lista.estado}"/></td>
    </c:if>

    <td><div class="modificar">
          <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action='modificaRegistro.fautapo';document.forma._yabe.value='<c:out value="${lista.id_nota}"/>'">Modificar</a>
        </div>
    </td>
    <td><div class="eliminar">
          <a href="javascript: document.forma.submit()" OnClick="javascript: document.forma.action='confirmarBorrado.fautapo';document.forma._yabe.value='<c:out value="${lista.id_nota}"/>'">Eliminar</a>
        </div>
    </td>

   </tr>
 </c:forEach>
</table>
<br>

  <tr>
    <tr>
    <td colspan="2" algin="right"> 
      <c:out value='Trinidad'/>, <a href='javascript: window.print()'><fmt:formatDate value="${now}" type="date" dateStyle="long"/>
    </td>
  </tr>

<table>

<%@ include file="../../Inferior.jsp" %>