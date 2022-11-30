<%@ include file="../../Superior.jsp" %>
<jsp:useBean id="now" class="java.util.Date"/>
<table border="0" width="95%" align="center">
  <tr>
    <td width="90%">
      <form name="fvolver" action="<c:url value='/postulantes/entradaBuscarPst.fautapo'/>" method="post">
        <div><a href="javascript:document.fvolver.submit();">
        <IMG SRC='<c:url value="/"/>imagenes/logos/membrete_uap.bmp' width="100%" height="100%" border="0" ALT="logo institucion"></a></div>
    </td>
  </tr>
</table>

<body>
<center>
  <h1><b>FORMULARIO DE ADMISIÓN ESPECIAL</h1>
</center>

<table  border="0" width="100%">  
  <tr>
    <td width="100%">
      <table class="tabla"  width="100%" border=0 cellpadding=0>
        <tr>
          <th  colspan="3" align="center"><h3>SOLICITUD DE ADMISIÓN</h3></th> 
        </tr>      
        <tr>
          <td><b>POSTULANTE :</b>&nbsp;<c:out value="${datosPostulante.paterno}"/>&nbsp;<c:out value="${datosPostulante.materno}"/>&nbsp;<c:out value="${datosPostulante.nombres}"/>
          </td> 
          <td><b>R.P. :</b>&nbsp;<c:out value="${datosPostulante.id_postulante}"/>
          </td> 
          <td><b>Fecha :</b>&nbsp;<a href='javascript:window.print()'><fmt:formatDate value="${datosPostulante.fec_registro}" pattern="${formatoFecha}"/></a></td>
        </tr>       
        <tr>
          <td><b>FACULTAD :</b>&nbsp;<c:out value="${datosPostulante.facultad}"/>
          </td> 
          <td colspan="2"><b>CARRERA :</b>&nbsp;<c:out value="${datosPostulante.programa}"/>
          </td> 
        </tr>
        <tr>
          <td colspan="3"><b>MODALIDAD DE ADMISION :</b>&nbsp;<c:out value="${datosPostulante.tipo_admision}"/> </td>
        </tr>
        <tr>
          <td colspan="3"><b>DESCRIPCIÓN DE MODALIDAD DE ADMISION :</b>&nbsp;<c:out value="${datosPostulante.tipo_admision}"/> </td>
        </tr>
        <tr>
          <td colspan="3">
          <p>Que estando comprendido en el Reglamento General de R&eacute;gimen Estudiantil de la Universidad Aut&oacute;noma del Beni "José Ballivián", 
          <p>solicito la admisi&oacute;n a la U.A.B. en la presente gesti&oacute;n dentro de la modalidad de admisi&oacute;n especial.
          <br><br><br><br>
          <center>
          _________________________<br>
          Firma Interesado
          </center>
          </td>
        </tr>
        <tr>
          <th  colspan="3" align="center"><h3>INFORME DE PLAZA CARRERA SOLICITADA</h3></th> 
        </tr>      
        <tr>
          <td colspan="3"><b>LA SECCIÓN DE REGISTROS E INSCRIPCIONES :</b> </td>
        </tr>
        <tr>
          <td width="65%"colspan="2">
           <p>Informa que de acuerdo a resoluci&oacute;n del H.C.U.  en
           <p>relaci&oacute;n de cantidad de estudiantes que la Carrera
           <p>acepta para la presente gesti&oacute;n, se ha verificado la
           <p>disponibilidad de plaza al programa solicitado.
           <br><br><br>
           <b>Fecha :&nbsp; <fmt:formatDate value="${datosPostulante.fec_registro}" pattern="${formatoFecha}"/></b>
          </td> 
          <td width="35%" ><br><br><br><br><br><br><br><br><br><br><br>
           <center>
           _______________________<br>
           Firma Registros e Inscripciones
           </center>
          </td> 
          
        </tr>
        <tr>
          <th colspan="3"><h3>AUTORIZACION DE ADMISION ESPECIAL</h3></th>
        </tr>
        <tr>
          <td colspan="3"><b>LA DIRECCION DE PLANIFICACIÓN ACADÉMICA :</b>&nbsp;<c:out value=""/> </td>
        </tr>
        <tr>
          <td width="65%" colspan="2">
            <p>Autoriza al (a la) solicitante  la admisi&oacute;n especial
            <p>bajo la modalidad de :
            <p> <b><c:out value="${datosPostulante.tipo_admision}"/></b>
            <p>por lo tanto puede registrarse como estudiante regular a la
            <p> a la Carrera Solicitada:
             
            <p><b><c:out value="${datosPostulante.programa}"/></b>
           <br><br><br>
           <b>Fecha :&nbsp;............/............/............</b>
          </td> 
          <td width="35%"><br><br><br><br><br><br><br><br><br><br><br><br>
           <center>
           _______________________<br>
           Firma
           </center>
          </td> 
             
        </tr>
      </table>
    </td>
  </tr>
</table>          
        
<%@ include file="../../Inferior.jsp" %>