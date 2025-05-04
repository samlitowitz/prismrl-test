local MineTarget = prism.Target:extend("MineTarget")

--- @param owner Actor
--- @param params {cell: Cell, destination: Vector2}
function MineTarget:validate(owner, params)
    local cell = params.cell
    local destination = params.destination
    return cell:is(prism.Cell)
            and cell:hasComponent(prism.components.Collider)
            and cell:hasComponent(prism.components.Mineable)
            and owner:getRangeVec("8way", destination) == 1
end

---@class MineAction : Action
---@field name string
---@field targets Target[]
local Mine = prism.Action:extend("MineAction")
Mine.name = "mine"
Mine.targets = { MineTarget }
Mine.requiredComponents = {
    prism.components.Controller,
}
--- @param level Level
--- @param cell Cell
--- @param destination Vector2
function Mine:_canPerform(level, cell, destination)
    return true
end

--- @param level Level
--- @param params {cell: Cell, destination: Vector2}
function Mine:_perform(level, params)
    local cell = params.cell
    local destination = params.destination

    local mineable = cell:getComponent(prism.components.Mineable)
    mineable.hits = mineable.hits - 1
    if mineable.hits <= 0 then
        level:setCell(destination.x, destination.y, prism.cells.Floor())
        -- TODO: add some of the mined ore/item to the inventory of miner
        return
    end
    cell:removeComponent(prism.components.Mineable)
    cell:addComponent(mineable)
    level:setCell(destination.x, destination.y, cell)
end

return Mine