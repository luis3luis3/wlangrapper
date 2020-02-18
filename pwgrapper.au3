#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>


$CMD = "netsh wlan show profil > router.txt"
RunWait(@ComSpec & " /c " & $CMD,@ScriptDir,@SW_HIDE)
;Sleep(5000000000)

$count=0
While 1
;Datei einlesen
$f = FileOpen("router.txt")
; z.B. zweite Zeile der Datei auslesen
$count=$count + 1
$line = FileReadLine($f,$count)
if @error then ExitLoop

; alles hinter dem 10 Zeichen in der Zeile in der Variablen $str speichern
$str = StringMid($line,32)
$CMD2 = "netsh wlan show profil " & $str & " key=clear >> pw.txt"
RunWait(@ComSpec & " /c " & $CMD2,@ScriptDir,@SW_HIDE)

; String anzeigen
;msgbox (0,"",$str)
;FileHandle schlieﬂen

FileClose($f)

WEnd