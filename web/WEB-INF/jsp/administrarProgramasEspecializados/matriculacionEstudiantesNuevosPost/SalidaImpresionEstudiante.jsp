<%@ include file="../../Superior.jsp"%>
<jsp:useBean id="now" class="java.util.Date"/>
<head>
<table width="100%">
  <tr>
    <td width="14%" align="center">
      <form name="fvolver" action="<c:url value='/listarMisPendientes.fautapo'/>" method="post">
        <input type="hidden" name="aplicacion" value="/" >
	<input type="hidden" name="accion"     value='Formularito' >
        <div> <a href="javascript:document.fvolver.submit();">
        <IMG SRC="<c:url value='${datosInstitucion.logo}'/>" border="0" ALT="logo institucion" width="40%"></a></div>
      </form>
    </td>
    <td width="72%" align="center">
      <table width="100%" heigth="100%" cellpading="2" cellspacing="0" >
        <tr>
          <td align="center"><font size="4"><b><c:out value='${datosInstitucion.institucion}'/></font></td>
        <tr>
 		    <td align="center"><font size="3"><b>VICERRECTORADO DE POSTGRADO</b></font></td>
        </tr>
        <tr>  
		   <td align="center"><font size="3"><b>DIRECCION DE POSTGRADO</b></font></td>
        </tr>
      </table>
    </td>
    <td width="14%">
      Fecha : <a href='javascript: window.print()'><fmt:formatDate value="${now}" pattern="${formatoFecha}"/></a> 
    </td>
  </tr>
</table>
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 12">
<meta name=Originator content="Microsoft Word 12">
<link rel=File-List href="formulario_archivos/filelist.xml">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Universidad</o:Author>
  <o:LastAuthor>UAB</o:LastAuthor>
  <o:Revision>5</o:Revision>
  <o:TotalTime>165</o:TotalTime>
  <o:LastPrinted>2013-04-18T15:01:00Z</o:LastPrinted>
  <o:Created>2013-05-03T15:36:00Z</o:Created>
  <o:LastSaved>2013-05-03T15:56:00Z</o:LastSaved>
  <o:Pages>1</o:Pages>
  <o:Words>282</o:Words>
  <o:Characters>1556</o:Characters>
  <o:Company>U.A.B.J.B</o:Company>
  <o:Lines>12</o:Lines>
  <o:Paragraphs>3</o:Paragraphs>
  <o:CharactersWithSpaces>1835</o:CharactersWithSpaces>
  <o:Version>12.00</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<link rel=dataStoreItem href="formulario_archivos/item0007.xml"
target="formulario_archivos/props0008.xml">
<link rel=themeData href="formulario_archivos/themedata.thmx">
<link rel=colorSchemeMapping href="formulario_archivos/colorschememapping.xml">
<!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:Zoom>90</w:Zoom>
  <w:SpellingState>Clean</w:SpellingState>
  <w:GrammarState>Clean</w:GrammarState>
  <w:TrackMoves>false</w:TrackMoves>
  <w:TrackFormatting/>
  <w:HyphenationZone>21</w:HyphenationZone>
  <w:PunctuationKerning/>
  <w:DrawingGridHorizontalSpacing>5,5 pto</w:DrawingGridHorizontalSpacing>
  <w:DisplayHorizontalDrawingGridEvery>2</w:DisplayHorizontalDrawingGridEvery>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>ES</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:DontVertAlignCellWithSp/>
   <w:DontBreakConstrainedForcedTables/>
   <w:DontVertAlignInTxbx/>
   <w:Word11KerningPairs/>
   <w:CachedColBalance/>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"
  DefSemiHidden="true" DefQFormat="false" DefPriority="99"
  LatentStyleCount="267">
  <w:LsdException Locked="false" Priority="0" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>
  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" Priority="10" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" Priority="11" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" Priority="22" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" Priority="59" SemiHidden="false"
   UnhideWhenUsed="false" Name="Table Grid"/>
  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>
 </w:LatentStyles>
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:roman;
	mso-font-pitch:variable;
	mso-font-signature:-536870145 1107305727 0 0 415 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-536870145 1073786111 1 0 415 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin-top:0in;
	margin-right:0in;
	margin-bottom:10.0pt;
	margin-left:0in;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-link:"Encabezado Car";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	tab-stops:center 212.6pt right 425.2pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-link:"Pie de página Car";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	tab-stops:center 212.6pt right 425.2pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:10.0pt;
	margin-left:.5in;
	mso-add-space:auto;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
