--- @class RockCell : Cell
local Rock = prism.Cell:extend("RockCell")
Rock.name = "Rock" -- displayed in the user interface

function Rock:initialize()
  return {
    prism.components.Drawable(string.byte("#") + 1),
    prism.components.Collider({ allowedMoveTypes = {"fly"}}),
    prism.components.Opaque(),
    prism.components.Mineable({ hits = 1}),
  }
end

return Rock
