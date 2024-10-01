# Telestein3D (Raycaster in C/WebAssembly)
![](https://github.com/fvan-wij/Cub3d_Telestein3D/blob/main/telestein.gif)
Telestein3D (based on 42's project 'Cub3d') is a demo of a horror game that can be explored in first-person similar to the game Wolfenstein 3D.
Originally written in C and built specifically for Linux, but thanks to PepeLevi's (https://github.com/PepeLevi) MLX42_emcc Emscripten compliant fork of MLX42, I managed to port it to the web.

## Play Telestein3D
Click here to play in the browser: https://fvan-wij.github.io/Telestein3D_WebAssembly

_Features:_
- A ray-casting engine from scratch using mathematics;
- Custom post-processing algorithms + custom shaders (for render distance, dithering, custom pallette, etc.);
- 1 demo level 'Dark Secret' featuring melee combat, interactive TV, jumpscares, bossfight, and more;
- Custom sprites, sound-effects and music;
- In-game menu, with map-selection;
> [!NOTE]
> This is a ported version of Telestein3D and is currently less-stable than the original game written in C

## About Telestein3D
The Teletubbies have taken your children and your life turns into a literal nightmare. You're on a mission to take revenge and discover some truly dark secrets...

## Controls
_Player movement:_
- Walk: W,A,S,D
- Turn around: LEFT-ARROW / RIGHT-ARROW
- Sprint: SHIFT

_Interaction/Combat/Inventory:_
- Attack: SPACE
- Map: M
- Fists: 1
- Chainsaw: 2
- Interact TV: E

### Resources
Big thanks to lodev for his wonderful ray-casting tutorial:
https://lodev.org/cgtutor/raycasting.html
Massive thanks to PepeLevi (https://github.com/PepeLevi) for the MLX42_emcc Emscripten compliant fork of MLX42 <3

### Features

*Parsing*
- [x] consider skipping non-valid lines while reading the .cub file, check for duplicate elements and decide on appropriate behaviour;
- [x] check if the colors are in a valid format
- [x] write a function where I pass an array of characters and check if they are present in a string;
- [x] write a floodfill algorithm to validate the map, decide on a method to check which index has already been checked;
- [x] initialize mlx_textures in the parsing phase;
- [x] free and terminate the application in a clean way while parsing textures and colors
- [x] avoid passing the main struct to every function and seperate variables instead;
- [x] create seperate vector header?

*Raycaster*

- [x] consider writing the raycaster in a dynamic structure so that it can be used for multiple purposes
- [x] draw a 2d representation of the map
- [x] cast vertical and horizontal ray and determine distance between player and wall
- [x] implement circle-wall collision detection
- [ ] fix bug where circle-wall collision doesn't work for 45 degree angle at corner and refactor collision
- [x] fix overlapping sprites

*Gameplay* (Dark_Secret)
- [x] Add Foreshadowing jumpscare po
- [x] Add jumpscare, tree or shrub
- [x] Po dismemberment mechanic
- [x] Gasoline / fuel for chainsaw
- [x] chase soundtrack (danger)
- [x] Jumpscare sounds
- [x] Add finishing move on Po
- [x] Add exit on Dome entrance
- [x] Add end screen
- [x] Add health indicator
- [x] Add Po miniboss
- [x] Item pickups / Items ( Fuel, Chainsaw)
- [x] Death mechanic
- [x] Health stuff
- [x] Hit stuff
- [x] Add destructible walls

*Features*
- [x] Improve immersion by adding headbobbing on the Y-axis
- [x] Improve immersion by adding headbobbing to the hands on the X and Y-axis
- [x] Pressing M opens the map
- [x] Add dust particles
- [x] Add Po player-centered minimap
- [x] Add ambient soundtrack
- [x] Add menu soundtrack
- [x] Add event triggered sound
- [x] Add saw and smashing animations
- [x] Add continuous animation for saw + sound.
- [x] Implement textures
- [x] Slither some dither in
- [x] Add sprites

### Credits
Music, sounddesign and art by Flip van Wijk
Technical lead: Duco Ritsema

### Other sounds I did not create
Chainsaw Sound:
Sound Effect by <a href="https://pixabay.com/users/u_zpj3vbdres-31862813/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=128369">u_zpj3vbdres</a> from <a href="https://pixabay.com/sound-effects//?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=128369">Pixabay</a>

Pickup Sound:
Sound Effect from <a href="https://pixabay.com/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=37089">Pixabay</a>

Sound Effect by <a href="https://pixabay.com/users/soundreality-31074404/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=128320">Jurij</a> from <a href="https://pixabay.com//?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=128320">Pixabay</a>

Sound Effect by <a href="https://pixabay.com/users/soundsforyou-4861230/?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=129073">Mikhail</a> from <a href="https://pixabay.com//?utm_source=link-attribution&utm_medium=referral&utm_campaign=music&utm_content=129073">Pixabay</a>