p.MsoListParagraphCxSpFirst, li.MsoListParagraphCxSpFirst, div.MsoListParagraphCxSpFirst
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-type:export-only;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	mso-add-space:auto;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
p.MsoListParagraphCxSpMiddle, li.MsoListParagraphCxSpMiddle, div.MsoListParagraphCxSpMiddle
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-type:export-only;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	mso-add-space:auto;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
p.MsoListParagraphCxSpLast, li.MsoListParagraphCxSpLast, div.MsoListParagraphCxSpLast
	{mso-style-priority:34;
	mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-type:export-only;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:10.0pt;
	margin-left:.5in;
	mso-add-space:auto;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
span.EncabezadoCar
	{mso-style-name:"Encabezado Car";
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:Encabezado;}
span.PiedepginaCar
	{mso-style-name:"Pie de página Car";
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:"Pie de página";}
span.SpellE
	{mso-style-name:"";
	mso-spl-e:yes;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-fareast-language:EN-US;}
.MsoPapDefault
	{mso-style-type:export-only;
	margin-bottom:10.0pt;
	line-height:115%;}
 /* Page Definitions */
 @page
	{mso-footnote-separator:url("formulario_archivos/header.htm") fs;
	mso-footnote-continuation-separator:url("formulario_archivos/header.htm") fcs;
	mso-endnote-separator:url("formulario_archivos/header.htm") es;
	mso-endnote-continuation-separator:url("formulario_archivos/header.htm") ecs;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:31.2pt 62.35pt 31.2pt 56.7pt;
	mso-header-margin:35.45pt;
	mso-footer-margin:35.45pt;
	mso-footer:url("formulario_archivos/header.htm") f1;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
 /* List Definitions */
@list l0
	{mso-list-id:1427768489;
	mso-list-type:hybrid;
	mso-list-template-ids:-232757326 502420060 201981977 201981979 201981967 201981977 201981979 201981967 201981977 201981979;}
@list l0level1
	{mso-level-number-format:roman-upper;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:33.15pt;
	text-indent:-.5in;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Tabla normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-qformat:yes;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin-top:0in;
	mso-para-margin-right:0in;
	mso-para-margin-bottom:10.0pt;
	mso-para-margin-left:0in;
	line-height:115%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-fareast-language:EN-US;}
table.MsoTableGrid
	{mso-style-name:"Tabla con cuadrícula";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-priority:59;
	mso-style-unhide:no;
	border:solid black 1.0pt;
	mso-border-themecolor:text1;
	mso-border-alt:solid black .5pt;
	mso-border-themecolor:text1;
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-border-insideh:.5pt solid black;
	mso-border-insideh-themecolor:text1;
	mso-border-insidev:.5pt solid black;
	mso-border-insidev-themecolor:text1;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-fareast-language:EN-US;}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="25602"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=ES style='tab-interval:35.45pt'>

<div class=WordSection1>

<p class=MsoNormal align=center style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:center;
line-height:normal'><b style='mso-bidi-font-weight:normal'><u><span
style='font-size:12.0pt'>FORMULARIO DE INSCRIPCION Y COMPROMISO DE PAGO A CURSO
DE POSTGRADO<o:p></o:p></span></u></b></p>

<p class=MsoNormal align=center style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:center;
line-height:normal'><b style='mso-bidi-font-weight:normal'><o:p>&nbsp;</o:p></b></p>

<p class=MsoListParagraph style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:18.95pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;text-indent:-18.95pt;line-height:normal;mso-list:l0 level1 lfo1'><![if !supportLists]><b
style='mso-bidi-font-weight:normal'><span style='mso-bidi-font-family:Calibri;
mso-bidi-theme-font:minor-latin'><span style='mso-list:Ignore'>I.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span></b><![endif]><b style='mso-bidi-font-weight:normal'>DATOS
PERSONALES:<o:p></o:p></b></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><b>Nombre (s)    :    </b><span style='mso-tab-count:1 dotted'><c:out value="${datosPrs.nombres}"/> </span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><b>Apellidos     :    </b><span style='mso-tab-count:1 dotted'><c:out value="${datosPrs.paterno}"/> <c:out value="${datosPrs.materno}"/> </span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><span style='mso-spacerun:yes'> </span><b>C.I.: </b><c:out value="${datosPrs.dip}"/><b> Teléfono   :   </b><c:out value="${datosPrs.telefono}"/><span style='mso-tab-count:1 dotted'></span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><span style='mso-spacerun:yes'> </span><b> Celular   :   </b><c:out value="${datosPrs.celular}"/> <b> E-mail   :   </b> <span style='mso-tab-count:1 dotted'><c:out value="${datosPrs.correo}"/></span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><b>Dirección    :    </b><span style='mso-tab-count:1 dotted'><c:out value="${datosPrs.direccion}"/></span><span
style='font-size:12.0pt'><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:0in;margin-bottom:.0001pt;text-align:justify;line-height:normal'><span
style='font-size:12.0pt'><span style='mso-spacerun:yes'> </span></span><span
style='font-size:4.0pt;mso-bidi-font-size:12.0pt'><o:p></o:p></span></p>

<p class=MsoListParagraph style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:18.95pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;text-indent:-18.95pt;line-height:normal;mso-list:l0 level1 lfo1'><![if !supportLists]><b
style='mso-bidi-font-weight:normal'><span style='mso-bidi-font-family:Calibri;
mso-bidi-theme-font:minor-latin'><span style='mso-list:Ignore'>II.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b
style='mso-bidi-font-weight:normal'>DATOS PROFESIONALES:<o:p></o:p></b></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><b>Profesión   :   </b><c:out value="${datosPrs.titulo}"/>  <b>Universidad    :   </b><c:out value="${datosPrs.nro_seguro_medico}"/><span
style='mso-tab-count:1 dotted'> </span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><b>Postgrado Realizados :</b>
 <b>Universidad </b>:<span style='mso-tab-count:1 dotted'>............................................ </span><span
style='font-size:12.0pt'><o:p></o:p></span></p>

<p class=MsoListParagraph style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:18.95pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;text-indent:-18.95pt;line-height:normal;mso-list:l0 level1 lfo1'><![if !supportLists]><b
style='mso-bidi-font-weight:normal'><span style='mso-bidi-font-family:Calibri;
mso-bidi-theme-font:minor-latin'><span style='mso-list:Ignore'>III.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b
style='mso-bidi-font-weight:normal'>DATOS LABORALES:<o:p></o:p></b></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><b>Empresa o Institución :</b><span style='mso-tab-count:
1 dotted'>........................................................................................................... </span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><b>Cargo :</b><span style='mso-tab-count:1 dotted'>................................................................................................................................... </span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><b>Dirección :</b><span style='mso-tab-count:1 dotted'>.............................................................................................................................. </span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><b>Teléfono :</b><span style='mso-tab-count:1 dotted'>.............................................................................................................................. </span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal'><b style='mso-bidi-font-weight:normal'><span style='font-size:3.0pt;
mso-bidi-font-size:12.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoListParagraphCxSpFirst style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:18.95pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;text-indent:-18.95pt;line-height:normal;mso-list:l0 level1 lfo1'><![if !supportLists]><b
style='mso-bidi-font-weight:normal'><span style='mso-bidi-font-family:Calibri;
mso-bidi-theme-font:minor-latin'><span style='mso-list:Ignore'>IV.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b
style='mso-bidi-font-weight:normal'>CURSO AL QUE POSTULA:<o:p></o:p></b></p>

<p class=MsoListParagraphCxSpMiddle style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:18.95pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;line-height:normal'><b style='mso-bidi-font-weight:normal'><o:p>&nbsp;</o:p></b></p>

<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0
 style='margin-left:18.95pt;border-collapse:collapse;border:none;mso-yfti-tbllook:
 1184;mso-padding-alt:0in 5.4pt 0in 5.4pt;mso-border-insidev:none'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
  <td width=83 valign=top style='width:62.45pt;border:none;border-right:solid black 1.0pt;
  mso-border-right-themecolor:text1;mso-border-right-alt:solid black .5pt;
  mso-border-right-themecolor:text1;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoListParagraphCxSpMiddle style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;mso-add-space:auto;
  text-align:justify;line-height:normal'>Diplomado<b style='mso-bidi-font-weight:
  normal'><o:p></o:p></b></p>
  </td>
  <td width=53 valign=top style='width:40.1pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-left:none;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoListParagraphCxSpMiddle style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;mso-add-space:auto;
  text-align:justify;line-height:normal'><b style='mso-bidi-font-weight:normal'><o:p>&nbsp;</o:p></b></p>
  </td>
  <td width=83 valign=top style='width:62.5pt;border:none;border-right:solid black 1.0pt;
  mso-border-right-themecolor:text1;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-right-alt:solid black .5pt;
  mso-border-right-themecolor:text1;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoListParagraphCxSpMiddle style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;mso-add-space:auto;
  text-align:justify;line-height:normal'>Especialidad<b style='mso-bidi-font-weight:
  normal'><o:p></o:p></b></p>
  </td>
  <td width=49 valign=top style='width:36.5pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-left:none;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoListParagraphCxSpMiddle style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;mso-add-space:auto;
  text-align:justify;line-height:normal'><b style='mso-bidi-font-weight:normal'><o:p>&nbsp;</o:p></b></p>
  </td>
  <td width=83 valign=top style='width:62.5pt;border:none;border-right:solid black 1.0pt;
  mso-border-right-themecolor:text1;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-right-alt:solid black .5pt;
  mso-border-right-themecolor:text1;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoListParagraphCxSpMiddle style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;mso-add-space:auto;
  text-align:justify;line-height:normal'>Maestría<b style='mso-bidi-font-weight:
  normal'><o:p></o:p></b></p>
  </td>
  <td width=55 valign=top style='width:41.0pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-left:none;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoListParagraphCxSpMiddle style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;mso-add-space:auto;
  text-align:justify;line-height:normal'><b style='mso-bidi-font-weight:normal'><o:p>&nbsp;</o:p></b></p>
  </td>
  <td width=83 valign=top style='width:62.5pt;border:none;border-right:solid black 1.0pt;
  mso-border-right-themecolor:text1;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-right-alt:solid black .5pt;
  mso-border-right-themecolor:text1;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoListParagraphCxSpMiddle style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;mso-add-space:auto;
  text-align:justify;line-height:normal'>Doctorado<b style='mso-bidi-font-weight:
  normal'><o:p></o:p></b></p>
  </td>
  <td width=55 valign=top style='width:41.0pt;border:solid black 1.0pt;
  mso-border-themecolor:text1;border-left:none;mso-border-left-alt:solid black .5pt;
  mso-border-left-themecolor:text1;mso-border-alt:solid black .5pt;mso-border-themecolor:
  text1;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoListParagraphCxSpLast style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;mso-add-space:auto;
  text-align:justify;line-height:normal'><b style='mso-bidi-font-weight:normal'><o:p>&nbsp;</o:p></b></p>
  </td>
 </tr>
</table>

<p class=MsoListParagraph style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:18.95pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;line-height:normal'><b style='mso-bidi-font-weight:normal'><o:p>&nbsp;</o:p></b></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><b>Programa : </b><c:out value="${datosEst.programa}"/>  <b>Paralelo :</b>
<span style='mso-tab-count:1 dotted'>.......................... </span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><b>Valor de la Inversión (Costo del Programa) :</b><span
style='mso-tab-count:1 dotted'>............................................................................ </span></p>

<p class=MsoListParagraphCxSpFirst style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:14.2pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;line-height:normal'><span style='font-size:1.0pt;mso-bidi-font-size:
11.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoListParagraphCxSpLast style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:14.2pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;line-height:normal'><b>Cuota Inicial :</b>…………………… <b>Depósito </b>
Bancario:<span style='mso-tab-count:2'>                            </span><span
style='mso-spacerun:yes'>   </span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><span style='font-size:3.0pt;mso-bidi-font-size:
11.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoListParagraph style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:18.95pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;text-indent:-18.95pt;line-height:normal;mso-list:l0 level1 lfo1'><![if !supportLists]><b
style='mso-bidi-font-weight:normal'><span style='mso-bidi-font-family:Calibri;
mso-bidi-theme-font:minor-latin'><span style='mso-list:Ignore'>V.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b
style='mso-bidi-font-weight:normal'>PLAN DE PAGO<o:p></o:p></b></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:0in;margin-bottom:.0001pt;text-align:justify;line-height:normal'><b
style='mso-bidi-font-weight:normal'><span style='font-size:6.0pt;mso-bidi-font-size:
12.0pt'><o:p>&nbsp;</o:p></span></b></p>

<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
 style='margin-left:19.8pt;border-collapse:collapse;border:none;mso-border-alt:
 solid windowtext .5pt;mso-padding-alt:0in 3.5pt 0in 3.5pt;mso-border-insideh:
 .5pt solid windowtext;mso-border-insidev:.5pt solid windowtext'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:12.1pt'>
  <td width=139 valign=top style='width:104.2pt;border:solid windowtext 1.0pt;
  mso-border-alt:solid windowtext .5pt;background:#00B0F0;padding:0in 3.5pt 0in 3.5pt;
  height:12.1pt'>
  <p class=MsoNormal align=center style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:center;
  line-height:normal'><b style='mso-bidi-font-weight:normal'><span
  style='color:black;mso-themecolor:text1'>MODALIDAD<o:p></o:p></span></b></p>
  </td>
  <td width=142 valign=top style='width:106.3pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;background:#00B0F0;padding:0in 3.5pt 0in 3.5pt;
  height:12.1pt'>
  <p class=MsoNormal align=center style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:center;
  line-height:normal'><b style='mso-bidi-font-weight:normal'><span
  style='color:black;mso-themecolor:text1'>Nº DE CUOTAS<o:p></o:p></span></b></p>
  </td>
  <td width=170 style='width:127.6pt;border:solid windowtext 1.0pt;border-left:
  none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  background:#00B0F0;padding:0in 3.5pt 0in 3.5pt;height:12.1pt'>
  <p class=MsoNormal align=center style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:center;
  line-height:normal'><b style='mso-bidi-font-weight:normal'><span
  style='color:black;mso-themecolor:text1'>VALOR CUOTA MES<o:p></o:p></span></b></p>
  </td>
  <td width=113 valign=top style='width:85.05pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;background:#00B0F0;padding:0in 3.5pt 0in 3.5pt;
  height:12.1pt'>
  <p class=MsoNormal align=center style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:center;
  line-height:normal'><b style='mso-bidi-font-weight:normal'><span
  style='color:black;mso-themecolor:text1'>FECHA DE PAGO<o:p></o:p></span></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:1;mso-yfti-lastrow:yes;height:14.45pt'>
  <td width=139 valign=top style='width:104.2pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 3.5pt 0in 3.5pt;height:14.45pt'>
  <p class=MsoNormal align=center style='margin-top:0in;margin-right:-5.65pt;
  margin-bottom:0in;margin-left:0in;margin-bottom:.0001pt;text-align:center;
  line-height:normal'><b style='mso-bidi-font-weight:normal'>En Cuotas<o:p></o:p></b></p>
  </td>
  <td width=142 valign=top style='width:106.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 3.5pt 0in 3.5pt;height:14.45pt'>
  <p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
  0in;margin-left:0in;margin-bottom:.0001pt;text-align:justify;line-height:
  normal'><b style='mso-bidi-font-weight:normal'><o:p>&nbsp;</o:p></b></p>
  </td>
  <td width=170 valign=top style='width:127.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 3.5pt 0in 3.5pt;height:14.45pt'>
  <p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
  0in;margin-left:0in;margin-bottom:.0001pt;text-align:justify;line-height:
  normal'><b style='mso-bidi-font-weight:normal'><o:p>&nbsp;</o:p></b></p>
  </td>
  <td width=113 valign=top style='width:85.05pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 3.5pt 0in 3.5pt;height:14.45pt'>
  <p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
  0in;margin-left:0in;margin-bottom:.0001pt;text-align:justify;line-height:
  normal'><b style='mso-bidi-font-weight:normal'><o:p>&nbsp;</o:p></b></p>
  </td>
 </tr>
</table>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:0in;margin-bottom:.0001pt;text-align:justify;line-height:normal'><b
style='mso-bidi-font-weight:normal'><span style='font-size:8.0pt;mso-bidi-font-size:
12.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'><b>Nombre del Garante (Para Programas con grado
académico) </b><span class=GramE>.:</span><span style='mso-tab-count:1 dotted'>................................................ </span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:14.2pt;margin-bottom:.0001pt;text-align:justify;line-height:
normal;tab-stops:dotted 439.45pt'>…………………………………………………… <b>C.I. :</b><span
style='mso-tab-count:1 dotted'>..................................................................................... </span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-5.65pt;margin-bottom:
0in;margin-left:0in;margin-bottom:.0001pt;text-align:justify;line-height:normal'><b
style='mso-bidi-font-weight:normal'><span style='font-size:7.0pt;mso-bidi-font-size:
12.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoListParagraphCxSpFirst style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:18.95pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;text-indent:-18.95pt;line-height:normal;mso-list:l0 level1 lfo1'><![if !supportLists]><b
style='mso-bidi-font-weight:normal'><span style='mso-bidi-font-family:Calibri;
mso-bidi-theme-font:minor-latin'><span style='mso-list:Ignore'>VI.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b
style='mso-bidi-font-weight:normal'>ACEPTACION Y CUMPLIMIENTO A NORMAS:<o:p></o:p></b></p>

<p class=MsoListParagraphCxSpMiddle style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:14.2pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;line-height:normal'><b style='mso-bidi-font-weight:normal'><span
style='font-size:9.0pt;mso-bidi-font-size:12.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoListParagraphCxSpMiddle style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:14.2pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;line-height:normal'><span style='font-size:10.0pt'>A tiempo
de realizar mi inscripción al presente Programa, me comprometo a cumplir las
normas y los requisitos exigidos por la U.A.B; al mismo tiempo, acepto que el
orden de las materias o módulos podrán ser alteradas por razones de fuerza
mayor, previa comunicación, para evitar perjuicios a los participantes. De
igual manera, acepto que por razones de impedimento extremo, algún profesor
pueda ser reemplazado por otro de la misma especialidad y similar experiencia
tanto profesional como académica. Respecto a la cancelación del monto total del
costo del programa, me comprometo a cancelar conforme al presente Plan de Pagos
señalado en el punto 5, el es de mi absoluta y entera conformidad y
responsabilidad.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:14.2pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;line-height:normal'><span style='font-size:10.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:14.2pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;line-height:normal'><span style='font-size:10.0pt'>La U.A.B.<b
style='mso-bidi-font-weight:normal'> </b>de manera tácita, no acepta
solicitudes de devolución o transferencias a otra persona o Programas de
Postgrado, por los pagos realizados de los participantes a este curso.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle align=center style='margin-top:0in;
margin-right:-5.65pt;margin-bottom:0in;margin-left:14.2pt;margin-bottom:.0001pt;
mso-add-space:auto;text-align:center;line-height:normal'><span
style='font-size:10.0pt'><o:p>&nbsp;</o:p></span></p>
  <table width="100%" align="center" border=0>
     <tr>
      <td width="100%" align="center"><font size="2">&nbsp;<c:out value='${datosInstitucion.localidad}'/>, <fmt:formatDate value="${now}" type="date" dateStyle="long"/></font></td>
    </tr>
 </table>
<p class=MsoListParagraphCxSpMiddle align=center style='margin-top:0in;
margin-right:-5.65pt;margin-bottom:0in;margin-left:14.2pt;margin-bottom:.0001pt;
mso-add-space:auto;text-align:center;line-height:normal'><span
style='font-size:12.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoListParagraphCxSpMiddle align=center style='margin-top:0in;
margin-right:-5.65pt;margin-bottom:0in;margin-left:14.2pt;margin-bottom:.0001pt;
mso-add-space:auto;text-align:center;line-height:normal'><span
style='font-size:9.0pt;mso-bidi-font-size:12.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoListParagraphCxSpMiddle align=center style='margin-top:0in;
margin-right:-5.65pt;margin-bottom:0in;margin-left:14.2pt;margin-bottom:.0001pt;
mso-add-space:auto;text-align:center;line-height:normal'><span
style='font-size:9.0pt;mso-bidi-font-size:12.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoListParagraphCxSpMiddle align=center style='margin-top:0in;
margin-right:-5.65pt;margin-bottom:0in;margin-left:14.2pt;margin-bottom:.0001pt;
mso-add-space:auto;text-align:center;line-height:normal'><span
style='font-size:12.0pt'><o:p>&nbsp;</o:p></span></p>
<table width="100%" align="center" border=0>
  <tr>
    <td align="center" colspan="2" width="35%"><c:out value="${datosPrs.nombres}"/> <c:out value="${datosPrs.paterno}"/> <c:out value="${datosPrs.materno}"/></td>
    <td align="center" width="35%">Firma Garante</td>
    <td align="left" colspan="2" width="15%">Firma Garante</td> 
    <p>
    <p>
    <p>
    <p>
    <p>
    <p>
  </tr>
  <tr>
    <td align="center" width="35%">&nbsp;</td>
    <td align="left" colspan="2" width="15%">&nbsp;</td> 
  </tr>
</table>
<p class=MsoListParagraphCxSpLast style='margin-top:0in;margin-right:-5.65pt;
margin-bottom:0in;margin-left:14.2pt;margin-bottom:.0001pt;mso-add-space:auto;
text-align:justify;line-height:normal'><o:p>&nbsp;</o:p></p>

</div>

</body>

</html>
