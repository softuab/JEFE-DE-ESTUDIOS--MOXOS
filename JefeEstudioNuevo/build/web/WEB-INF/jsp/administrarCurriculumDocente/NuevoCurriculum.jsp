<%@ include file="../Superior.jsp" %>
<script language="javascript" type="text/javascript" src="../tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript">
  tinyMCE.init({
    mode : "textareas",
    theme : "advanced",

    plugins : "style,layer,table,save,advhr,advimage,advlink,insertdatetime,preview,searchreplace,contextmenu,paste,directionality,fullscreen,noneditable",
    theme_advanced_buttons1_add_before : "newdocument,separator",
    theme_advanced_buttons1_add : "fontselect,fontsizeselect",
    theme_advanced_buttons2_add : "separator,insertdate,inserttime,preview,separator,forecolor,backcolor",
    theme_advanced_buttons2_add_before: "cut,copy,paste,pastetext,pasteword,separator,search,replace,separator",
    theme_advanced_buttons3_add_before : "tablecontrols,separator",
    theme_advanced_buttons3_add : "iespell,advhr,separator,ltr,rtl,separator,fullscreen",
    theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops",
    theme_advanced_toolbar_location : "top",
    theme_advanced_toolbar_align : "left",
    theme_advanced_path_location : "bottom",
    content_css : "example_full.css",
    plugin_insertdate_dateFormat : "%d-%m-%Y",
    plugin_insertdate_timeFormat : "%H:%M:%S",
    extended_valid_elements : "hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]",
    external_link_list_url : "example_link_list.js",
    external_image_list_url : "example_image_list.js",
    flash_external_list_url : "example_flash_list.js",
    file_browser_callback : "fileBrowserCallBack",
    theme_advanced_resize_horizontal : false,
    theme_advanced_resizing : true
  });

  function fileBrowserCallBack(field_name, url, type, win) {
    // This is where you insert your custom filebrowser logic
    alert("Example of filebrowser callback: field_name: " + field_name + ", url: " + url + ", type: " + type);

    // Insert new URL, this would normaly be done in a popup
    win.document.forms[0].elements[field_name].value = "someurl.htm";
  }
