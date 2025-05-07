--- @class InventoryComponent : Component, IQueryable
--- @field inventory ActorStorage
local Inventory = prism.Component:extend("InventoryComponent")
Inventory.name = "Inventory"

function Inventory:__new()
    self.inventory = prism.ActorStorage()
end

function Inventory:query(...)
    return self.inventory.query(...)
end

--- @param actor Actor
function Inventory:hasItem(actor)
    return self.inventory:hasActor(actor)
end

--- @param actor Actor
function Inventory:addItem(actor)
    assert(actor:hasComponent(prism.components.Carryable))
    self.inventory:addActor(actor)
end

--- @param actor Actor
function Inventory:removeItem(actor)
    self.inventory.removeActor(actor)
end

return Inventory
