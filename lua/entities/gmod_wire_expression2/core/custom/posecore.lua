--[=[PoseCore Functions
I don't have any sort of storage for used/current flexes but I assume they'll just overwrite / reset when set to 0.
Not bothering with anti-spam as to allow the possibility of talking animations

Created by http://steamcommunity.com/profiles/76561198047801753 
with help from http://steamcommunity.com/profiles/76561198075926617
]=]

--Registers the extension
E2Lib.RegisterExtension("posecore",true)

--Makes the functions cost 5
__e2setcost(5)

--FLEXES
--Sets a flex on an entity using it's name and the weight
e2function void entity:setFlexWeight(string flexparameter, number amount)
	--End if the entity or owner is not valid, or there's no available flexes
	if not IsValid(this) or not IsValid(self.player) then return end

	--If the player is an admin or the prop belongs to the E2 owner or a prop buddy of the E2 owner
	if (self.player:IsAdmin() || E2Lib.isOwner(self,this)) then
		--Some vars
		local flexID = this:GetFlexIDByName(flexparameter) --Converts the flex name to ID
		
		--Abort if there wasn't a flex by the given name
		if not flexID then return end
		
		amount = math.Clamp(amount, this:GetFlexBounds(flexID)) --Clamps the amount to prevent giant parts / etc

		--Attempts to set the flex
		this:SetFlexWeight(flexID,amount)
	end
end

--Same as above but for ID instead of name; little bit of different coding
e2function void entity:setFlexWeight(number flexparameter, number amount)
	flexparameter = math.floor(flexparameter)
	if not IsValid(this) or not IsValid(self.player) or flexparameter < 0 or flexparameter >= this:GetFlexNum() then return end

	if (self.player:IsAdmin() || E2Lib.isOwner(self,this)) then
		amount = math.Clamp(amount, this:GetFlexBounds(flexparameter))
		
		this:SetFlexWeight(flexparameter, amount)
	end
end

--Sets the global flex scale for an entity
e2function void entity:setFlexScale(number amount)
	if not IsValid(this) or not IsValid(self.player) or (this:GetFlexNum() == 0) then return end
	
	if (self.player:IsAdmin() || E2Lib.isOwner(self,this)) then
		amount = math.Clamp(amount, -5, 5) --Default range is -5 to 5, anything higher may cause crazy results
		
		--Attempts to set the flex scale
		this:SetFlexScale(amount)
	end
end

--Gets a flexes ID through its' name
e2function number entity:getFlexID(string name)
	if not IsValid(this) then return -1 end
	--Attempts to get the ID
	local ID = this:GetFlexIDByName(name)
	
	--Abort if no flex
	if not ID then return -1 end
	
	return ID
end

--Same as above but vice versa; Gets a flexes name through its' ID
e2function string entity:getFlexName(number id)
	id = math.floor(id)
	if not IsValid(this) or id < 0 or id >= this:GetFlexNum() then return '' end
	--Attempts to get the name
	local name = this:GetFlexName(id)
	
	--Abort if no flex
	if not name then return '' end
	
	return name
end

--Gets the flex scale of an entity
e2function number entity:getFlexScale()
	if not IsValid(this) or (this:GetFlexNum() == 0) then return -1 end
	--Returns the flex scale
	return this:GetFlexScale()
end

--Gets the flex weight of an entity
e2function number entity:getFlexWeight(number id)
	id = math.floor(id)
	if not IsValid(this) or id < 0 or id >= this:GetFlexNum() then return -1 end
	--Returns the weight of the specified flex
	return this:GetFlexWeight(id)
end

--Gets how many flexes an entity has
e2function number entity:getFlexCount()
	if not IsValid(this) then return -1 end
	--Returns the flex count
	return this:GetFlexNum()
end

--Sets the eye angles of an entity
e2function void entity:setEyePos(vector aimpos)
	if not IsValid(this) or not IsValid(self.player) then return end
	
	if (self.player:IsAdmin() || E2Lib.isOwner(self,this)) then
		--Attempts to aim they eyes of the entity to look at the given position vector
		this:SetEyeTarget(Vector(aimpos[1], aimpos[2], aimpos[3]))
	end
end

