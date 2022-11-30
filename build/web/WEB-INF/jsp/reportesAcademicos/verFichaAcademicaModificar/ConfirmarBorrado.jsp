<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<head>
  <title>Sistema Integrado - Moxos</title>
  <link rel="stylesheet" href="<c:url value='/pagina.css'/>" type="text/css">
  <link rel="stylesheet" href="<c:url value='/basico.css'/>" type="text/css">
</head>
<body>
<div class="titulo">Administraci&oacute;n de Notas - Eliminando</div>
<div class="volver"><a href="javascript:history.back();">Volver</a></div>

<form method="post" action="registrarBorrado.fautapo">  
  <input type="hidden" name="_yabe"              value="<c:out value="${_yabe}"/>">
  <input type="hidden" name="gestion"            value="<c:out value="${lFichaAcademica.gestion}"/>">
  <input type="hidden" name="periodo"            value="<c:out value="${lFichaAcademica.periodo}"/>">
  <input type="hidden" name="id_estado"          value="<c:out value="${lFichaAcademica.id_estado}"/>">  
  <input type="hidden" name="nota"               value="<c:out value="${lFichaAcademica.nota}"/>">
<table class="formulario">
<tr>
  <th colspan="3">DATOS CALIFICACION ASIGNATURA</th>
</tr>
<tr>
  <td class="etiqueta">Sigla</td>
  <td class="etiqueta">::</td>
  <td><c:out value="${lFichaAcademica.sigla}"/></td>
</tr>
<tr>
  <td class="etiqueta">Materia</td>
  <td class="etiqueta">::</td>
  <td><c:out value="${lFichaAcademica.materia}"/></td>
</tr>
<tr>
  <td class="etiqueta">Gestión</td>
  <td class="etiqueta">::</td>
  <td><c:out value="${lFichaAcademica.periodo}"/> - <c:out value="${lFichaAcademica.gestion}"/></td>
</tr>
<tr>
  <td class="etiqueta">Tipo Evaluacion</td>
  <td class="etiqueta">::</td>
     <c:forEach var="tipo" items="${lListarTiposEvaluaciones}" >
          <c:if test="${tipo.tipo_evaluacion==lFichaAcademica.tipo_evaluacion}">
		      <td><input type="hidden" name="id_tipo_evaluacion" value="<c:out value="${tipo.id_tipo_evaluacion}"/>"> <c:out value="${tipo.id_tipo_evaluacion}"/>-<c:out value="${lFichaAcademica.tipo_evaluacion}"/></td>
		  </c:if>		  
      </c:forEach>  
</tr>
<tr>
  <td class="etiqueta">Estado</td>
  <td class="etiqueta">::</td>
  <td><c:out value="${lFichaAcademica.estado}"/></td>
</tr>
<tr>
  <td class="etiqueta">Observación</td>
  <td class="etiqueta">::<font color='red'>(*)</font></td>
  <td><input type="text" name="observacion" value="<c:out value="${lFichaAcademica.observacion}"/>"></td>
</tr>
</table>
<center>
  <input type="submit" value="Siguiente" class="siguiente">
</center>

</form>
</body>
</html>