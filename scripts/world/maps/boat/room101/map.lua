---@class Map.boat.room101 : Map
local map, super = Class(Map)

function map:onEnter()
  local img = self:getImageLayer("stars_big")
  local img1 = self:getImageLayer("stars_mid")
  local img2 = self:getImageLayer("stars_small")

  img.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
  img:setScale(1) -- sets the scale of the sprite
  img.physics.speed_x = 0.18 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  img1.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
  img1:setScale(1) -- sets the scale of the sprite
  img1.physics.speed_x = 0.25 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  img2.wrap_texture_x = true -- this infinitely wraps the texture horizontally when set to true
  img2:setScale(1) -- sets the scale of the sprite
  img2.physics.speed_x = 0.30 -- automatic scroll speed of the background. Change the number whatever you think is most suitable.

  --Game.world.camera.attached_x = false -- prevent next line from getting overridden
  --Game.world.camera.attached_y = false -- prevent next line from getting overridden
  --Game.world.camera.x = Game.world.height / 1.5
  --Game.world.camera.y = Game.world.height / 1.5
  
  self.window_layer = self:getTileLayer("window") ---@type TileLayer
  self.window_hitbox = self:getHitbox("i have no use") ---@type Hitbox
  self.window_hitbox.collidable = Plot:between("boat_act1_start", "boat_act3_room101_confrontation")
  self.window_layer.visible = self.window_hitbox.collidable
end

return map