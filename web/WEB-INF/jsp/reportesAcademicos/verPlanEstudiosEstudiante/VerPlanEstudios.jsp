<%@ include file="../../Superior.jsp" %>

<div class="titulo">Ver Plan de Estudios</div>
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

<c:forEach var="lista" items="${lMateriasNroRequisitos}" varStatus="contador2">
</c:forEach>

<c:forEach var="lista" items="${lMateriasNroRequisitos}" varStatus="contador3">
</c:forEach>

<c:forEach var="lista" items="${nivel_academico}" varStatus="contador4">
</c:forEach>

<center>
<form name="forma" method="post">
  <table class="tabla" >
    <tr>
      <c:forEach var="nivel" begin="1" end="${nivel_academico}">
        <th>Nivel <c:out value="${nivel}"/></th>
      </c:forEach>
    </tr>
    <c:forEach var="lista" items="${materias}" varStatus="contador5">
    <tr>
      <c:forEach var="nivel" begin="1" end="${nivel_academico}">
        <td align="middle" id="<c:out value="${materias[contador5.count-1][nivel-1].id_materia}"/>" onClick="SeleccionarMateria(this,1)">
         <b><c:out value="${materias[contador5.count-1][nivel-1].sigla}"/></b>
         <br><c:out value="${materias[contador5.count-1][nivel-1].materia}"/>
        </td>
      </c:forEach>
    </tr>
    </c:forEach>
  </table>
</form>
</center>

<br>
<br>
<br>
<br>
Presione sobre la materia para ver sus pre-requisitos
<script>
  var seleccionado = 0;
  <c:set var="valor" value="0"/>
  var materias_nro_requisitos = new Array();
  <c:forEach var="lista" items="${lMateriasNroRequisitos}" varStatus="contador2">
    materias_nro_requisitos[<c:out value="${lista.id_materia}" />]=<c:out value="${lista.numero}" />;
  </c:forEach>
  var materias_requisitos = new Array();
  <c:forEach var="lista" items="${lMateriasRequisitos}" varStatus="contador2">
    materias_requisitos[<c:out value="${lista.id_materia}" />]=new Array();
  </c:forEach>
  <c:forEach var="lista" items="${lMateriasRequisitos}" varStatus="contador2">
    <c:if test='${valor!=lista.id_materia}'>
      <c:set var="indice" value="0"/>
    </c:if>
    <c:if test='${valor==lista.id_materia}'>
      <c:set var="indice" value="${indice+1}"/>
    </c:if>
    <c:set var="valor" value="${lista.id_materia}"/>
    materias_requisitos[<c:out value="${lista.id_materia}" />][<c:out value="${indice}" />]=<c:out value="${lista.id_materia_ant}" />;
  </c:forEach>

  function SeleccionarMateria(a,s){
    var i;
    if ((seleccionado!=0)&&(s==1)) {
      DesSeleccionarMateria(document.getElementById(seleccionado));
    }
    if(a.id!=0) {
      if(s==1) { a.className='materiaSeleccionada'; seleccionado=a.id; }
      else a.className='materiaRequisito';
      for (i=0; i<materias_nro_requisitos[a.id]; i++){
        SeleccionarMateria(document.getElementById(materias_requisitos[a.id][i]),0);
      }
    }
  }
  function DesSeleccionarMateria(a) {
    var i;
    a.className='';
    for (i=0; i<materias_nro_requisitos[a.id]; i++) {
      DesSeleccionarMateria(document.getElementById(materias_requisitos[a.id][i]));
    }
  }
</script>

<%@ include file="../../Inferior.jsp" %>