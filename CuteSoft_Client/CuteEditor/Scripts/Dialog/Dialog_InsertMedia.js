var OxO57c0=["hiddenDirectory","hiddenFile","hiddenAlert","hiddenAction","hiddenActionData","disabled","[[Disabled]]","[[SpecifyNewFolderName]]","","value","createdir","[[CopyMoveto]]","/","move","copy","[[AreyouSureDelete]]","parentNode","text","isdir","true",".","[[SpecifyNewFileName]]","rename","path","True","False",":","FoldersAndFiles","TR","length","this.bgColor=\x27#eeeeee\x27;","onmouseover","this.bgColor=\x27\x27;","onmouseout","nodeName","INPUT","changedir","url","TargetUrl","htmlcode","onload","getElementsByTagName","table","sortable","className"," ","id","rows","cells","innerHTML","\x3Ca href=\x22#\x22 onclick=\x22ts_resortTable(this);return false;\x22\x3E","\x3Cspan class=\x22sortarrow\x22\x3E\x26nbsp;\x3C/span\x3E\x3C/a\x3E","string","undefined","innerText","childNodes","nodeValue","nodeType","span","cellIndex","TABLE","sortdir","down","\x26uarr;","up","\x26darr;","sortbottom","tBodies","sortarrow","\x26nbsp;","20","19","Form1","Image1","FolderDescription","CreateDir","Copy","Move","Delete","DoRefresh","name_Cell","size_Cell","op_Cell","row0","row0_cb","divpreview","Width","Height","AutoStart","ShowControls","ShowStatusBar","Button1","Button2","checked","\x3Cembed name=\x22MediaPlayer1\x22 src=\x22","\x22 autostart=\x22","\x22 showcontrols=\x22","\x22  width=\x22","\x22 height=\x22","\x22 type=\x22application/x-mplayer2\x22 pluginspage=\x22http://www.microsoft.com/Windows/MediaPlayer\x22 \x3E\x3C/embed\x3E\x0A","Please choose a Media movie to insert","w","px","h","medianame","\x3Cobject classid=\x22CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95\x22 "," codebase=\x22http://activex.microsoft.com/activex/"," controls/mplayer/en/nsmp2inf.cab#Version=6,0,02,902\x22 "," standby=\x22Loading Microsoft Windows Media Player components...\x22 "," type=\x22application/x-oleobject\x22","  height=\x22","\x22 width=\x22","\x22 /\x3E","\x3Cparam name=\x22FileName\x22 value=\x22","\x22/\x3E","\x3Cparam name=\x22autoStart\x22 value=\x22","\x3Cparam name=\x22showControls\x22 value=\x22","\x3C/object\x3E","zoom","style","wrapupPrompt","iepromptfield","display","none","body","div","IEPromptBox","promptBlackout","border","2px solid blue","backgroundColor","#DDDDDD","position","absolute","width","330px","zIndex","100","\x3Cdiv style=\x22width: 100%; background-color: blue; color: white; font-family: verdana; font-size: 10pt; font-weight: bold; height: 20px\x22\x3E[[InputRequired]]\x3C/div\x3E","\x3Cdiv style=\x22padding: 10px\x22\x3E","\x3CBR\x3E\x3CBR\x3E","\x3Cform action=\x22\x22 onsubmit=\x22return wrapupPrompt()\x22\x3E","\x3Cinput id=\x22iepromptfield\x22 name=\x22iepromptdata\x22 type=text size=46 value=\x22","\x22\x3E","\x3Cbr\x3E\x3Cbr\x3E\x3Ccenter\x3E","\x3Cinput type=\x22submit\x22 value=\x22\x26nbsp;\x26nbsp;\x26nbsp;[[OK]]\x26nbsp;\x26nbsp;\x26nbsp;\x22\x3E","\x26nbsp;\x26nbsp;\x26nbsp;\x26nbsp;\x26nbsp;\x26nbsp;","\x3Cinput type=\x22button\x22 onclick=\x22wrapupPrompt(true)\x22 value=\x22\x26nbsp;[[Cancel]]\x26nbsp;\x22\x3E","\x3C/form\x3E\x3C/div\x3E","top","100px","offsetWidth","left","block","CuteEditor_ColorPicker_ButtonOver(this)"];var hiddenDirectory=Window_GetElement(window,OxO57c0[0x0],true);var hiddenFile=Window_GetElement(window,OxO57c0[0x1],true);var hiddenAlert=Window_GetElement(window,OxO57c0[0x2],true);var hiddenAction=Window_GetElement(window,OxO57c0[0x3],true);var hiddenActionData=Window_GetElement(window,OxO57c0[0x4],true); function CreateDir_click(){if(Event_GetSrcElement()[OxO57c0[0x5]]){ alert(OxO57c0[0x6]) ;return false;} ;if(Browser_IsIE7()){ IEprompt(Ox273,OxO57c0[0x7],OxO57c0[0x8]) ; function Ox273(Ox274){if(Ox274){ hiddenActionData[OxO57c0[0x9]]=Ox274 ; hiddenAction[OxO57c0[0x9]]=OxO57c0[0xa] ; window.PostBackAction() ;return true;} else {return false;} ;}  ;return Event_CancelEvent();} else {var Ox274=prompt(OxO57c0[0x7],OxO57c0[0x8]);if(Ox274){ hiddenActionData[OxO57c0[0x9]]=Ox274 ;return true;} else {return false;} ;return false;} ;}  ; function Move_click(){if(Event_GetSrcElement()[OxO57c0[0x5]]){ alert(OxO57c0[0x6]) ;return false;} ;if(Browser_IsIE7()){ IEprompt(Ox273,OxO57c0[0xb],OxO57c0[0xc]) ; function Ox273(Ox274){if(Ox274){ hiddenActionData[OxO57c0[0x9]]=Ox274 ; hiddenAction[OxO57c0[0x9]]=OxO57c0[0xd] ; window.PostBackAction() ;return true;} else {return false;} ;}  ;return Event_CancelEvent();} else {var Ox274=prompt(OxO57c0[0xb],OxO57c0[0xc]);if(Ox274){ hiddenActionData[OxO57c0[0x9]]=Ox274 ;return true;} else {return false;} ;return false;} ;}  ; function Copy_click(){if(Event_GetSrcElement()[OxO57c0[0x5]]){ alert(OxO57c0[0x6]) ;return false;} ;if(Browser_IsIE7()){ IEprompt(Ox273,OxO57c0[0xb],OxO57c0[0xc]) ; function Ox273(Ox274){if(Ox274){ hiddenActionData[OxO57c0[0x9]]=Ox274 ; hiddenAction[OxO57c0[0x9]]=OxO57c0[0xe] ; window.PostBackAction() ;return true;} else {return false;} ;}  ;return Event_CancelEvent();} else {var Ox274=prompt(OxO57c0[0xb],OxO57c0[0xc]);if(Ox274){ hiddenActionData[OxO57c0[0x9]]=Ox274 ;return true;} else {return false;} ;return false;} ;}  ; function Delete_click(){if(Event_GetSrcElement()[OxO57c0[0x5]]){ alert(OxO57c0[0x6]) ;return false;} ;return confirm(OxO57c0[0xf]);}  ; function EditImg_click(img){if(img[OxO57c0[0x5]]){ alert(OxO57c0[0x6]) ;return false;} ;var Ox279=img[OxO57c0[0x10]][OxO57c0[0x10]];var Ox27a=Ox279[OxO57c0[0x11]];var name;var Ox27b;if(Browser_IsOpera()){ Ox27b=Ox279.getAttribute(OxO57c0[0x12])==OxO57c0[0x13] ;} else { Ox27b=Ox279[OxO57c0[0x12]] ;} ;if(Browser_IsIE7()){var Ox12c;if(Ox27b){ IEprompt(Ox273,OxO57c0[0x7],Ox27a) ;} else {var i=Ox27a.lastIndexOf(OxO57c0[0x14]); Ox12c=Ox27a.substr(i) ;var Ox25=Ox27a.substr(0x0,Ox27a.lastIndexOf(OxO57c0[0x14])); IEprompt(Ox273,OxO57c0[0x15],Ox25) ;} ; function Ox273(Ox274){if(Ox274&&Ox274!=Ox279[OxO57c0[0x11]]){if(!Ox27b){ Ox274=Ox274+Ox12c ;} ; hiddenAction[OxO57c0[0x9]]=OxO57c0[0x16] ; hiddenActionData[OxO57c0[0x9]]=(Ox27b?OxO57c0[0x18]:OxO57c0[0x19])+OxO57c0[0x1a]+Ox279[OxO57c0[0x17]]+OxO57c0[0x1a]+Ox274 ; window.PostBackAction() ;} ;}  ;} else {if(Ox27b){ name=prompt(OxO57c0[0x7],Ox27a) ;} else {var i=Ox27a.lastIndexOf(OxO57c0[0x14]);var Ox12c=Ox27a.substr(i);var Ox25=Ox27a.substr(0x0,Ox27a.lastIndexOf(OxO57c0[0x14])); name=prompt(OxO57c0[0x15],Ox25) ;if(name){ name=name+Ox12c ;} ;} ;if(name&&name!=Ox279[OxO57c0[0x11]]){ hiddenAction[OxO57c0[0x9]]=OxO57c0[0x16] ; hiddenActionData[OxO57c0[0x9]]=(Ox27b?OxO57c0[0x18]:OxO57c0[0x19])+OxO57c0[0x1a]+Ox279[OxO57c0[0x17]]+OxO57c0[0x1a]+name ; window.PostBackAction() ;} ;} ;return Event_CancelEvent();}  ; setMouseOver() ; function setMouseOver(){var FoldersAndFiles=Window_GetElement(window,OxO57c0[0x1b],true);var Ox27e=FoldersAndFiles.getElementsByTagName(OxO57c0[0x1c]);for(var i=0x0;i<Ox27e[OxO57c0[0x1d]];i++){var Ox279=Ox27e[i]; Ox279[OxO57c0[0x1f]]= new Function(OxO57c0[0x8],OxO57c0[0x1e]) ; Ox279[OxO57c0[0x21]]= new Function(OxO57c0[0x8],OxO57c0[0x20]) ;} ;}  ; function row_click(Ox279){var Ox27b;if(Browser_IsOpera()){ Ox27b=Ox279.getAttribute(OxO57c0[0x12])==OxO57c0[0x13] ;} else { Ox27b=Ox279[OxO57c0[0x12]] ;} ;if(Ox27b){if(Event_GetSrcElement()[OxO57c0[0x22]]==OxO57c0[0x23]){return ;} ; hiddenAction[OxO57c0[0x9]]=OxO57c0[0x24] ; hiddenActionData[OxO57c0[0x9]]=Ox279.getAttribute(OxO57c0[0x17]) ; window.PostBackAction() ;} else {var Ox169=Ox279.getAttribute(OxO57c0[0x17]); hiddenFile[OxO57c0[0x9]]=Ox169 ;var Ox280=Ox279.getAttribute(OxO57c0[0x25]); Window_GetElement(window,OxO57c0[0x26],true)[OxO57c0[0x9]]=Ox280 ;var htmlcode=Ox279.getAttribute(OxO57c0[0x27]);if(htmlcode!=OxO57c0[0x8]&&htmlcode!=null){ do_preview(htmlcode) ;} else {try{ Actualsize() ;} catch(x){ do_preview() ;} ;} ;} ;}  ; function do_preview(){}  ; function reset_hiddens(){if(hiddenAlert[OxO57c0[0x9]]){ alert(hiddenAlert.value) ;} ; hiddenAlert[OxO57c0[0x9]]=OxO57c0[0x8] ; hiddenAction[OxO57c0[0x9]]=OxO57c0[0x8] ; hiddenActionData[OxO57c0[0x9]]=OxO57c0[0x8] ;}  ; Event_Attach(window,OxO57c0[0x28],reset_hiddens) ; function RequireFileBrowseScript(){}  ; function Actualsize(){}  ; Event_Attach(window,OxO57c0[0x28],sortables_init) ;var SORT_COLUMN_INDEX; function sortables_init(){if(!document[OxO57c0[0x29]]){return ;} ;var Ox285=document.getElementsByTagName(OxO57c0[0x2a]);for(var Ox286=0x0;Ox286<Ox285[OxO57c0[0x1d]];Ox286++){var Ox287=Ox285[Ox286];if(((OxO57c0[0x2d]+Ox287[OxO57c0[0x2c]]+OxO57c0[0x2d]).indexOf(OxO57c0[0x2b])!=-0x1)&&(Ox287[OxO57c0[0x2e]])){ ts_makeSortable(Ox287) ;} ;} ;}  ; function ts_makeSortable(Ox289){if(Ox289[OxO57c0[0x2f]]&&Ox289[OxO57c0[0x2f]][OxO57c0[0x1d]]>0x0){var Ox28a=Ox289[OxO57c0[0x2f]][0x0];} ;if(!Ox28a){return ;} ;for(var i=0x2;i<0x4;i++){var Ox28b=Ox28a[OxO57c0[0x30]][i];var Ox208=ts_getInnerText(Ox28b); Ox28b[OxO57c0[0x31]]=OxO57c0[0x32]+Ox208+OxO57c0[0x33] ;} ;}  ; function ts_getInnerText(Ox81){if( typeof Ox81==OxO57c0[0x34]){return Ox81;} ;if( typeof Ox81==OxO57c0[0x35]){return Ox81;} ;if(Ox81[OxO57c0[0x36]]){return Ox81[OxO57c0[0x36]];} ;var Ox24=OxO57c0[0x8];var Ox235=Ox81[OxO57c0[0x37]];var Ox2b=Ox235[OxO57c0[0x1d]];for(var i=0x0;i<Ox2b;i++){switch(Ox235[i][OxO57c0[0x39]]){case 0x1: Ox24+=ts_getInnerText(Ox235[i]) ;break ;case 0x3: Ox24+=Ox235[i][OxO57c0[0x38]] ;break ;;;} ;} ;return Ox24;}  ; function ts_resortTable(Ox28e){var Ox28f;for(var Ox290=0x0;Ox290<Ox28e[OxO57c0[0x37]][OxO57c0[0x1d]];Ox290++){if(Ox28e[OxO57c0[0x37]][Ox290][OxO57c0[0x22]]&&Ox28e[OxO57c0[0x37]][Ox290][OxO57c0[0x22]].toLowerCase()==OxO57c0[0x3a]){ Ox28f=Ox28e[OxO57c0[0x37]][Ox290] ;} ;} ;var Ox291=ts_getInnerText(Ox28f);var Ox64=Ox28e[OxO57c0[0x10]];var Ox292=Ox64[OxO57c0[0x3b]];var Ox289=getParent(Ox64,OxO57c0[0x3c]);if(Ox289[OxO57c0[0x2f]][OxO57c0[0x1d]]<=0x1){return ;} ;var Ox293=ts_getInnerText(Ox289[OxO57c0[0x2f]][0x1][OxO57c0[0x30]][Ox292]);var Ox294=ts_sort_caseinsensitive;if(Ox293.match(/^\d\d[\/-]\d\d[\/-]\d\d\d\d$/)){ Ox294=ts_sort_date ;} ;if(Ox293.match(/^\d\d[\/-]\d\d[\/-]\d\d$/)){ Ox294=ts_sort_date ;} ;if(Ox293.match(/^[?]/)){ Ox294=ts_sort_currency ;} ;if(Ox293.match(/^[\d\.]+$/)){ Ox294=ts_sort_numeric ;} ; SORT_COLUMN_INDEX=Ox292 ;var Ox28a= new Array();var Ox295= new Array();for(var i=0x0;i<Ox289[OxO57c0[0x2f]][0x0][OxO57c0[0x1d]];i++){ Ox28a[i]=Ox289[OxO57c0[0x2f]][0x0][i] ;} ;for(var j=0x1;j<Ox289[OxO57c0[0x2f]][OxO57c0[0x1d]];j++){ Ox295[j-0x1]=Ox289[OxO57c0[0x2f]][j] ;} ; Ox295.sort(Ox294) ;if(Ox28f.getAttribute(OxO57c0[0x3d])==OxO57c0[0x3e]){var Ox296=OxO57c0[0x3f]; Ox295.reverse() ; Ox28f.setAttribute(OxO57c0[0x3d],OxO57c0[0x40]) ;} else { Ox296=OxO57c0[0x41] ; Ox28f.setAttribute(OxO57c0[0x3d],OxO57c0[0x3e]) ;} ;for( i=0x0 ;i<Ox295[OxO57c0[0x1d]];i++){if(!Ox295[i][OxO57c0[0x2c]]||(Ox295[i][OxO57c0[0x2c]]&&(Ox295[i][OxO57c0[0x2c]].indexOf(OxO57c0[0x42])==-0x1))){ Ox289[OxO57c0[0x43]][0x0].appendChild(Ox295[i]) ;} ;} ;for( i=0x0 ;i<Ox295[OxO57c0[0x1d]];i++){if(Ox295[i][OxO57c0[0x2c]]&&(Ox295[i][OxO57c0[0x2c]].indexOf(OxO57c0[0x42])!=-0x1)){ Ox289[OxO57c0[0x43]][0x0].appendChild(Ox295[i]) ;} ;} ;var Ox297=document.getElementsByTagName(OxO57c0[0x3a]);for(var Ox290=0x0;Ox290<Ox297[OxO57c0[0x1d]];Ox290++){if(Ox297[Ox290][OxO57c0[0x2c]]==OxO57c0[0x44]){if(getParent(Ox297[Ox290],OxO57c0[0x2a])==getParent(Ox28e,OxO57c0[0x2a])){ Ox297[Ox290][OxO57c0[0x31]]=OxO57c0[0x45] ;} ;} ;} ; Ox28f[OxO57c0[0x31]]=Ox296 ;}  ; function getParent(Ox81,Ox299){if(Ox81==null){return null;} else {if(Ox81[OxO57c0[0x39]]==0x1&&Ox81[OxO57c0[0x22]].toLowerCase()==Ox299.toLowerCase()){return Ox81;} else {return getParent(Ox81.parentNode,Ox299);} ;} ;}  ; function ts_sort_date(Ox14d,Ox17){var Ox29b=ts_getInnerText(Ox14d[OxO57c0[0x30]][SORT_COLUMN_INDEX]);var Ox29c=ts_getInnerText(Ox17[OxO57c0[0x30]][SORT_COLUMN_INDEX]);if(Ox29b[OxO57c0[0x1d]]==0xa){var Ox29d=Ox29b.substr(0x6,0x4)+Ox29b.substr(0x3,0x2)+Ox29b.substr(0x0,0x2);} else {var Ox29e=Ox29b.substr(0x6,0x2);if(parseInt(Ox29e)<0x32){ Ox29e=OxO57c0[0x46]+Ox29e ;} else { Ox29e=OxO57c0[0x47]+Ox29e ;} ;var Ox29d=Ox29e+Ox29b.substr(0x3,0x2)+Ox29b.substr(0x0,0x2);} ;if(Ox29c[OxO57c0[0x1d]]==0xa){var Ox29f=Ox29c.substr(0x6,0x4)+Ox29c.substr(0x3,0x2)+Ox29c.substr(0x0,0x2);} else { Ox29e=Ox29c.substr(0x6,0x2) ;if(parseInt(Ox29e)<0x32){ Ox29e=OxO57c0[0x46]+Ox29e ;} else { Ox29e=OxO57c0[0x47]+Ox29e ;} ;var Ox29f=Ox29e+Ox29c.substr(0x3,0x2)+Ox29c.substr(0x0,0x2);} ;if(Ox29d==Ox29f){return 0x0;} ;if(Ox29d<Ox29f){return -0x1;} ;return 0x1;}  ; function ts_sort_currency(Ox14d,Ox17){var Ox29b=ts_getInnerText(Ox14d[OxO57c0[0x30]][SORT_COLUMN_INDEX]).replace(/[^0-9.]/g,OxO57c0[0x8]);var Ox29c=ts_getInnerText(Ox17[OxO57c0[0x30]][SORT_COLUMN_INDEX]).replace(/[^0-9.]/g,OxO57c0[0x8]);return parseFloat(Ox29b)-parseFloat(Ox29c);}  ; function ts_sort_numeric(Ox14d,Ox17){var Ox29b=parseFloat(ts_getInnerText(Ox14d[OxO57c0[0x30]][SORT_COLUMN_INDEX]));if(isNaN(Ox29b)){ Ox29b=0x0 ;} ;var Ox29c=parseFloat(ts_getInnerText(Ox17[OxO57c0[0x30]][SORT_COLUMN_INDEX]));if(isNaN(Ox29c)){ Ox29c=0x0 ;} ;return Ox29b-Ox29c;}  ; function ts_sort_caseinsensitive(Ox14d,Ox17){var Ox29b=ts_getInnerText(Ox14d[OxO57c0[0x30]][SORT_COLUMN_INDEX]).toLowerCase();var Ox29c=ts_getInnerText(Ox17[OxO57c0[0x30]][SORT_COLUMN_INDEX]).toLowerCase();if(Ox29b==Ox29c){return 0x0;} ;if(Ox29b<Ox29c){return -0x1;} ;return 0x1;}  ; function ts_sort_default(Ox14d,Ox17){var Ox29b=ts_getInnerText(Ox14d[OxO57c0[0x30]][SORT_COLUMN_INDEX]);var Ox29c=ts_getInnerText(Ox17[OxO57c0[0x30]][SORT_COLUMN_INDEX]);if(Ox29b==Ox29c){return 0x0;} ;if(Ox29b<Ox29c){return -0x1;} ;return 0x1;} [sortables_init] ; RequireFileBrowseScript() ;var Form1=Window_GetElement(window,OxO57c0[0x48],true);var hiddenDirectory=Window_GetElement(window,OxO57c0[0x0],true);var hiddenFile=Window_GetElement(window,OxO57c0[0x1],true);var hiddenAlert=Window_GetElement(window,OxO57c0[0x2],true);var hiddenAction=Window_GetElement(window,OxO57c0[0x3],true);var hiddenActionData=Window_GetElement(window,OxO57c0[0x4],true);var Image1=Window_GetElement(window,OxO57c0[0x49],true);var FolderDescription=Window_GetElement(window,OxO57c0[0x4a],true);var CreateDir=Window_GetElement(window,OxO57c0[0x4b],true);var Copy=Window_GetElement(window,OxO57c0[0x4c],true);var Move=Window_GetElement(window,OxO57c0[0x4d],true);var FoldersAndFiles=Window_GetElement(window,OxO57c0[0x1b],true);var Delete=Window_GetElement(window,OxO57c0[0x4e],true);var DoRefresh=Window_GetElement(window,OxO57c0[0x4f],true);var name_Cell=Window_GetElement(window,OxO57c0[0x50],true);var size_Cell=Window_GetElement(window,OxO57c0[0x51],true);var op_Cell=Window_GetElement(window,OxO57c0[0x52],true);var row0=Window_GetElement(window,OxO57c0[0x53],true);var row0_cb=Window_GetElement(window,OxO57c0[0x54],true);var divpreview=Window_GetElement(window,OxO57c0[0x55],true);var Width=Window_GetElement(window,OxO57c0[0x56],true);var Height=Window_GetElement(window,OxO57c0[0x57],true);var AutoStart=Window_GetElement(window,OxO57c0[0x58],true);var ShowControls=Window_GetElement(window,OxO57c0[0x59],true);var ShowStatusBar=Window_GetElement(window,OxO57c0[0x5a],true);var TargetUrl=Window_GetElement(window,OxO57c0[0x26],true);var Button1=Window_GetElement(window,OxO57c0[0x5b],true);var Button2=Window_GetElement(window,OxO57c0[0x5c],true);var editor=Window_GetDialogArguments(window); do_preview() ; function do_preview(){var Ox2e5;var Oxd5;var Oxd4;if(TargetUrl[OxO57c0[0x9]]==OxO57c0[0x8]){return ;} ;var Ox31f,Ox320,Ox321;if(AutoStart[OxO57c0[0x5d]]){ Ox31f=0x1 ;} else { Ox31f=0x0 ;} ;if(ShowStatusBar[OxO57c0[0x5d]]){ Ox320=0x1 ;} else { Ox320=0x0 ;} ;if(ShowControls[OxO57c0[0x5d]]){ Ox321=0x1 ;} else { Ox321=0x0 ;} ; Oxd5=Width[OxO57c0[0x9]] ; Oxd4=Height[OxO57c0[0x9]] ;var Ox2e7=0xf0;var Ox2e8=0xc8;var Ox33=parseInt(Oxd5);var Ox29=parseInt(Oxd4);if(Ox33>Ox29){ Oxd5=Ox2e7 ; Oxd4=Ox2e8*Ox29/Ox33 ;} else { Oxd5=Ox2e7*Ox33/Ox29 ; Oxd4=Ox2e8 ;} ; Oxd5=parseInt(Oxd5) ; Oxd4=parseInt(Oxd4) ;var Ox2bf=OxO57c0[0x5e]+TargetUrl[OxO57c0[0x9]]+OxO57c0[0x5f]+Ox31f+OxO57c0[0x60]+Ox321+OxO57c0[0x61]+Oxd5+OxO57c0[0x62]+Oxd4+OxO57c0[0x63]; divpreview[OxO57c0[0x31]]=Ox2bf ;}  ;var parameters= new Array(); function do_insert(){if(TargetUrl[OxO57c0[0x9]]==OxO57c0[0x8]){ alert(OxO57c0[0x64]) ;return false;} ; parameters[OxO57c0[0x65]]=Width[OxO57c0[0x9]]+OxO57c0[0x66] ; parameters[OxO57c0[0x67]]=Height[OxO57c0[0x9]]+OxO57c0[0x66] ; parameters[OxO57c0[0x68]]=TargetUrl[OxO57c0[0x9]] ;if(AutoStart[OxO57c0[0x5d]]){ parameters[OxO57c0[0x58]]=0x1 ;} else { parameters[OxO57c0[0x58]]=0x0 ;} ;if(ShowStatusBar[OxO57c0[0x5d]]){ parameters[OxO57c0[0x5a]]=0x1 ;} else { parameters[OxO57c0[0x5a]]=0x0 ;} ;if(ShowControls[OxO57c0[0x5d]]){ parameters[OxO57c0[0x59]]=0x1 ;} else { parameters[OxO57c0[0x59]]=0x0 ;} ;if(TargetUrl[OxO57c0[0x9]]==OxO57c0[0x8]){ alert(OxO57c0[0x64]) ;return false;} ;var Ox2f2=OxO57c0[0x5e]+parameters[OxO57c0[0x68]]+OxO57c0[0x5f]+parameters[OxO57c0[0x58]]+OxO57c0[0x60]+parameters[OxO57c0[0x59]]+OxO57c0[0x61]+parameters[OxO57c0[0x65]]+OxO57c0[0x62]+parameters[OxO57c0[0x67]]+OxO57c0[0x63];var Ox2bf=OxO57c0[0x69]+OxO57c0[0x6a]+OxO57c0[0x6b]+OxO57c0[0x6c]+OxO57c0[0x6d]+OxO57c0[0x6e]+parameters[OxO57c0[0x67]]+OxO57c0[0x6f]+parameters[OxO57c0[0x65]]+OxO57c0[0x70]; Ox2bf=Ox2bf+OxO57c0[0x71]+parameters[OxO57c0[0x68]]+OxO57c0[0x72] ; Ox2bf=Ox2bf+OxO57c0[0x73]+parameters[OxO57c0[0x58]]+OxO57c0[0x72] ; Ox2bf=Ox2bf+OxO57c0[0x74]+parameters[OxO57c0[0x59]]+OxO57c0[0x72] ; Ox2bf=Ox2bf+Ox2f2+OxO57c0[0x75] ; editor.PasteHTML(Ox2bf) ; Window_CloseDialog(window) ;}  ; function do_cancel(){ Window_CloseDialog(window) ;}  ; function Zoom_In(){if(divpreview[OxO57c0[0x77]][OxO57c0[0x76]]!=0x0){ divpreview[OxO57c0[0x77]][OxO57c0[0x76]]*=1.2 ;} else { divpreview[OxO57c0[0x77]][OxO57c0[0x76]]=1.2 ;} ;}  ; function Zoom_Out(){if(divpreview[OxO57c0[0x77]][OxO57c0[0x76]]!=0x0){ divpreview[OxO57c0[0x77]][OxO57c0[0x76]]*=0.8 ;} else { divpreview[OxO57c0[0x77]][OxO57c0[0x76]]=0.8 ;} ;}  ; function Actualsize(){ divpreview[OxO57c0[0x77]][OxO57c0[0x76]]=0x1 ; do_preview() ;}  ;if(Browser_IsIE7()){var _dialogPromptID=null; function IEprompt(Ox273,Ox2c3,Ox2c4){ that=this ; this[OxO57c0[0x78]]=function (Ox2c5){ val=document.getElementById(OxO57c0[0x79])[OxO57c0[0x9]] ; _dialogPromptID[OxO57c0[0x77]][OxO57c0[0x7a]]=OxO57c0[0x7b] ; document.getElementById(OxO57c0[0x79])[OxO57c0[0x9]]=OxO57c0[0x8] ;if(Ox2c5){ val=OxO57c0[0x8] ;} ; Ox273(val) ;return false;}  ;if(Ox2c4==undefined){ Ox2c4=OxO57c0[0x8] ;} ;if(_dialogPromptID==null){var Ox2c6=document.getElementsByTagName(OxO57c0[0x7c])[0x0]; tnode=document.createElement(OxO57c0[0x7d]) ; tnode[OxO57c0[0x2e]]=OxO57c0[0x7e] ; Ox2c6.appendChild(tnode) ; _dialogPromptID=document.getElementById(OxO57c0[0x7e]) ; tnode=document.createElement(OxO57c0[0x7d]) ; tnode[OxO57c0[0x2e]]=OxO57c0[0x7f] ; Ox2c6.appendChild(tnode) ; _dialogPromptID[OxO57c0[0x77]][OxO57c0[0x80]]=OxO57c0[0x81] ; _dialogPromptID[OxO57c0[0x77]][OxO57c0[0x82]]=OxO57c0[0x83] ; _dialogPromptID[OxO57c0[0x77]][OxO57c0[0x84]]=OxO57c0[0x85] ; _dialogPromptID[OxO57c0[0x77]][OxO57c0[0x86]]=OxO57c0[0x87] ; _dialogPromptID[OxO57c0[0x77]][OxO57c0[0x88]]=OxO57c0[0x89] ;} ;var Ox2c7=OxO57c0[0x8a]; Ox2c7+=OxO57c0[0x8b]+Ox2c3+OxO57c0[0x8c] ; Ox2c7+=OxO57c0[0x8d] ; Ox2c7+=OxO57c0[0x8e]+Ox2c4+OxO57c0[0x8f] ; Ox2c7+=OxO57c0[0x90] ; Ox2c7+=OxO57c0[0x91] ; Ox2c7+=OxO57c0[0x92] ; Ox2c7+=OxO57c0[0x93] ; Ox2c7+=OxO57c0[0x94] ; _dialogPromptID[OxO57c0[0x31]]=Ox2c7 ; _dialogPromptID[OxO57c0[0x77]][OxO57c0[0x95]]=OxO57c0[0x96] ; _dialogPromptID[OxO57c0[0x77]][OxO57c0[0x98]]=parseInt((document[OxO57c0[0x7c]][OxO57c0[0x97]]-0x13b)/0x2)+OxO57c0[0x66] ; _dialogPromptID[OxO57c0[0x77]][OxO57c0[0x7a]]=OxO57c0[0x99] ;var Ox2c8=document.getElementById(OxO57c0[0x79]);try{var range=Ox2c8.createTextRange(); range.collapse(false) ; range.select() ;} catch(x){ Ox2c8.focus() ;} ;}  ;} ;if(CreateDir){ CreateDir[OxO57c0[0x1f]]= new Function(OxO57c0[0x9a]) ;} ;if(Copy){ Copy[OxO57c0[0x1f]]= new Function(OxO57c0[0x9a]) ;} ;if(Move){ Move[OxO57c0[0x1f]]= new Function(OxO57c0[0x9a]) ;} ;if(Delete){ Delete[OxO57c0[0x1f]]= new Function(OxO57c0[0x9a]) ;} ;if(DoRefresh){ DoRefresh[OxO57c0[0x1f]]= new Function(OxO57c0[0x9a]) ;} ;