<%@ include file="../Superior.jsp" %>

<!-- ************  Titulo  ********** -->
  <table>
       <tr >
           <td rowspan="2" width="20%">
            <IMG SRC="<c:url value='${logo}'/>" width="70" height="70" border="0" ALT="logo institucion">
          </td>
          <td width="60%">
             <center><h6><c:out value='${institucion}'/></h6></center>
          </td>
          <td rowspan="2" width="20%">
          <script>
               var mydate=new Date();
               var year=mydate.getYear();
               if (year < 1000)
                 year+=1900;
               var day=mydate.getDay();
               var month=mydate.getMonth()+1;
               if (month<10)
                 month="0"+month;
               var daym=mydate.getDate();
               if (daym<10)
               daym="0"+daym;
	       document.write("<sup>Pagina:</sup><sup>1</sup><br>");
               document.write("<sup>Fecha:<a href = 'javascript: window.print()'>" + daym+"/"+month+"/"+year+"</a></sup>");
    </script>
         <td>
        </tr>
  <tr> 
     <td>
       <label><center><h2><c:out value='${descripcion}' escapeXml='false'/></h2></center></label>
     </td>
    </table>    
<div class="titulo"></div>
<br>
<br>
<body onLoad="llama_suma();">
<!-- ************  fin Titulo  ********** -->
<!-- en caso de que exista tiene que sacar de sesion-->
     <table class="tabla" width='100%'>
       <tr class="bordeReporte" >
         <c:forEach var="lista" items="${valor}" varStatus="contador1">
           <th width="40px"><center><div><c:out value="${valor[contador1.index]}" escapeXml="False"/>&nbsp;&nbsp;</div></center></th>
	   <c:if test="${contador1.last}">
	     <c:set var="desc" value="${contador1.index}" />
	   </c:if>
         </c:forEach>
	 
	 <!-- AQUI COMIENZA EL LLENADO DE DATOS -->


         <c:forEach var="lista" items="${valores}" varStatus="contador1">
             <tr>  
	    <c:forEach var="lista1" items="${valor}" varStatus="contador2" >
	      <c:set var="cabeza" value="-1"/>              
	      <c:forEach var="cabezas" items="${headers}" varStatus="contador3">
                <c:if test="${cabezas==contador2.index}">
		  <c:set var="cabeza" value="${contador2.index}"/>
		</c:if>
              </c:forEach>
              <c:if test="${contador1.first}">
	        <td <c:if test="${izq_der[contador2.index]=='0'}">align="left"</c:if> <c:if test="${izq_der[contador2.index]!='0'}">align="right"</c:if>><c:out value='${datos[contador1.index][contador2.index]}'  escapeXml='false'/>  
	      </c:if>
              
	      <c:if test="${!contador1.first}">
	        <c:if test="${(datos[contador1.index][contador2.index]!=datos[contador1.index-1][contador2.index])}" >
	           <td <c:if test="${izq_der[contador2.index]=='0'}">align="left"</c:if> <c:if test="${izq_der[contador2.index]!='0'}">align="right"</c:if>><c:out value='${datos[contador1.index][contador2.index]}'  escapeXml='false' /></td>
	        </c:if>
	        <c:if test="${(datos[contador1.index][contador2.index]==datos[contador1.index-1][contador2.index])}" >
	          <c:if test="${cabeza==contador2.index}">
	            <td align="left">&nbsp;</td>
	          </c:if>
	          <c:if test="${cabeza!=contador2.index}">
	            <td <c:if test="${izq_der[contador2.index]=='0'}">align="left"</c:if> <c:if test="${izq_der[contador2.index]!='0'}">align="right"</c:if>><c:out value='${datos[contador1.index][contador2.index]}' escapeXml='false' /></td>
	          </c:if>
	        </c:if>
	      </c:if>


<!--aqui comienza el que coloca los valores de los niveles -->
                 
	      <c:if test="${(contador2.last)&&(suma_st!=null)}">
	        <c:forEach var="lista1" items="${valor}" varStatus="contador3">
		  <c:set var="contador3_1" value="${desc - contador3.index }" />
		  <c:set var="cabeza" value="-1"/>
	          <c:forEach var="cabezas" items="${headers}" varStatus="contador4">
                    <c:if test="${cabezas==contador3_1}">
		      <c:set var="cabeza" value="${contador3_1}"/>
		    </c:if>
		  </c:forEach>
		  <c:if test="${datos[contador1.index][cabeza]!=datos[contador1.index+1][cabeza]}">
		    <tr bgcolor="f0f0f0">
		    <c:forEach var="lista1" items="${valor}" varStatus="contador5">
		      <td>
		      <c:set var='suma' value="-1" />
		      <c:forEach var="sumast" items="${suma_st}" varStatus="contador6">
                        <c:if test="${sumast==contador5.index}">
                          <c:set var='suma' value='${contador5.index}' />
                        </c:if>
                      </c:forEach>
		      <c:if test="${contador5.index==suma}">
		        <div align="right" id='resultado_<c:out value="${cabeza}" />_<c:out value="${suma}" />_<c:out value="${contador1.index}" />' ></div>
		      </c:if>
		      <c:if test="${contador5.index==cabeza}">
		        <p class="etiqueta_rep">SubTotal </p>
		      </c:if>
		    </c:forEach>
                  </c:if>
		</c:forEach>
	      </c:if>
	
