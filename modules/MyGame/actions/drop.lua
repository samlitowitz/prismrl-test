--- @class DropTarget : Target
local DropTarget = prism.Target:extend("DropTarget")

function DropTarget:validate(owner, targetObject, targets)
    return targetObject:is(prism.Actor) and
            targetObject:hasComponent(prism.components.Carryable) and
            owner:expectComponent(prism.components.Inventory):hasItem(targetObject)
end

--- @class DropAction : Action
--- @class name string
--- @class targets Target[]
local Drop = prism.Action:extend("DropAction")
Drop.name = "drop"
Drop.targets = { DropTarget }
Drop.requiredComponents = {
    prism.components.Controller,
    prism.components.Inventory,
}

function Drop:_canPerform(level, item)
    return true
end

function Drop:_perform(level, item)
    local inventory = self.owner:expectComponent(prism.components.Inventory)
    inventory:removeItem(item)

    item.position = self.owner:getPosition()
    level:addActor(item)
end

return Drop