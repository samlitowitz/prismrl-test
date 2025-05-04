---@class OpaquePitCell : Cell
local OpaquePit = prism.Cell:extend("OpaquePitCell")
OpaquePit.name = "OpaquePit"

function OpaquePit:initialize()
  return {
    prism.components.Drawable(string.byte(" ") + 1),
    prism.components.Collider({ allowedMoveTypes = { "fly" }}),
    prism.components.Opaque(),
  }
end

return OpaquePit
