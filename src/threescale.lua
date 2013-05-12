-- http://lua-users.org/wiki/ObjectOrientationClosureApproach
mariner = {}

function mariner.new ()
   local self = {}

   self.maxhp = 200
   self.hp = self.maxhp

   function self:heal (deltahp)
      self.hp = math.min (self.maxhp, self.hp + deltahp)
   end
   function self:sethp (newhp)
      self.hp = math.min (self.maxhp, newhp)
   end

   return self
end

-- Application:
local m1 = mariner.new ()
local m2 = mariner.new ()
m1:sethp (100)
m1:heal (13)
m2:sethp (90)
m2:heal (5)
print ("Mariner 1 has got "..m1.hp.." hit points")
print ("Mariner 2 has got "..m2.hp.." hit points")
