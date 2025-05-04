local MineTarget = prism.Target:extend("MineTarget")

--- @param owner Actor
---@param cell Cell
function MineTarget:validate(owner, cell)
    return cell:is(prism.Cell)
        and cell:hasComponent(prism.components.Collider)
        and cell:hasComponent(prism.components.Mineable)
        and owner:getRange("8way", cell) == 1
end

---@class MineAction : Action
local Mine = prism.Action:extend("MineAction")
Mine.name = "mine"
Mine.targets = { MineTarget }
Mine.requiredComponents = {
    prism.components.Controller,
}
--- @param level Level
function Mine:_canPerform(level, cell)
    return true
end

--- @param level Level
--- @param mined Cell
function Mine:_perform(level, cell)
    -- remove some hp from mineable
    -- add some of the mined ore/item to the inventory of miner
    print("mine!")
end

return Mine