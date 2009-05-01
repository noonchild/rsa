<cfcache action="flush">
<cfsetting enablecfoutputonly="true">
<cfsetting showdebugoutput="yes">
<cfheader NAME="Expires" value="Thu, 19 Nov 1981 08:52:00 GMT">
<cfheader NAME="Cache-Control" value="must-revalidate, post-check=0, pre-check=0">
<cfheader NAME="Cache-Control" value="no-store, no-cache, must-revalidate">
<cfheader NAME="Pragma" value="no-cache">
<CFSET mygmt = gettimezoneinfo()>
<CFSET mygmt = mygmt.utcHourOffset>
<CFIF mygmt EQ 0>
<CFSET mygmt = "">
<CFELSEIF mygmt GT 0>
<CFSET mygmt = "+" & mygmt >
</CFIF>
<CFHEADER NAME="Pragma" VALUE="no-cache">
<CFHEADER NAME="Last-Modified" VALUE="#DateFormat(now(), 'ddd, dd mmm yyyy')# #TimeFormat(now(), 'HH:mm:ss')#GMT#mygmt#">
<!--- options --->
<cfscript>
wimpyVersion = "v5.0.0";
//<//////////////////////////////////////////////////////////////
//                                                             //
//                                                             //
//                                                             //
//                                                             //
//                      Wimpy MP3 Player                       //
//                                                             //
//           by Mike Gieson <info@wimpyplayer.com>             //
//          available at http://www.wimpyplayer.com            //
//                     ©2002-2006 plaino                       //
//                                                             //
//           by Mike Gieson <info@wimpyplayer.com>             //
//          available at http://www.wimpyplayer.com            //
//                     ©2002-2006 plaino                       //
//                                                             //
//                                                             //
//                                                             //
/////////////////////////////////////////////////////////////////
//                                                             //
//                       INSTALLATION:                         //
//                                                             //
/////////////////////////////////////////////////////////////////
//
// Upload wimpy.php and wimpy.swf to the folder that
// contains your mp3's.
//
// USE AT YOUR OWN RISK.
//
wimpyConfigFile = "wimpyConfigs.xml";
myWimpySWFfilename = "wimpy.swf";
wimpy_auth = "wimpy_auth.php";
media_types = "xml,mp3";
//
//
//
// If you are using multibyte characters (i.e. Chinese, Korean
// or non-alpha-numeric characters set useSysCodePage to yes.
// useSysCodePage = "yes";
useSysCodePage = "no";
//
// httpOption = "https";
httpOption = "http";
//
// clearClassCache
// Setting clearClassCache to false will optimize performance. By default
// Wimpy removes any temporary files that ColdFusion stores. Temporary
// files stored by ColdFusion can cause issues when modifying the contents
// of your folders. i.e. if you add or remove files from the Wimpy folder,
// ColdFusion may not recognize that the contents of the folder have changed,
// because ColdFusion sometimes caches information. By default, Wimpy tries
// to remove any cached information so that the most up to date information
// is available in the player, however if you do not change the contents of
// the Wimpy folder oftern, or if you have direct acces to the ColdFusion
// admin panel, you may want to set this to false, which will optimize the
// performance of the CFM page.
clearClassCache = true;
/////////////////////////////////////////////////////////////////
//                                                             //
//	              DO NOT EDIT BELOW HERE                   //
//                                                             //
/////////////////////////////////////////////////////////////////
//>
datasetup = "filename|artist|album|title|track|comments|genre|seconds|filesize|bitrate|visual";
</cfscript>
<cfloop list="#StructKeyList(url)#" index="key">
<cfset "#key#"="#url[key]#">
</cfloop>
<cfparam name="url.action" default="v31">
<cfscript>
v14 = Server.OS.Name.substring(0, 3);
v13 = Server.ColdFusion.ProductVersion;
IF(LCase(v14) EQ "win"){
v33 = "\";
} else {
v33 = "/";
}
v42 = GetBaseTemplatePath();
v43 = CGI.SERVER_NAME&CGI.PATH_INFO;
v21 = ListToArray(v42, v33);
v22 = ListToArray(v43, "/");
v41 = v22[ArrayLen(v22)];
ArrayDeleteAt(v21, ArrayLen(v21));
ArrayDeleteAt(v22, ArrayLen(v22));
v10 = ArrayToList(v21, v33);
v12 = ArrayToList(v22, "/");
v11 = httpOption&"://"&v12;
v43 = httpOption&"://"&v43;
v44 = v10&v33;
v23 = v11&"/";
wimpyApp = v43;
wimpySwf = v11&"/"&myWimpySWFfilename;
myConfigFile = v44&wimpyConfigFile;
if(FileExists(myConfigFile)){
v37 = true;
} else {
v37 = false;
}
function v19(v34){
v25 = ReplaceNoCase (URLDecode(v34), v10, v11);
v26 = ReplaceNoCase (v25, v33, "/", "All");
return v26;
return httpOption&"://"&v30;
}
function f3(theURL){
v25 = ReplaceNoCase (URLDecode(theURL), v11, v10);
v26 = ReplaceNoCase (v25, "/", v33, "All");
return v26;
}
function f2(v34){
return ListLast(Replace(URLDecode(v34), v33, "/"), "/");
}
function v4(v18){
var v17 = createObject("java", "java.io.File");
v17.init(JavaCast("string", v18));
return v17.length();
}
</cfscript>
<cfif v37 EQ true>
<cffile action="read" file="#myConfigFile#" variable="v45" />
<cfset v24 = XMLParse(v45) />
<cfloop index="i" from="1" to="#ArrayLen(v24.wimpyConfigs.XmlChildren)#">
<cfscript>
SetVariable(trim(v24.wimpyConfigs.XmlChildren[i].XmlName), trim(v24.wimpyConfigs.XmlChildren[i].XmlText));
</cfscript>
</cfloop>
</cfif>
<cfscript>
if(not IsDefined("wimpySwf")){
wimpySwf = v11&"/"&myWimpySWFfilename;
}
if(not IsDefined("wimpyApp")){
wimpyApp = v43;
}
if(not IsDefined("wimpySkin")){
wimpySkin = "";
}
if(not IsDefined("tptBkgd")){
tptBkgd = "yes";
}
if(not IsDefined("bkgdColor")){
bkgdColor = "000000";
}
if(not IsDefined("startDir")){
startDir = "";
}
if(not IsDefined("hide_folders")){
hide_folders = "_notes,goodies,playlister_output,skins,getid3,_private,_private,_vti_bin,_vti_cnf,_vti_pvt,_vti_txt,cgi-bin";
}
if(not IsDefined("hide_files")){
hide_files = "skin.xml,wimpyConfigs.xml,wimpyAVConfigs.xml,wimpy.swf,wimpyAV.swf,wasp.swf,wimpy_button.swf";
}
if(not IsDefined("wimpyHTMLpageTitle")){
wimpyHTMLpageTitle = "Wimpy Player";
}
if(not IsDefined("getMyid3info")){
getMyid3info = "no";
}
if(not IsDefined("ecommerce")){
ecommerce = "no";
}
if(not IsDefined("displayWidth")){
displayWidth = 0;
}
if(not IsDefined("displayHeight")){
displayHeight = 0;
}
if(not IsDefined("wimpySkin")){
wimpySkin = "";
}
if(not IsDefined("defaultVisualExt")){
defaultVisualExt = "jpg";
}
if(not IsDefined("defaultVisualBaseName")){
defaultVisualBaseName = "coverart";
}
if(not IsDefined("limitPlaytime")){
limitPlaytime = "no";
}
if(not IsDefined("limitPlaytimeSeconds")){
limitPlaytimeSeconds = "0";
}
if(ecommerce EQ "yes"){
getMyid3info="yes";
forcedownload="no";
displayDownloadButton="yes";
}
v38 = false;
v29 = false;
displayWidth = "480";
displayHeight = "140";
if(url.action EQ "v31"){
v29 = true;
}
</cfscript>
<cfif v29 EQ true>
<cfif not wimpySkin EQ "">
<cfhttp url="#wimpySkin#" method="GET"/>
<cfset v38 = true>
<cfelse>
<cfset v38 = false>
</cfif>
</cfif>
<cfscript>
if(v38 EQ true){
v24 = XmlParse(CFHTTP.FileContent);
displayWidth = v24.skin.bkgd_main.xmlAttributes.width;
displayHeight = v24.skin.bkgd_main.xmlAttributes.height;
}
v39 = false;
if(not startDir EQ ""){
v10 = startDir;
v44 = v10&v33;
serveMP3 = "yes";
v39 = true;
}
</cfscript>
<cfif getMyid3info EQ "yes">
<cftry>
<!---<cfset mp3 = createObject("java","helliker.id3.MP3File")>--->
<!---<cfif not isDefined("id3Reader")>--->
<!---<cfset id3Reader = createObject("java","helliker.id3.MP3File")>--->
<!---<cfscript>--->
<cfset id3Reader = CreateObject("java","helliker.id3.MP3File")>
<cfcatch type = "any">
<cfoutput><table width="100%" border="1" cellpadding="10" cellspacing="0" bordercolor="##CC0000" bgcolor="##FFFFCC">
<tr>
<td><p><font size="2"><b><font face="Arial, Helvetica, sans-serif">ERROR - </font></b></font><font size="2" face="Arial, Helvetica, sans-serif">You have requested that Wimpy read ID3 tags, however, the ID3 tag reader program &quot;Helliker&quot; has not been installed properly. Please see the helliker readme.txt file for how to install the Helliker. - OR - Set the &quot;getMyid3info&quot; option to &quot;no&quot;</font></p>
</td>
</tr>
</table></cfoutput>
</cfcatch>
<!---</cfscript>--->
<!---</cfif>--->
</cftry>
</cfif>
<cfswitch expression="#url.action#">
<cfcase value="downloadfile">
<cfset sFile=f3(url.theFile)>
<cfheader name="content-disposition" value="inline; filename=#f2(url.theFile)#">
<cfcontent file="#sFile#" deletefile="no" type="application/unknown" reset="yes">
</cfcase>
<cfcase value="serveMP3">
<cfheader name="Pragma" value="public">
<cfheader name="Expires" value="Thu, 19 Nov 1981 08:52:00 GMT">
<cfheader name="Cache-Control" value="must-revalidate, post-check=0, pre-check=0">
<cfheader name="Cache-Control" value="no-store, no-cache, must-revalidate">
<cfheader name="Content-Type" value="audio/x-mpeg, audio/x-mpeg-3, audio/mpeg3">
<cfset sFile=f3(url.theFile)>
<cfheader name="content-disposition" value="inline; filename=#f2(url.theFile)#">
<cfcontent file="#sFile#" deletefile="no">
</cfcase>
<cfcase value="getCoverart">
<cfheader name="Pragma" value="public">
<cfheader name="Expires" value="Thu, 19 Nov 1981 08:52:00 GMT">
<cfheader name="Cache-Control" value="must-revalidate, post-check=0, pre-check=0">
<cfheader name="Cache-Control" value="no-store, no-cache, must-revalidate">
<cfheader name="Content-Type" value="image/jpeg">
<cfset sFile=f3(url.theFile)>
<cfheader name="content-disposition" value="inline; filename=#f2(url.theFile)#">
<cfcontent file="#sFile#" deletefile="no">
</cfcase>
<cfcase value="getstartupdirlist,dir,info">
<cfif clearClassCache is true>
<cfdirectory action="LIST" directory="#server.coldfusion.rootdir#\wwwroot\WEB-INF\cfclasses\" name="classDir">
<cfquery name="classDir" dbtype="query">
SELECT name
FROM classDir
WHERE name like '%wimpy%'
</cfquery>
<cfif classDir.recordcount>
<cfloop query="classDir">
<cffile action="DELETE" file="#server.coldfusion.rootdir#\wwwroot\WEB-INF\cfclasses\#classDir.name#">
</cfloop>
</cfif>
</cfif>
<cfset row = 0>
<cfif not compare(url.action,'getstartupdirlist')>
<cfset v44 = v44>
<cfelseif not compare(url.action,'dir')>
<cfset v44 = f3(url.dir)&v33>
<cfelseif not compare(url.action,'info')>
<cfsetting showdebugoutput="yes">
</cfif>
<cfdirectory action="LIST" directory="#v44#" name="getMP3s" sort="type ASC,name ASC">
for (x=1; x lt ArrayLen(getMP3s); x=x+1){
<cfloop query="getMP3s">
<cfset v32 = false>
<cfif not compare(type,'Dir')>
<cfif not listFindNoCase(#hide_folders#,name)>
<cfscript>
artist = '#name#';
title = '#name#';
album = '';
track = '';
comments = '';
genre = '';
seconds = '';
bitrate = '';
visual = '';
</cfscript>
<cfset v32 = true>
</cfif>
<cfelse>
<cfset v32 = false>
<cfif ListContainsNoCase(#media_types#,right(name,3))>
<cfset v32 = true>
</cfif>
<cfif v32 is true>
<cfif listFindNoCase(#hide_files#,name)>
<cfset v32 = false>
</cfif>
</cfif>
<cfif v32 is true>
<cfif findNoCase('config',name)>
<cfset v32 = false>
</cfif>
</cfif>
<cfif v32 is true>
<cfif findNoCase('skin',name)>
<cfset v32 = false>
</cfif>
</cfif>
<cfif v32 is true>
<cfif not compareNoCase('.mp3',right(name,4))>
<cfif getMyid3info EQ "yes">
<cfscript>
id3Reader.init("#v44##name#");
artist = id3Reader.getArtist();
title = id3Reader.getTitle();
album = id3Reader.getAlbum();
track = id3Reader.getTrack();
comments = id3Reader.getComment();
genre = id3Reader.getGenre();
seconds = id3Reader.getPlayingTime();
bitrate = id3Reader.getBitRate();
v15 = v44&replaceNoCase(name,'.mp3','.jpg',"one");
if (FileExists(v15)){
if(v39 eq true){
visual = wimpyApp & "?action=getCoverart&theFile=" & v19(v15);
} else {
visual = v19(v15);
}
} else {
visual = "";
}
</cfscript>
<cfelse>
<cfscript>
artist = '';
title = replaceNoCase(name,'.mp3','',"one");
album = '';
track = '';
comments = '';
genre = '';
seconds = '';
bitrate = '';
v15 = v44&replaceNoCase(name,'.mp3','.jpg',"one");
if (FileExists(v15)){
if(v39 eq true){
visual = wimpyApp & "?action=getCoverart&theFile=" & v19(v15);
} else {
visual = v19(v15);
}
} else {
visual = "";
}
</cfscript>
</cfif>
<cfelse>
<cfscript>
artist = '';
title = '';
album = '';
track = '';
comments = '';
genre = '';
seconds = '';
bitrate = '';
v15 = v44&replaceNoCase(name,'.mp3','.jpg',"one");
if (FileExists(v15)){
if(v39 eq true){
visual = wimpyApp & "?action=getCoverart&theFile=" & v19(v15);
} else {
visual = v19(v15);
}
} else {
visual = "";
}
</cfscript>
</cfif>
</cfif>
</cfif>
<cfif v32 is true>
<cfscript>
v30 = "&item" & row & "=";
v30 = v30 & URLEncodedFormat(v19(v44 & name)) & "|";
v30 = v30 & URLEncodedFormat(artist) & "|";
v30 = v30 & URLEncodedFormat(album) & "|";
v30 = v30 & URLEncodedFormat(title) & "|";
v30 = v30 & URLEncodedFormat(track) & "|";
v30 = v30 & URLEncodedFormat(comments) & "|";
v30 = v30 & URLEncodedFormat(genre) & "|";
v30 = v30 & seconds & "|";
if (not compare(Type,'File')){
v30 = v30 & v4(v44 & name) & "|";
} else {
v30 = v30 & "|";
}
v30 = v30 & bitrate & "|";
v30 = v30 & URLEncodedFormat(visual) & "|";
</cfscript>
<cfoutput>#v30#</cfoutput>
<cfset row = row + 1>
</cfif>
</cfloop>
<cfscript>
v15 = v44&defaultVisualBaseName&"."&defaultVisualExt;
if (FileExists(v15)){
if(v39 eq true){
visualURL = wimpyApp & "?action=getCoverart&theFile=" & v19(v15);
} else {
visualURL = v19(v15);
}
v30 = v30 & "&visualURL=" & URLEncodedFormat(visualURL);
}
v30 = v30 & "&totalitems=" & row;
v30 = v30 & "&datasetup=" & datasetup;
</cfscript>
<!--- cache control --->
<cfheader name="Expires" value="Thu, 19 Nov 1981 08:52:00 GMT">
<cfheader name="Cache-Control" value="must-revalidate, post-check=0, pre-check=0">
<cfheader name="Cache-Control" value="no-store, no-cache, must-revalidate">
<cfheader name="Pragma" value="no-cache">
<CFSET mygmt = gettimezoneinfo()>
<CFSET mygmt = mygmt.utcHourOffset>
<CFIF mygmt EQ 0>
<CFSET mygmt = "">
<CFELSEIF mygmt GT 0>
<CFSET mygmt = "+" & mygmt >
</CFIF>
<CFHEADER NAME="Pragma" VALUE="no-cache">
<CFHEADER NAME="Last-Modified" VALUE="#DateFormat(now(), 'ddd, dd mmm yyyy')# #TimeFormat(now(), 'HH:mm:ss')#GMT#mygmt#">
<!--- END cache control --->
<cfoutput>#v30#</cfoutput>
</cfcase>
<cfcase value="getVersion">
<cfoutput>#wimpyVersion#</cfoutput>
</cfcase>
<cfcase value="v31">
<cfscript>
v28 = wimpySwf;
if(v37 EQ true){
v28 = v28&"?wimpyConfigs="&v11&"/"&wimpyConfigFile;
} else {
v28 = v28&"?wimpyApp="&wimpyApp;
}
if(bkgdColor EQ ""){
bkgdColor = "000000";
}
if(tptBkgd EQ "yes"){
v40 = true;
} else {
v40 = false;
}
if(v40){
v35 = "wmode=""transparent"" ";
v36 = "<param name=""wmode"" value=""transparent"" />";
} else {
v35 = "";
v36 = "";
}
</cfscript>
<cfoutput><HTML>
<HEAD>
<TITLE>#wimpyHTMLpageTitle#</TITLE>
</HEAD>
<BODY bgcolor="###bkgdColor#" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
<td align="center" valign="middle">
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=6,0,47,0" width="#displayWidth#" height="#displayHeight#" id="wimpy">
<param name="movie" value="#v28#" />
<param name="loop" value="false" />
<param name="menu" value="false" />
<param name="quality" value="high" />
<param name="scale" value="noscale" />
<param name="salign" value="lt" />
<param name="bgcolor" value="###bkgdColor#" />
#v36#
<embed src="#v28#" width="#displayWidth#" height="#displayHeight#" bgcolor="###bkgdColor#" loop="false" menu="false" quality="high" scale="noscale" salign="lt" id="wimpy" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" #v35#/></object>
</td>
</tr>
</table>
</BODY>
</HTML></cfoutput>
</cfcase>
</cfswitch>
<cfsetting enablecfoutputonly="false">
<cfcache action="flush">
<cfobjectcache action = "clear">