</script>
<div class="titulo">Administrar Curriculum Docente</div>
<br>
<a href="javascript: document.forma.action = 'cvListarCurriculum.fautapo'; document.forma.submit();" class = "volver">Volver</a>
<script language='JavaScript' SRC="ajax.js"></script>
<form action="cvGuardarCurriculum.fautapo" method=post name=forma>
  <input type = "hidden" name = "id_persona" value = "<c:out value = "${id_persona}"/>">
  <input type = "hidden" name = "id_curriculum" value = "<c:out value = "${id_curriculum}"/>">
  <input type = "hidden" name = "borrar" value = "<c:out value = "${borrar}"/>">
  <input type = "hidden" name = "bandera" value="<c:out value = "${bandera}"/>">
  <c:if test = "${borrar != 'borrar'}">
  <jsp:useBean id="now" class="java.util.Date"/>
  <input type = hidden name = hoy value="<fmt:formatDate value="${now}" pattern="yyyyMMddhhmmss" />">
  <div id = "nuevo" style ="visibility:visible">
    <table class=formulario >
      <tr>
        <th colspan="3" align="center">INTRODUZCA LOS DATOS</th>
      </tr>
      <tr>
        <td class = "etiqueta"> Rubro<font color = 'red'>(*)</font></td>
        <td class = "etiqueta">::</td>
        <td>
          <input type = "hidden" name = "rubro" value = '<c:out value = "${curriculum.rubro}"/>'>
          <select id = 'id_rubro' name = 'id_rubro' size = '1'
            onChange = "poblar('id_rubro', this.options[this.selectedIndex].value); document.forma.rubro.value = Arubro[document.forma.id_rubro.value];">
          </seelect>
        </td>
        <script>
          var Arubro = new Array();
          padre_hijo[h] = new Array ("id_rubro", "''", "<c:out value = "${curriculum.id_rubro}"/>");
          combo[h] = new Array();
          combo[h][0] = new Array("0", "- Elija una opcion -", "");
          <c:forEach var = "cod" items = "${lRubros}" varStatus = "rubroc">
            Arubro[<c:out value = "${cod.id_rubro}"/>] = '<c:out value = "${cod.rubro}"/>';
            combo[h][<c:out value = "${rubroc.count}"/>] = new Array("<c:out value = "${cod.id_rubro}"/>", "<c:out value = "${cod.rubro}"/>", "");
          </c:forEach>
          h++;
        </script>
      </tr>
      <tr>
        <td class = "etiqueta"> Sub Rubro<font color = 'red'>(*)</font></td>
        <td class = "etiqueta">::</td>
        <td>
          <input type = "hidden" name = "sub_rubro" value = '<c:out value = "${curriculum.sub_rubro}"/>'>
          <select id = 'id_sub_rubro' name = 'id_sub_rubro' size = '1'
            onChange = "poblar('id_sub_rubro', this.options[this.selectedIndex].value); document.forma.sub_rubro.value = Asub_rubro[document.forma.id_sub_rubro.value];">
          </seelect>
        </td>
        <script>
          var Asub_rubro = new Array();
          padre_hijo[h] = new Array ("id_sub_rubro", "id_rubro", "<c:out value = "${curriculum.id_sub_rubro}"/>");
          combo[h] = new Array();
          combo[h][0] = new Array("0", "- Elija una opcion -", "");
          <c:forEach var = "cod" items = "${lSubRubros}" varStatus = "sub_rubroc">
            Asub_rubro[<c:out value = "${cod.id_sub_rubro}"/>] = '<c:out value = "${cod.sub_rubro}"/>';
            combo[h][<c:out value = "${sub_rubroc.count}"/>] = new Array("<c:out value = "${cod.id_sub_rubro}"/>", "<c:out value = "${cod.sub_rubro}"/>", "<c:out value = "${cod.id_rubro}"/>");
          </c:forEach>
          h++;
        </script>
      </tr>
      <tr>
        <td class = "etiqueta">Detalle<font color = 'red'>(*)</font></td>
        <td class = "etiqueta">::</td>
	<td width="100%" heigth="100%" colspan="3">
        <textarea name="detalle" id="detalle" rows="15" cols="60" style="width: 80%"><c:out value="${curriculum.detalle}" escapeXml="False" /></textarea>
        </td>
      </tr>
      <tr>
        <td class = "etiqueta">Del</td>
        <td class = "etiqueta">::</td>
        <td><input type = "text" name = "del" value = "<c:if test="${curriculum.del != '1000-01-01' }"><c:out value = "${curriculum.del}" /></c:if>" maxlength='10' size='10'/> &nbsp; <small> <a href="javascript:showCal('del')"><img src="imagenes/dibRap/calendario.jpeg" border="0" /></a></small></td>
      </tr>
      <tr>
        <td class = "etiqueta">Al</td>
        <td class = "etiqueta">::</td>
        <td><input type = "text" name = "al" value = "<c:if test="${curriculum.al != '1000-01-01' }"><c:out value = "${curriculum.al}" /></c:if>" maxlength='10' size='10'/> &nbsp; <small> <a href="javascript:showCal('al')"><img src="imagenes/dibRap/calendario.jpeg" border="0" /></a></small></td>
      </tr>
      <tr>
        <th colspan="8" align="center">
          <input type=button value="Siguiente" class="siguiente" onclick='fguardar();'>
        </th>
      </tr>
    </table>
  </div>
  <div id = "confirmar" style ="visibility:hidden; position:absolute; top:40;">
  </c:if>
  <c:if test = "${borrar == 'borrar'}">
    <div id = "confirmar" style ="visibility:visible; position:absolute; top:40;">
  <input type = "hidden" name = "id_rubro" value = "<c:out value = "${curriculum.id_rubro}"/>">
  <input type = "hidden" name = "id_sub_rubro" value = "<c:out value = "${curriculum.id_sub_rubro}"/>">
  <input type = "hidden" name = "detalle" value = "<c:out value = "${curriculum.detalle}"/>">
  <input type = "hidden" name = "del" value = "<c:out value = "${curriculum.del}"/>">
  <input type = "hidden" name = "al" value = "<c:out value = "${curriculum.al}"/>">

  </c:if>
    <table class="formulario">
      <tr>
        <th colspan="3" align="center">CONFIRMAR</th>
      </tr>
      <tr>
        <td class="etiqueta">Rubro</td>
        <td class="etiqueta">::</td>
        <td id = "rubro"><c:out value = "${curriculum.rubro}"/></td>
      </tr>
      <tr>
        <td class="etiqueta">Sub Rubro</td>
        <td class="etiqueta">::</td>
        <td id = "sub_rubro"><c:out value = "${curriculum.sub_rubro}"/></td>
      </tr>
      <tr>
        <td class="etiqueta">Detalle</td>
        <td class="etiqueta">::</td>
        <td id = "detalle"><c:out value = "${curriculum.detalle}"  escapeXml="False"/></td>
      </tr>
      <tr>
        <td class="etiqueta">Del</td>
        <td class="etiqueta">::</td>
        <td id = "del"><c:if test="${curriculum.del != '1000-01-01' }"><c:out value = "${curriculum.del}"/></c:if></td>
      </tr>
      <tr>
        <td class="etiqueta">Al</td>
        <td class="etiqueta">::</td>
        <td id = "al"><c:if test="${curriculum.al != '1000-01-01' }"><c:out value = "${curriculum.al}"/></c:if></td>
      </tr>
      <tr>
        <td colspan ="3" align="center">
          <input type='submit' value='Aceptar' class="aceptar" > &nbsp;
          <input type='button' value='Cancelar' class="cancelar" OnClick='fnuevo()'>
        </td>
      </tr>
    </table>
  </div>

</form>  
  <script>
    function fguardar()
    {
      if((document.forma.id_sub_rubro.value!="0")&&(document.forma.id_rubro.value !="0"))
      {
        document.getElementById("rubro").innerHTML = document.forma.rubro.value;
        document.getElementById("sub_rubro").innerHTML = document.forma.sub_rubro.value;
        document.getElementById("detalle").innerHTML = document.forma.detalle.value;
        document.getElementById("del").innerHTML = document.forma.del.value;
        document.getElementById("al").innerHTML = document.forma.al.value;
        document.getElementById("nuevo").style.visibility = "hidden";
        document.getElementById("confirmar").style.visibility = "visible";
      }
      else
      {
        alert("Los campos con (*), son obligatorios");
      }
    }
    function fnuevo()
    {
      if(document.forma.borrar.value == 'borrar'){
        document.forma.action = 'cvListarCurriculum.fautapo';
        document.forma.submit();
      }
      else {
        document.getElementById("nuevo").style.visibility = "visible";
        document.getElementById("confirmar").style.visibility = "hidden";
      }
    }
    iniciar();
  </script>




<div class="nota">Los campos con <font color='red'>(*)</font>, son obligatorios <div/>
<%@ include file="../Inferior.jsp" %>