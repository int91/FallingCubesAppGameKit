# FallingCubesSrc
 Source Code for Falling Cubes
 
 Falling Cubes was written in BASIC using The Game Creator's "App Game Kit" framework.
 
 It was honestly a lot of fun to work with and I enjoyed making the game so here's the source.
 It kind of uses it's own ecs-similar code base. Note how I said "similar" because each object type has its own update function. That's pretty much it for the ecs part of it. I know very intriguing lol.
 
 The object system works by using an array that stores a type, that being type entity. Then each object (player, enemy, etc.) is defined as an entity and fed into that array.
 Some player data is stored in global variables (to prevent the need to constantly type "player." or entities[player.Id].thisvar].)

 Basically to explain the game play it's just, enemy spawn, enemy fall, player moves to avoid enemies, when player contacts enemies, player dies.
 
 This project was remade in:
 python3 (lost source)
 lua + love2D
 and I might make it in raylib with c++ later on
