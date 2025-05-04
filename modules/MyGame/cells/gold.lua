--- @class GoldCell : Cell
local Gold = prism.Cell:extend("GoldCell")
Gold.name = "Gold" -- displayed in the user interface

function Gold:initialize()
  return {
    prism.components.Drawable(string.byte("#") + 1, prism.Color4.fromHex(0xa67c00)),
    prism.components.Collider({ allowedMoveTypes = {"fly"}}),
    prism.components.Opaque(),
  }
end

return Gold
