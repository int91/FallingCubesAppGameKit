# FallingCubesSrc
 Source Code for Falling Cubes
 
 Falling Cubes was written in BASIC using The Game Creator's "App Game Kit" framework.
 
 NOTE: Github says this project was written in ASSEMBLY. It was not written in ASSEMBLY, but since github doesn't have App Game Kit files in their language database it doesn't work and it just went with ASSEMBLY for whatever reason.
 
 It was honestly a lot of fun to work with and I enjoyed making the game so here's the source.
 It kind of uses it's own ecs-similar code base. Note how I said "similar" because each object type has its own update function. That's pretty much it for the ecs part of it. I know very intriguing lol.
 
 The object system works by using an array that stores a type, that being type entity. Then each object (player, enemy, etc.) is defined as an entity and fed into that array.
 Some player data is stored in global variables (to prevent the need to constantly type "player." or entities[player.Id].thisvar].)

 Basically to explain the game play it's just, enemy spawn, enemy fall, player moves to avoid enemies, when player contacts enemies, player dies.
 
 Also this game has no deltaTime but it's super simple to implement, I just didn't implement it since I figured I'd be the only one playing the game anyway. So have fun.
 
 NOTE: In the source code there is two files with "buildPlaceholder" or something similar. These files ARE NOT part of the game. They were part of a building system I was making to learn BASIC and App Game Kit
 
 This project was remade in:
 python3 (lost source)
 lua + love2D
 and I might make it in raylib with c++ later on