<!-- aqui termina lo que coloca los valores de los niveles -->
	      	
	  </c:forEach>
    </c:forEach>

    <c:if test="${(suma_st!=null)||(etiquetas_total!=null)}">
    <tr>
      <c:forEach var="lista" items="${valor}" varStatus="contador1">
        <c:if test="${contador1.last}">
          <td class="etiqueta_rep" colspan="<c:out value='${contador1.count}'/>">TOTALES
        </c:if>
      </c:forEach>
    <tr class="bordeReporte">
      <c:forEach var="lista" items="${valor}" varStatus="contador1">
        <td class="etiqueta_rep">
        <c:forEach var="sumast" items="${suma_st}" varStatus="contador5">
    	  <c:if test="${sumast==contador1.index}">
            <p ><div align="right" id='resultados_<c:out value="${contador1.index}" />' > </div></p>
	  </c:if>    
        </c:forEach>
	<c:forEach var="lista3" items="${etiquetas_total}" varStatus="contador3">
          <c:if test="${etiquetas_total[contador3.index]==valor[contador1.index]}">
            <p><div align="right"><c:out value='${valor_total[contador3.index]}'/> </div></p>
          </c:if>
        </c:forEach>	  
      </c:forEach>
    </c:if>  
    <tr class="bordeReporte">
      <c:forEach var="lista" items="${valor}" varStatus="contador1">
        <c:if test="${contador1.last}">
           <td colspan='<c:out value="${contador1.count}"/>'>
        </c:if>
      </c:forEach>
   </table>
<br>  
<br>
<br>
<script>
  var cant_dec = new Array();
  cd = 0;
  <c:forEach var="lista" items="${valor}" varStatus="contador1">
    cant_dec[cd]="<c:out value='${cant_dec[contador1.index]}' />";
    cd++;
  </c:forEach>

  var columna_suma = new Array();
  h = 0;
  <c:forEach var="lista" items="${valor}" varStatus="contador1">
    <c:forEach var="sumast" items="${suma_st}" varStatus="contador2">
      <c:if test="${sumast==contador1.index}">
        columna_suma[h] ="<c:out value='${contador1.index}' />";
        h++;
      </c:if>
    </c:forEach>
  </c:forEach>
  
  var columna_cabezera = new Array();
  hh=0;
  <c:forEach var="lista" items="${valor}" varStatus="contador1"> 
    <c:forEach var="cabezas" items="${headers}" varStatus="contador5">
      <c:if test="${cabezas==contador1.index}">
        columna_cabezera[hh] ="<c:out value='${contador1.index}' />";
        hh++;
      </c:if>
    </c:forEach>
  </c:forEach>

  <c:forEach var="lista" items="${valor}" varStatus="contador">
    <c:if test="${contador.last}">
      columna=<c:out value="${contador.count}" />;
    </c:if>
  </c:forEach>

  <c:forEach var="lista" items="${valores}" varStatus="contador">
    <c:if test="${contador.last}">
      fila=<c:out value="${contador.count}" />;
    </c:if>
  </c:forEach>

  var datos_matriz = new Array();
  hhh = 0;
  <c:forEach var="lista" items="${valores}" varStatus="contador1">
    datos_matriz[hhh]=new Array(
    <c:forEach var="lista1" items="${valor}" varStatus="contador2" >
      <c:if test="${contador2.first}">'<c:out value="${datos[contador1.index][contador2.index]}" />'</c:if>
      <c:if test="${!contador2.first}">,'<c:out value="${datos[contador1.index][contador2.index]}" />'</c:if>
    </c:forEach>);
    hhh++;
  </c:forEach>

 function suma_subtotal(){
   for (i=0;i<columna_cabezera.length; i++){
     cabezera=columna_cabezera[i];
     num_fila=0;
     while(num_fila< fila){
       cabeza = num_fila;
       for (k=0;k<columna_suma.length; k++){
         num_fila = cabeza;
         suma = 0;
         t = true;
         while((num_fila<fila)&&(t)){
           if(datos_matriz[cabeza][cabezera]==datos_matriz[num_fila][cabezera]){
             suma = suma + parseFloat(datos_matriz[num_fila][columna_suma[k]]);
	     ++num_fila;
           } else {
             t = false;
	   }
         }
         var objeto =document.getElementById("resultado_" + cabezera +"_" +columna_suma[k] + "_" + (num_fila-1)); 
	 //alert(objeto);
         objeto.innerHTML = redondear(suma,cant_dec[columna_suma[k]]);
       }
     }
   }
   suma_total();
 }


 function suma_total(){
   for (k=0;k<columna_suma.length; k++){
     inicioFila1=0;
     suma1=0;
     while(inicioFila1<fila){
       suma1 = suma1 + parseFloat(datos_matriz[inicioFila1][columna_suma[k]]);
       inicioFila1++;
     }
     objeto1 = document.getElementById("resultados_" + columna_suma[k]);
     objeto1.innerHTML= redondear(suma1, cant_dec[columna_suma[k]]);
     objeto1.disabled=true;
   }
 }
 
 function llama_suma() {
 if (columna_suma.length!=0)
   suma_subtotal();
 }

 function redondear(cantidad, decimales) {
   var cantidad = parseFloat(cantidad);
   var decimales = parseFloat(decimales);
   valor = "" + Math.round(cantidad * Math.pow(10, decimales)) / Math.pow(10, decimales);
   valor11 = valor.split(".");
   if (valor11.length<2){
     return valor;
   } else {
     while (valor11[1].length < decimales) {
       valor11[1]+="0";
     }
     valor = valor11[0] + "." +valor11[1];
     return valor;
   }
 }
 
</script>
<br>
<br>
</body>
<%@ include file="../Inferior.jsp" %>