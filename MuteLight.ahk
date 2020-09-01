#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

IP := "192.168.1.169" ; <Enter your IP Address, use https://developers.meethue.com/develop/get-started-2/ to find it if you dont have it.>
USER := "o0WVwHgpvfhfaQh3sSbYDOWTjPL1Y1a7-z5BgXoH" ; <Your API User, use https://developers.meethue.com/develop/get-started-2/ to find it if you dont have it.>
LIGHT = 1 ; <The Number of the Light in your App. What number is it in the list.>
BRIGHT = 100 ; <Number Between 1 and 255, How Bright will the Light Be?>

WinHTTP := ComObjCreate("WinHTTP.WinHttpRequest.5.1")
lightsOn := 1
office := [%LIGHT%]
curgroup := office

; toggle all lights
f24::
	WinHTTP.Open("PUT", "http://" . IP . "/api/" . USER . "/groups/0/action", 0)
	if lightsOn > 0
		bodytext = {"on" : false, "transitiontime" : 0}
	else
		bodytext = {"on" : true, "transitiontime" : 0, "bri" : %BRIGHT%}
	WinHTTP.Send(bodytext)
	lightsOn := 1 - lightsOn
	Send {F22}
	return