--ANIM FUNCTIONS
--Gets how far an animation has played so far (Relative to curtime())
e2function number entity:getAnimTime()
	if not IsValid(this) then return -1 end
	--Returns the time; if no animation is playing, it will return 0
	return this:GetCycle()
end

--BONE FUNCTIONS
__e2setcost(100) --High cost because (From gmod wiki: NOTE The repeated use of bone manipulation in multiplayer games is highly discouraged due to the huge produced network traffic.)

--Sets the position of the bone; position is relative to the bone position
e2function void entity:setBonePos(number bone, vector pos)
	bone = math.floor(bone)
	if not IsValid(this) or not IsValid(self.player) or bone < 0 or bone >= this:GetBoneCount() then return end
	
	if (self.player:IsAdmin() || E2Lib.isOwner(self,this)) then
		--Attempts to set the bones' position to the specified vector
		this:ManipulateBonePosition(bone, Vector(pos[1], pos[2], pos[3]))
	end
end

--Sets the angles of the bone; angle is relative to the bones' original angle
e2function void entity:setBoneAng(number bone, angle ang)
	bone = math.floor(bone)
	if not IsValid(this) or not IsValid(self.player) or bone < 0 or bone >= this:GetBoneCount() then return end
	
	if (self.player:IsAdmin() || E2Lib.isOwner(self,this)) then
		--Attempts to set the bones' angle to the specified ang
		this:ManipulateBoneAngles(bone, Angle(ang[1], ang[2], ang[3]))
	end
end

--Sets the scale of the bone
e2function void entity:setBoneScale(number bone, vector size)
	bone = math.floor(bone)
	if not IsValid(this) or not IsValid(self.player) or bone < 0 or bone >= this:GetBoneCount() then return end
	
	if (self.player:IsAdmin() || E2Lib.isOwner(self,this)) then
		local scale = Vector( math.Clamp(size[1],0,10) , math.Clamp(size[2],0,10) , math.Clamp(size[3],0,10) ) --Clamps the scale to 10 units because everyone knows this would be abused
		
		--Attempts to set the bones' scale to the specified vector
		this:ManipulateBoneScale(bone, scale)
	end
end

--Sets the bone jiggle amount
e2function void entity:setBoneJiggle(number bone, number amt)
	bone = math.floor(bone)
	amt = math.floor(math.Clamp(amt,0,255))
	if not IsValid(this) or not IsValid(self.player) or bone < 0 or bone >= this:GetBoneCount() then return end
	
	if (self.player:IsAdmin() || E2Lib.isOwner(self,this)) then
		--Attempts to set the bones' jiggle amount
		this:ManipulateBoneJiggle(bone, amt)
	end
end

__e2setcost(5) --Getting bone info isn't as expensive as setting it

--Gets the manipulated scale of the bone (works as if B:size() was a thing)
e2function vector entity:getBoneScale(number id)
	id = math.floor(id)
	if not IsValid(this) or id < 0 or id >= this:GetBoneCount() then return {-1,-1,-1} end
	
	--Returns the scale of the specified bone
	local scale = this:GetManipulateBoneScale(id)
	
	return {scale[1], scale[2], scale[3]}
end

--Gets the manipulated angle of the bone; Like B:angles() but instead shows the changed angle from the original
e2function angle entity:getBoneAng(number id)
	id = math.floor(id)
	if not IsValid(this) or id < 0 or id >= this:GetBoneCount() then return {-1,-1,-1} end
	
	--Returns the angle of the specified bone
	local ang = this:GetManipulateBoneAngles(id)

	return {ang[1], ang[2], ang[3]}
end

--Gets the manipulated position of the bone; Like B:pos() and B:toLocal(V) but instead shows the changed position from the original
e2function vector entity:getBonePos(number id)
	id = math.floor(id)
	if not IsValid(this) or id < 0 or id >= this:GetBoneCount() then return {-1,-1,-1} end
	
	--Returns the position of the specified bone
	local pos = this:GetManipulateBonePosition(id)
	
	return {pos[1], pos[2], pos[3]}
end

--Gets the jiggle amount of the bone
e2function number entity:getBoneJiggle(number id)
	id = math.floor(id)
	if not IsValid(this) or id < 0 or id >= this:GetBoneCount() then return -1 end
	
	--Returns the jiggle amount of the specified bone
	return this:GetManipulateBoneJiggle(id)
end