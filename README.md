## PoseCore extension

#### This extension is for the Expression2 part of the Wiremod addon for Garry's Mod; adding flex support as well as additional bone functions.

![alt text](https://dl.dropbox.com/s/18qnri9nqb2d1ds/icon128.png "Icon")


This repository is for tracking issues and other hotfixes.

Check out the workshop version here;
LINKHERE

Install the addon as any other addon into addons\\.


### Added Functions
Function | Description 
--- | --- 
e:setFlexWeight(s,n) | Sets a flex on an entity using the flexes name; much like the Finger and Face Poser tools. (Use holoEntity(N):setFlex to set flexes to holograms.) (Use e:getFlexName(n) to get it's name.)
e:setFlexWeight(n,n) | Sets a flex on an entity using the flexes ID; much like the Finger and Face Poser tools. (Use holoEntity(N):setFlex to set flexes to holograms.) (Use e:getFlexID(s) to get it's ID.)
e:getFlexID(s) | Gives the ID of the flex by provided name.
e:getFlexName(n) | Gives the name of the flex by provided ID.
e:getFlexScale() | Gives the overall flex scale for the provided entitys' model.
e:getFlexWeight(n) | Gives the weight of the specified flex (By ID) of the provided entity.
e:getFlexCount() | Gives the amount of flexes the provided entity has.
e:setFlexScale(n) | Sets the overall weight modifier for flexes.
e:setEyePos(v) | Sets the aim position for a ragdoll/hologram. (Much like the Eye Poser tool.)
Bones
e:setBonePos(n,v) | Sets the position of the bone with the specified ID; belonging to the entity provided.
e:setBoneAng(n,a) | Sets the angle of the bone with the specified ID; belonging to the entity provided.
e:setBoneScale(n,v) | Sets the scale (From 0 to 10) of the bone with the specified ID; belonging to the entity provided.
e:setBoneJiggle(n,n) | Sets the amount of jiggle (From 0 to 255) for the bone with the specified ID; belonging to the entity provided.
e:getBoneScale(n) | Gives the manipulated scale of the bone with the specified ID; belonging to the entity provided. (Non-modified bones will return vec(1,1,1))
e:getBoneAng(n) | Gives the manipulated angle of the bone with the specified ID; belonging to the entity provided. (Works unlike B:angles() as this returns the manipulated angle from the original.)
e:getBonePos(n) | Gives the manipulated position of the bone with the specified ID; belonging to the entity provided. (Works unlike B:pos() as this returns the manipulated position from the original.)
e:getBoneJiggle(n) | Gives the jiggle amount of the bone with the specified ID; belonging to the entity provided.
Anim
e:getAnimTime() | Gives the time (Relative to curtime(), between 0 and 1) the animation has been playing for.
