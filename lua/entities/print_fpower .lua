AddCSLuaFile()

ENT.PrintName = "F battery"
ENT.Type = "anim"
ENT.Author = "Sherlock"
ENT.Category = "YourRP"
ENT.Spawnable = true
ENT.AdminOnly = true

function ENT:Initialize()
if(SERVER)then
		self:SetModel("models/props_junk/gascan001a.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)

		local phys = self.Entity:GetPhysicsObject()

		if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(1)
	end
end
end

function ENT:PhysicsCollide( data, phys )
if(SERVER)then
local hit = data.HitEntity
iif(hit:GetClass() == "bm_print_a" || hit:GetClass() == "bm_print_b" || hit:GetClass() == "bm_print_c")||hit:GetClass()== "bm_print_b_donator" ||hit:GetClass()== "bm_print_b_donator2" then
hit:SetNWFloat("proc_power",hit:GetNWFloat("proc_power")+ 110)
-- HERE
if ( hit:GetNWFloat( "proc_power", 0 ) > 110 ) then -- <- if 110 is max of the bar
hit:SetNWFloat( "proc_power", 110 )
end
-- HERE
self:Remove()
end

end
end
