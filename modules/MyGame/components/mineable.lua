--- @class MineableComponent : Component
--- @field hits integer
local Mineable = prism.Component:extend("MineableComponent")
Mineable.name = "Mineable"

--- @param options {hits: integer}
function Mineable:__new(options)
    self.hits = options.hits
end

return Mineable
