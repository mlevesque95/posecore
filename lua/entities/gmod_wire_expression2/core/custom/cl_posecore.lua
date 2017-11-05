--E2helper Descriptions

--Flexes
E2Helper.Descriptions["setFlexWeight(e:sn)"] = "Sets a flex on an entity using the flexes name; much like the Finger and Face Poser tools. (Use holoEntity(N):setFlex to set flexes to holograms.) (Use e:getFlexName(n) to get it's name.)"
E2Helper.Descriptions["setFlexWeight(e:nn)"] = "Sets a flex on an entity using the flexes ID; much like the Finger and Face Poser tools. (Use holoEntity(N):setFlex to set flexes to holograms.) (Use e:getFlexID(s) to get it's ID.)"

E2Helper.Descriptions["getFlexID(e:s)"] = "Gives the ID of the flex by provided name."

E2Helper.Descriptions["getFlexName(e:n)"] = "Gives the name of the flex by provided ID."

E2Helper.Descriptions["getFlexScale(e:)"] = "Gives the overall flex scale for the provided entitys' model."

E2Helper.Descriptions["getFlexWeight(e:n)"] = "Gives the weight of the specified flex (By ID) of the provided entity."

E2Helper.Descriptions["getFlexCount(e:)"] = "Gives the amount of flexes the provided entity has."

E2Helper.Descriptions["setFlexScale(e:n)"] = "Sets the overall weight modifier for flexes."

E2Helper.Descriptions["setEyePos(e:v)"] = "Sets the aim position for a ragdoll/hologram. (Much like the Eye Poser tool.)"

--Bones
E2Helper.Descriptions["setBonePos(e:nv)"] = "Sets the position of the bone with the specified ID; belonging to the entity provided."

E2Helper.Descriptions["setBoneAng(e:na)"] = "Sets the angle of the bone with the specified ID; belonging to the entity provided."

E2Helper.Descriptions["setBoneScale(e:nv)"] = "Sets the scale (From 0 to 10) of the bone with the specified ID; belonging to the entity provided."

E2Helper.Descriptions["setBoneJiggle(e:nn)"] = "Sets the amount of jiggle (From 0 to 255) for the bone with the specified ID; belonging to the entity provided."

E2Helper.Descriptions["getBoneScale(e:n)"] = "Gives the manipulated scale of the bone with the specified ID; belonging to the entity provided. (Non-modified bones will return vec(1,1,1))"

E2Helper.Descriptions["getBoneAng(e:n)"] = "Gives the manipulated angle of the bone with the specified ID; belonging to the entity provided. (Works unlike B:angles() as this returns the manipulated angle from the original.)"

E2Helper.Descriptions["getBonePos(e:n)"] = "Gives the manipulated position of the bone with the specified ID; belonging to the entity provided. (Works unlike B:pos() as this returns the manipulated position from the original.)"

E2Helper.Descriptions["getBoneJiggle(e:n)"] = "Gives the jiggle amount of the bone with the specified ID; belonging to the entity provided."

--Anim
E2Helper.Descriptions["getAnimTime(e:)"] = "Gives the time (Relative to curtime(), between 0 and 1) the animation has been playing for."
