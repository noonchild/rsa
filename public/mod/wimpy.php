<?php
if(!@session_id()){
@session_start();
}
$wimpyVersion = "v5.2.5";
//<//////////////////////////////////////////////////////////////
//                                                             //
//                                                             //
//                                                             //
//                                                             //
//                      Wimpy MP3 Player                       //
//                                                             //
//           by Mike Gieson <info@wimpyplayer.com>             //
//          available at http://www.wimpyplayer.com            //
//                     ©2002-2005 plaino                       //
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
$wimpyConfigFile = "wimpyConfigs.xml";
$myWimpySWFfilename = "wimpy.swf";
$wimpy_auth = "wimpy_auth.php";
$media_types = "xml,mp3,m3u,pls";
// If you are using multibyte characters (i.e. Chinese, Korean
// or non-alpha-numeric characters set $useSysCodePage to yes.
// $useSysCodePage = "yes";
$useSysCodePage = "no";
//
$httpOption = "http";
//
// Setting "blockPHPinfo" this value to 'Yes' will prevent anyone
// to view your phpinfo() page by adding the correct ?request to the URL.
// viewing the PHP info is only used for troubleshooting first installs.
$blockPHPinfo = "yes";
//
/////////////////////////////////////////////////////////////////
//                                                             //
//         Do not edit anything below here unless              //
//          you really know what you are doing!                //
//                                                             //
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
//
// NOTE: for encryption, an un-encrypted variable must follow the ending comment
// (which i can't print, otheriwse it wil reckog
//>
$myDataSetup = "filename|artist|album|title|track|comments|genre|seconds|filesize|bitrate|visual";
$v103 = false;
strstr( PHP_OS, "WIN") ? $v81 = "\\" : $v81 = "/";
strstr( PHP_OS, "WIN") ? $v67 = "win" : $v67 = "unix";
if(!@getcwd ()){
$v31['path']['physical'] = dirname(__FILE__);
} else {
$v31['path']['physical'] = getcwd ();
}
function f1(&$array, $id, $var){
$v86 = array($var => $id);
$array = array_merge ($array, $v86);
}
if($_SERVER['PHP_SELF']){
$v58 = FALSE;
$v108 = strtolower (@$_SERVER["HTTP_USER_AGENT"]);
} else {
$v58 = TRUE;
if($v103){
$_REQUEST = array();
$v78 = get_defined_vars();
$v0 = explode("&", $v78['argv'][0]);
for($i=0;$i<sizeof($v0);$i++){
$v1 = explode("=", $v0[$i]);
f1($_REQUEST, $v1[1], $v1[0]);
}
} else {
$v78 = get_defined_vars();
$_REQUEST = $v78;
}
$v108 = strtolower (@$_REQUEST["HTTP_USER_AGENT"]);
}
if($v58){
$v70 = $HTTP_SERVER_VARS['PHP_SELF'];
} else {
$v70 = $_SERVER['PHP_SELF'];
}
$v22 = explode("/", $v70);
$myWimpyPHPfilename = array_pop($v22);
$v69 = implode("/", $v22);
if($v58){
$v31['path']['www'] = $httpOption."://".$HTTP_SERVER_VARS['HTTP_HOST'].$v69;
} else {
$v31['path']['www'] = $httpOption."://".$_SERVER['HTTP_HOST'].$v69;
}
if($v40 = f5($wimpyConfigFile)){
$v113 = @xml_parser_create('');
@xml_parser_set_option ($v113, XML_OPTION_CASE_FOLDING, false );
@xml_parse_into_struct($v113, $v40, $v109, $v56);
@xml_parser_free($v113);
foreach ($v109 as $k=>$v){
if($v['type'] == "complete"){
$$v['tag'] = trim(@$v['value']);
}
}
}
if(!isset($wimpySwf)){
$wimpySwf = $v31['path']['www']."/".$myWimpySWFfilename;
}
if(!isset($wimpyApp)){
$wimpyApp = $v31['path']['www']."/".$myWimpyPHPfilename;
}
if(!isset($wimpySkin)){
$wimpySkin = "";
}
if(!isset($trackPlays)){
$trackPlays = "";
}
if(!isset($voteScript)){
$voteScript = "";
}
if(!isset($defaultImage)){
$defaultImage = "";
}
if(!isset($startPlayingOnload)){
$startPlayingOnload = "yes";
}
if(!isset($shuffleOnLoad)){
$shuffleOnLoad = "no";
}
if(!isset($randomOnLoad)){
$randomOnLoad = "no";
}
if(!isset($displayDownloadButton)){
$displayDownloadButton = "no";
}
if(!isset($forceDownload)){
$forceDownload = "no";
}
if(!isset($startOnTrack)){
$startOnTrack = "";
}
if(!isset($autoAdvance)){
$autoAdvance = "yes";
}
if(!isset($popUpHelp)){
$popUpHelp = "yes";
}
if(!isset($getMyid3info)){
$getMyid3info = "no";
}
if(!isset($serveMP3)){
$serveMP3 = "no";
}
if(!isset($loopPlaylist)){
$loopPlaylist = "off";
}
if(!isset($forceXMLplaylist)){
$forceXMLplaylist = "no";
}
if(!isset($useSysCodePage)){
$useSysCodePage = "no";
}
if(!isset($ecommerce)){
$ecommerce = "no";
}
if(!isset($useMysql)){
$useMysql = "no";
}
if(!isset($tptBkgd)){
$tptBkgd = "yes";
}
if(!isset($startDir)){
$startDir = "";
}
if(!isset($defaultVisualExt)){
$defaultVisualExt = "jpg";
}
if(!isset($scrollInfoDisplay)){
$scrollInfoDisplay = "yes";
}
if(!isset($infoDisplayTime)){
$infoDisplayTime = 3;
}
if(!isset($bufferAudio)){
$bufferAudio = 3;
}
if(!isset($theVolume)){
$theVolume = 100;
}
if(!isset($bkgdColor)){
$bkgdColor = "000000";
}
if(!isset($ecomWindow)){
$ecomWindow = "_BLANK";
}
if(!isset($defaultVisualBaseName)){
$defaultVisualBaseName = "coverart";
}
if(!isset($hide_folders)){
$hide_folders = "goodies,playlister_output,skins,getid3,_private,_private,_vti_bin,_vti_cnf,_vti_pvt,_vti_txt,cgi-bin";
}
if(!isset($hide_files)){
$hide_files = "skin.xml,wimpyConfigs.xml";
}
if(!isset($wimpyHTMLpageTitle)){
$wimpyHTMLpageTitle = "Wimpy Player";
}
if($ecommerce == "yes"){
$forceDownload = "no";
$displayDownloadButton = "yes";
$getMyid3info = "yes";
}
$v106 = true;
$v80 = 0;
$v79 = 0;
if(strlen(@$wimpySkin)>4){
if($v40 = f5($wimpySkin)){
$v114 = @xml_parser_create('');
@xml_parse_into_struct($v114, $v40, $v109, $v56);
@xml_parser_free($v114);
$v80 = @$v109[@$v56['BKGD_MAIN'][0]]['attributes']['WIDTH'];
$v79 = @$v109[@$v56['BKGD_MAIN'][0]]['attributes']['HEIGHT'];
} else {
$v106 = false;
}
} else {
$v106 = false;
}
if($v80<1 || $v79<1){
$v106 = false;
$v80 = "480";
$v79 = "140";
}
$v77 = "";
function f22($v68){
global $v31;
return $v68;
}
function f5($v45){
$v45 = @file("$v45");
return !$v45 ? false : implode('', $v45);
}
$v21 = array();
$v20 = array();
function f13($v96){
global $startDir,$v81;
return (str_replace($startDir.$v81, "", $v96));
}
function f0($v74, $v84="no", $v55="no"){
global $wimpyApp,$startDir,$v21,$v20,$hide_files,$getMyid3info,$defaultVisualBaseName,$defaultVisualExt,$v31,$v77,$v81,$v69,$hide_folders,$media_types,$v62,$myDataSetup;
if($v74 == $v31['path']['physical'] || $v84=="yes"){
$v75 = true;
} else {
$v75 = false;
}
$v53=opendir($v74);
$v6 = array ();
$v10 = array ();
$v14 = array ();
$v13 = array();
$v12 = explode(",",$hide_files);
$v13 = explode(",",$hide_folders);
$v19 = explode(",",$media_types);
$v41 = 0;
$v35 = $v31['path']['www'];
while (false !== ($v45 = readdir($v53))){
$v48 =($v45);
$ext = explode('.',$v45);
$v64 = strtolower($ext[sizeof($ext)-1]);
if(!in_array($v45,$v12)){
if($v45 != '.' && $v45 != '..' && @sizeof($ext)>1 && in_array(strtolower($v64),$v19)){
if($v64 == "xml"){
if(stristr(strtolower($v45), "skin") || stristr(strtolower($v45), "config")){
$v43 = "";
} else {
$v10[count($v10)]=($v45);
}
} else if($v64 == "pls" || $v64 == "m3u"){
$v10[count($v10)]=($v45);
} else {
$v10[count($v10)] = ($v45);
}
} else {
if($v45 != '.' && $v45 != '..'){
if(!in_array($v45,$v13)){
if (false !== ($v37 = @opendir($v74.$v81.$v45))){
$v6[count($v6)] =($v45);
}
@closedir($v74.$v81.$v45);
}
}
}
}
}
closedir($v53);
natcasesort($v6);
natcasesort($v10);
$v7 = array_values($v6);
$v11 = array_values($v10);
for($i=0;$i<sizeof($v7);$i++){
$v87 = (f3($v7[$i]));
$v7[$i]=f6($v74.$v81.$v87)."||||";
$v41++;
}
for($i=0;$i<sizeof($v11);$i++){
$v87 = (f3($v11[$i]));
$ext = explode('.',$v87);
$v64 = strtolower($ext[sizeof($ext)-1]);
if($v64 == "pls" || $v64 == "m3u"){
$v11[$i]=$wimpyApp."%3Faction%3DfeedPlaylist%26theFile%3D".f6($v74.$v81.$v87)."||||";
} else {
$v11[$i]=f6($v74.$v81.$v87)."|".(f10 ($v74.$v81.$v87, "full"));
}
}
if($v62 == "mysql"){
if(sizeof($v11)){
for($i=0;$i<sizeof($v11); $i++){
array_push ($v14,($v11[$i]));
}
}
return $v14;
} else {
if(sizeof($v7)){
for($i=0;$i<sizeof($v7); $i++){
array_push ($v14, ($v7[$i]));
}
}
if(sizeof($v11)){
for($i=0;$i<sizeof($v11); $i++){
array_push ($v14, ($v11[$i]));
}
}
for($i=0;$i<sizeof($v14);$i++){
$v77 .= "&item".$i."=".($v14[$i]);
}
$v100 = sizeof ($v14);
if($startDir == ""){
$v112 = $v74.$v81.$defaultVisualBaseName.".".$defaultVisualExt;
if (is_file($v112)){
$v111 = "&visualURL=".(f6($v112));
} else {
$v111 = "";
}
} else {
$v112 = $v74.$v81.$defaultVisualBaseName.".".$defaultVisualExt;
if(is_file($v112)){
$v73 = str_replace ( $v31['path']['physical'], "", $v112);
$v73 = str_replace ( $v81, "/", $v73);
$v111 = "&visualURL=".($wimpyApp."%3Faction%3DgetCoverart%26theFile%3D".$v73);
} else {
$v111 = "";
}
}
$v77 .= "&totalitems=$v100".$v111;
$v77 .= "&datasetup=$myDataSetup";
return $v77;
clearstatcache();
}
}
function asc2hex ($v97) {
$v85 = $v97;
$v40 = "";
for ($i=0; $i<strlen($v85); $i++){
$char = substr($v85,$i,1);
if(!ereg('[A-Za-z0-9|/:.^]', $char)){
$v40 .= rawurlencode(f20(ord($char)));
}else{
$v40.=$char;
}
}
return $v40;
}
function f20($dec) {
if ($dec < 128) {
$utf = chr($dec);
} else if ($dec < 2048) {
$utf = chr(192 + (($dec - ($dec % 64)) / 64));
$utf .= chr(128 + ($dec % 64));
} else {
$utf = chr(224 + (($dec - ($dec % 4096)) / 4096));
$utf .= chr(128 + ((($dec % 4096) - ($dec % 64)) / 64));
$utf .= chr(128 + ($dec % 64));
}
return $utf;
}
function f3($v97){
global $v67;
if($v67 == "win"){
return  asc2hex ($v97);
} else {
return  rawurlencode($v97);
}
}
function f10($v93, $v104=""){
global $v31,$v81,$v33,$getMyid3info,$v63;
@set_time_limit(30);
@flush();
$v64 = explode(".", $v93);
if ($getMyid3info=="yes" && strtolower($v64[sizeof($v64)-1]) != "xml"){
$v73 = f7($v93);
} else {
$v73 = array();
$v73[0]="";
$v73[1]="";
$v73[2]="";
$v73[3]="";
$v73[4]="";
$v73[5]="";
$v73[6]="";
$v73[7]="";
$v73[8]="";
}
for($i=0;$i<sizeof($v73);$i++){
$v73[$i] = f3($v73[$i], "display");
}
$v25 = explode($v81,$v93);
$v90 = $v25[sizeof($v25)-1];
$v27=explode('.',$v90);
$v91 = $v27[sizeof($v27)-2];
if($v73[0]=="" || $v73[0]==null){
$v73[0] =  ($v91);
}
if($v73[2]=="" || $v73[2]==null){
$v73[2] =  ($v91);
}
$v73[9] =  f3(f9($v93));
return ((implode ("|", $v73)));
}
function f7($v93){
global $startDir,$getMyid3info,$v31, $v81, $v51, $action;
$v39 = urldecode($v93);
if($getMyid3info == "yes"){
$v57 = $v51->analyze($v39);
getid3_lib::CopyTagsToComments($v57);
} else {
$v57 = array();
}
$v73 = array();
if(sizeof($v57)>0){
$v73[0]=@ ($v57['comments']['artist'][0]);
$v73[1]=@($v57['comments']['album'][0]);
$v73[2]=@ ($v57['comments']['title'][0]);
$v73[3]=@($v57['comments']['track'][0]);
$v73[4]="/";
$v50 = 0;
if($action == "podcast"){
$v50 = 1;
}
if(@strlen(@$v57['comments']['comment'][1])>@strlen(@$v57['comments']['comment'][0])){
if(@substr($v57['comments']['comment'][1],0,4)=="http" || $v50 == 1){
$v73[4]=(@$v57['comments']['comment'][1]);
}
} else {
if(@substr($v57['comments']['comment'][0],0,4)=="http" || $v50 == 1){
$v73[4]=(@$v57['comments']['comment'][0]);
}
}
if($v73[4] == "" || $v73[4] == "null"){
$v73[4] = "/";
}
$v73[5]=(@$v57['comments']['genre'][0]);
$v73[6]=(@$v57['playtime_seconds']);
$v73[7]=(round(@$v57['filesize']/1000000, 2));
$v73[8]=(round(@$v57['audio']['bitrate']/1000));
} else {
return 0;
break;
}
return $v73;
}
function f9($theFile){
global $wimpyApp,$startDir,$defaultVisualBaseName, $defaultVisualExt, $v31, $v81;
$v26 = explode(".", str_replace("/", $v81, urldecode($theFile)));
array_pop($v26);
if($startDir == ""){
$v26 = explode(".", $theFile);
array_pop($v26);
$v95 = urldecode((implode(".", $v26).".".$defaultVisualExt));
if(is_file($v95)){
return (f6($v95));
} else {
return false;
}
} else {
$v95 = (implode(".", $v26).".".$defaultVisualExt);
if(strpos ($v95, $v31['path']['physical']) === false){
$v95 = $v31['path']['physical'].$v81.$v95;
}
if(is_file($v95)){
$v73 = str_replace ( $v31['path']['physical'], "", $v95);
$v73 = str_replace ( $v81, "/", $v73);
return ($wimpyApp."?action=getCoverart&theFile=".$v73);
}
}
}
function f21($v98){
global $v31, $v81;
$v26 = explode ("/", $v98);
$v92 = array_pop($v26);
$v30 = explode ("/", $v31['path']['www']);
$v28 = array_values (array_diff ($v26, $v30));
if($v28){
$v88 = $v31['path']['physical'].$v81.implode($v81, $v28).$v81.$v92;
} else {
$v88 = $v31['path']['physical'].implode($v81, $v28).$v81.$v92;
}
return $v88;
}
function f6($v94){
global $startDir,$v31, $v81;
$v26 = explode ($v81, $v94);
$v92 = array_pop($v26);
$v29 = explode ($v81, $v31['path']['physical']);
$v28 = array_values (array_diff ($v26, $v29));
if($v28){
$v89 = "/".implode("/", $v28)."/".$v92;
} else {
$v89 = implode("/", $v28)."/".$v92;
}
return ($v31['path']['www']."$v89");
}
function f2($v46){
return ereg_replace("[^a-z0-9._]", "",str_replace(" ", "_",str_replace("%20", "_", strtolower($v46))));
}
function f18($v46, $v44){
$ext = explode('.',$v46);
$v64 = strtolower($ext[sizeof($ext)-1]);
if(strtolower($v64) != strtolower($v44)){
print ("no media selected");
exit;
return false;
} else {
return true;
}
if ((!ereg('\.\.', $v46)) && (file_exists($v46))) {
return true;
} else {
print ("no media selected");
exit;
return false;
}
}
function f19($v83){
$v73 = $v83;
$v73 = strip_tags(stripslashes($v73));
$v73 = strip_tags($v73);
$v73 = str_replace("\n", "x", $v73);
$v73 = str_replace("\r", "x", $v73);
$v73 = str_replace("\t", "x", $v73);
$v73 = str_replace("\\", "x", $v73);
$v73 = ereg_replace("\.+/", "x", $v73);
$v73 = ereg_replace("\.\.","x",$v73);
$v73 = ereg_replace("^[\/]+", "x", $v73);
return $v73;
}
function f17($v34){
if(@is_array($v34)){
foreach ($v34 as $key => $v110){
$v24[f19(urldecode($key))] = f19($v110);
}
} else {
$v24 = $v34;
}
return $v34;
}
$_REQUEST = f17($_REQUEST);
$v2 = array(
"action",
"theFile",
"filename",
"dir",
"getMyid3info",
"useMysql",
"queryValue",
"queryWhere",
"forceDownload",
"defaultVisualExt",
"theArtist",
"theTitle",
"s"
);
for($i=0;$i<sizeof($v2);$i++){
$var = $v2[$i];
if(!isset($_REQUEST[$var])){
if(!isset($$var)){
$$var = "";
}
} else {
$$var = $_REQUEST[$var];
}
}
if($useMysql=="yes"){
$action = "getmysql";
}
if(is_file($wimpy_auth)){
$v105 = TRUE;
require ($wimpy_auth);
}
function f11($v47){
$v38 = 1*(1024*1024);
$v36 = '';
$cnt =0;
$v53 = fopen($v47, 'rb');
if ($v53 === false) {
return false;
}
while (!feof($v53)) {
$v36 = fread($v53, $v38);
echo $v36;
}
$v82 = fclose($v53);
return $v82;
}
if($startDir != ""){
$v31['path']['physical'] = $startDir;
$serveMP3 = "yes";
}
function f8($v47){
$v38 = 1*(1024*1024);
$v36 = '';
$cnt = 0;
$v53 = fopen($v47, 'r');
if ($v53 === false) {
return false;
}
while (!feof($v53)) {
$v36 = fread($v53, $v38);
}
$v82 = fclose($v53);
$v4 = explode("\n", $v36);
$v5 = array();
foreach($v4 as $v59){
$v60 = trim($v59);
if($v60 !== ""){
array_push($v5, $v60);
}
}
return $v5;
}
function f4($v9){
$v23 = array();
array_push($v23, '<'.urldecode("%3F").'xml version="1.0"'.urldecode("%3F").'>');
array_push($v23, '<playlist>');
for ($i=0; $i<sizeof($v9); $i++) {
array_push($v23, '<item>');
foreach ($v9[$i] as $key => $v110) {
$v40 = f3($v110);
array_push($v23, '<'.$key.'>'.($v40).'</'.$key.'>');
}
array_push($v23, '</item>');
}
array_push($v23, '</playlist>');
header("Pragma: public");
header("Expires: Thu, 19 Nov 1981 08:52:00 GMT");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Content-Type: text/xml");
print (implode("", $v23));
exit;
}
function f16($v8){
$v9 = array();
for($i=0;$i<sizeof($v8);$i++){
$v32 = array();
$v32['filename'] = $v8[$i];
$v32['artist'] = "";
$v32['album'] = "";
$v32['title'] = "";
$v32['track'] = "";
$v32['comments'] = "";
$v32['genre'] = "";
$v32['seconds'] = "";
$v32['filesize'] = "";
$v32['bitrate'] = "";
$v32['visual'] = "";
$v9[$i] = $v32;
}
f4($v9);
}
function f14($v8){
$v9 = array();
for($i=0;$i<sizeof($v8);$i++){
$v65 = $v8[$i];
if(stristr($v65, '#EXTINF:')){
$v15 = explode(":", $v65);
$v16 = explode(",", $v15[1]);
$v32 = array();
$v32['filename'] = $v8[$i+1];
$v32['artist'] = "";
$v32['album'] = "";
$v32['title'] = $v16[1];;
$v32['track'] = "";
$v32['comments'] = "";
$v32['genre'] = "";
$v32['seconds'] = $v16[0];
$v32['filesize'] = "";
$v32['bitrate'] = "";
$v32['visual'] = "";
$v9[sizeof($v9)] = $v32;
$i++;
}
}
f4($v9);
}
function f15($v8){
$v9 = array();
for($i=0;$i<sizeof($v8);$i++){
$v65 = $v8[$i];
if(strtolower(substr($v65, 0, 4)) == "file"){
$v15 = explode("=", $v65);
$v16 = explode("=", $v8[$i+1]);
$v17 = explode("=", $v8[$i+2]);
$v32 = array();
$v32['filename'] = $v15[1];
$v32['artist'] = "";
$v32['album'] = "";
$v32['title'] = $v16[1];;
$v32['track'] = "";
$v32['comments'] = "";
$v32['genre'] = "";
$v32['seconds'] = $v17[1];
$v32['filesize'] = "";
$v32['bitrate'] = "";
$v32['visual'] = "";
$i++;
$i++;
$v9[sizeof($v9)] = $v32;
}
}
f4($v9);
}
if($action=="getVersion"){
print "$wimpyVersion";
exit;
} else if($action == "feedPlaylist"){
$v18 = f8(f21($theFile));
if(strtolower ($v18[0]) == "[playlist]"){
f15($v18);
} else if(strtoupper ($v18[0]) == "#EXTM3U"){
f14($v18);
} else {
f16($v18);
}
} else if ($action=="phpinfo"){
if($blockPHPinfo != "yes"){
$v73 = phpinfo();
echo "$v73";
exit;
}
} else if($action=="getCoverart"){
$theFile = urldecode($_REQUEST['theFile']);
$v88 = $startDir.str_replace("/", $v81, urldecode($theFile));
$ext = explode('.',$v88);
$v64 = strtolower($ext[sizeof($ext)-1]);
if(f18($v88, "jpg") === true || f18($v88, "swf") === true){
header("Expires: Thu, 19 Nov 1981 08:52:00 GMT");
header("Content-Type: image/jpeg");
header("Content-Length: ".@f19(@urldecode(@filesize($v88))));
f11($v88);
exit;
} else {
return "";
exit;
}
} else if($action=="getstartupdirlist"){
header("Content-Type: text/html");
header("charset: UTF-8");
if($getMyid3info == "yes"){
if(is_file('getid3.php')){
require ('getid3.php');
$v51 = new getID3;
} else if (is_file('getid3'.$v81.'getid3.php')){
require ('getid3'.$v81.'getid3.php');
$v51 = new getID3;
} else if (is_file(@$v52)){
require (@$v52);
$v51 = new getID3;
} else {
$getMyid3info = "no";
}
}
$v77 = f0($v31['path']['physical']);
echo (($v77));
} else if ($action=="dir"){
if($getMyid3info == "yes"){
if(is_file('getid3.php')){
require ('getid3.php');
$v51 = new getID3;
} else if (is_file('getid3'.$v81.'getid3.php')){
require ('getid3'.$v81.'getid3.php');
$v51 = new getID3;
} else if (is_file(@$v52)){
require (@$v52);
$v51 = new getID3;
} else {
$getMyid3info = "no";
}
}
$v66 = ($v31['path']['physical'].$v81.str_replace("/", $v81, str_replace($v31['path']['www']."/", "", f19($dir))));
$v77 = f0($v66);
echo ( ($v77));
exit;
} else if($action=="getmysql"){
require ("wimpy_mysql_get.php");
} else if($action == "updateMySQL"){
$v62 = "mysql";
$getMyid3info = "yes";
if(is_file('getid3.php')){
require ('getid3.php');
$v51 = new getID3;
} else if (is_file('getid3'.$v81.'getid3.php')){
require ('getid3'.$v81.'getid3.php');
$v51 = new getID3;
} else {
print 'You have elected to use ID3 information in the playlist.<br>';
print 'In order to present ID3 information you must upload the getID3<br>';
print 'library to your wimpy folder. The files can be found in the <br>';
print '"goodies" folder or downloaded from the following location:<br>';
print 'http://www.wimpyplayer.com/resources<br>';
print 'Please upload all of the getID3 files to the same location as wimpy.php<br>';
exit;
}
print "<b>Checking the mp3 directory specified in wimpy_mysql_conf.php configs</b><br>";
$AMySQLsendback = f0($v31['path']['physical'], "yes");
} else if ($action=="serveMP3"){
$theFile = f19($_REQUEST['theFile']);
@f18($theFile, "mp3");
if($startDir == ""){
$v88 = f21(urldecode($theFile));
} else {
$v88 = $v31['path']['physical'].$v81.(str_replace($v31['path']['www']."/", "", f19($_REQUEST['theFile'])));
}
$v88 = str_replace("/", $v81, $v88);
header("Pragma: public");
header("Expires: Thu, 19 Nov 1981 08:52:00 GMT");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Content-Type: audio/x-mpeg, audio/x-mpeg-3, audio/mpeg3");
header("Content-Length: ".@f19(@urldecode(@filesize($v88))));
f11($v88);
exit;
} else if ($action=="downloadfile"){
$theFile = f19($_REQUEST['theFile']);
@f18($theFile, "mp3");
$v88 = f21(urldecode($theFile));
if($startDir == ""){
$v88 = f21(urldecode($theFile));
} else {
$v88 = $v31['path']['physical'].$v81.(str_replace($v31['path']['www']."/", "", f19($_REQUEST['theFile'])));
}
$v3 = explode (".", basename($v88));
$v99 = array_pop($v3);
if(strtolower($v99) != "mp3"){
$v42 = basename($v88).".mp3";
} else {
$v42 = basename($v88);
}
header("Pragma: public");
header("Expires: Thu, 19 Nov 1981 08:52:00 GMT");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: private");
header("Content-Type: audio/x-mpeg, audio/x-mpeg-3, audio/mpeg3");
header( 'Content-Disposition: attachment; filename="'.$v42.'"' );
header("Content-Transfer-Encoding: binary");
header("Content-Length: ".filesize($v88));
f11($v88);
exit;
} else if ($action=="podcast"){
$v62 = "mysql";
$getMyid3info = "yes";
if(is_file('getid3.php')){
require ('getid3.php');
$v51 = new getID3;
} else if (is_file('getid3'.$v81.'getid3.php')){
require ('getid3'.$v81.'getid3.php');
$v51 = new getID3;
} else {
print 'You have elected to use ID3 information in the playlist.<br>';
print 'In order to present ID3 information you must upload the getID3<br>';
print 'library to your wimpy folder. The files can be found in the <br>';
print '"goodies" folder or downloaded from the following location:<br>';
print 'http://www.wimpyplayer.com/resources<br>';
print 'Please upload all of the getID3 files to the same location as wimpy.php<br>';
exit;
}
$podBack = f0($v31['path']['physical'], "yes");
} else {
$v71 = "";
$v71 .= $wimpySwf;
$v71 .= "?wimpyApp=".$wimpyApp;
if($v106){
$v71 .= "&wimpySkin=".$wimpySkin;
}
if($trackPlays != ""){
$v71 .= "&trackPlays=".$trackPlays;
}
if($voteScript != ""){
$v71 .= "&voteScript=".$voteScript;
}
if($defaultImage != ""){
$v71 .= "&defaultImage=".$defaultImage;
}
if($startOnTrack != ""){
$v71 .= "&startOnTrack=".$startOnTrack;
}
if($startPlayingOnload == "yes"){
$v71 .= "&startPlayingOnload=".$startPlayingOnload;
}
if($shuffleOnLoad == "yes"){
$v71 .= "&shuffleOnLoad=".$shuffleOnLoad;
}
if($randomOnLoad == "yes"){
$v71 .= "&randomOnLoad=".$randomOnLoad;
}
if($displayDownloadButton == "yes"){
$v71 .= "&displayDownloadButton=".$displayDownloadButton;
}
if($forceDownload == "yes"){
$v71 .= "&forceDownload=".$forceDownload;
}
if($popUpHelp == "yes"){
$v71 .= "&popUpHelp=".$popUpHelp;
}
if($getMyid3info == "yes"){
$v71 .= "&getMyid3info=".$getMyid3info;
}
if($autoAdvance == "no"){
$v71 .= "&autoAdvance=".$autoAdvance;
}
if($serveMP3 == "yes"){
$v71 .= "&serveMP3=".$serveMP3;
}
if($loopPlaylist == "one" || $loopPlaylist == "all"){
$v71 .= "&loopPlaylist=".$loopPlaylist;
}
if($forceXMLplaylist == "yes"){
$v71 .= "&forceXMLplaylist=".$forceXMLplaylist;
}
if($useSysCodePage == "yes"){
$v71 .= "&useSysCodePage=".$useSysCodePage;
}
if($ecommerce == "yes"){
$v71 .= "&ecommerce=".$ecommerce;
}
if($useMysql == "yes"){
$v71 .= "&useMysql=".$useMysql;
}
if($defaultVisualExt == "swf"){
$v71 .= "&defaultVisualExt=".$defaultVisualExt;
}
if($scrollInfoDisplay == "yes"){
$v71 .= "&scrollInfoDisplay=".$scrollInfoDisplay;
}
if($infoDisplayTime != ""){
$v71 .= "&infoDisplayTime=".$infoDisplayTime;
}
if($bufferAudio != ""){
$v71 .= "&bufferAudio=".$bufferAudio;
}
if($theVolume != "" && $theVolume <= 100 && $theVolume >= 0){
$v71 .= "&theVolume=".$theVolume;
}
if($ecomWindow != ""){
$v71 .= "&ecomWindow=".$ecomWindow;
}
if($bkgdColor == ""){
$bkgdColor = "000000";
}
if($tptBkgd == "yes"){
$v71 .= "&tptBkgd=".$tptBkgd;
$v107 = true;
} else {
$v107 = false;
}
$v76 = "\r\n";
if($v107){
$v101 = 'wmode="transparent" ';
$v102 = '<param name="wmode" value="transparent" />'.$v76;
} else {
$v101 = "";
$v102 = "";
}
$v49 = '<HTML>'.$v76;
$v49 .= '<HEAD>'.$v76;
$v49 .= '<TITLE>'.$wimpyHTMLpageTitle.'</TITLE>'.$v76;
$v49 .= '</HEAD>'.$v76;
$v49 .= '<BODY bgcolor="#'.$bkgdColor.'" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">'.$v76;
$v49 .= '<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">'.$v76;
$v49 .= '  <tr>'.$v76;
$v49 .= '<td align="center" valign="middle">'.$v76;
$v49 .= '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,47,0" width="'.$v80.'" height="'.$v79.'" id="wimpy">'.$v76;
$v49 .= '<param name="movie" value="'.$v71.'" />'.$v76;
$v49 .= '<param name="loop" value="false" />'.$v76;
$v49 .= '<param name="menu" value="false" />'.$v76;
$v49 .= '<param name="quality" value="high" />'.$v76;
$v49 .= '<param name="scale" value="noscale" />'.$v76;
$v49 .= '<param name="salign" value="lt" />'.$v76;
$v49 .= '<param name="bgcolor" value="#'.$bkgdColor.'" />'.$v76;
$v49 .= "$v102";
$v49 .= '<embed src="'.$v71.'" width="'.$v80.'" height="'.$v79.'" bgcolor="#'.$bkgdColor.'" loop="false" menu="false" quality="high" scale="noscale" salign="lt" id="wimpy" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" '.$v101.'/></object>'.$v76;
$v49 .= '</td>'.$v76;
$v49 .= '</tr>'.$v76;
$v49 .= '</table>'.$v76;
$v49 .= '</BODY>'.$v76;
$v49 .= '</HTML>'.$v76;
print ($v49);
exit;
}
?>