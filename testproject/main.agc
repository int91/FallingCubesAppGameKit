
// Project: AGK Test Project | Name: Falling Cubes
// Created: 01-20-2021
// Last Updated: 06-02-2021

windowSizeX = 1024
windowSizeY = 768 

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Falling Cubes - Tech Demo" )
SetWindowSize( windowSizeX, windowSizeY, 0 )
SetWindowAllowResize( 0 ) // allow the user to resize the window
SetDisplayAspect( 16.0/39.0 )

// set display properties
SetVirtualResolution( windowSizeX, windowSizeY ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 60, 0 )
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

#include "keys.agc"
#include "sprites.agc"
#include "colors.agc"
#include "scenemanager.agc"

gosub SpritesInit
gosub KeysInit
gosub ColorsInit
gosub SceneManagerInit

do
	//print(ScreenFPS)
	m.x = GetPointerX()
	m.y = GetPointerY()
	gosub SceneManagerUpdate
    Sync()
loop

DebugHandler:
	if (GetRawKeyPressed(KEY_F9))
		debugMode = not debugMode
	endif
	if (debugMode = 1)
		//SetSyncRate(120, 0)
		print(ScreenFPS())
		if (GetRawKeyPressed(KEY_F1))
			end
		endif
	endif
return
