--- @class CarryableComponent : Component
--- @field mass integer
local Carryable = prism.Component:extend("CarryableComponent")
Carryable.name = "Carryable"

--- @param options {mass: integer}
function Carryable:__new(options)
    self.mass = options.mass
end

return Carryable
