# Falling Cubes Written in App Game Kit
 Source Code for Falling Cubes
 
 Falling Cubes was written in BASIC using The Game Creator's "App Game Kit" framework.
 
 NOTE: Github says this project was written in ASSEMBLY. It was not written in ASSEMBLY, but since github doesn't have App Game Kit files in their language database so it defaulted to ASSEMBLY.
 
 Falling Cubes uses its own ecs-similar code base. The ecs-similar system is alike because each object type has its own update, create, and draw function(s).

 The object system works by declaring an array that stores a type, entity. Then each object (player, enemy, etc.) is defined as an entity and fed into that array.
 Variables such as PlayerLives, and PlayerID are stored in global variables to prevent re-typing "player." or entities[player.Id].thisvar].

 In layman's terms the player dodges cubes that fall from the air and if the player gets hit by a cube too many times they die.
 
 Falling Cubes has no deltaTime but it is locked to 60fps to help prevent issues that occur from not having deltaTime.
 
 NOTE: In the source code there are two files, buildplaceholder.agc and buildsystem.agc. These files ARE NOT part of the game. They were part of a building system that I was working on to help me learn BASIC and App Game Kit.
 
 This project was remade with python3 (lost source), lua + love2D, and I might make it in raylib with c++ later on.
