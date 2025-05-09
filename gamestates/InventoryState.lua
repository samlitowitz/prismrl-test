local keybindings = require("keybindingschema")

--- @class InventoryState : GameState
local InventoryState = spectrum.GameState:extend("InventoryState")

--- @param decision ActionDecision
--- @param level Level
--- @param inventory InventoryComponent
function InventoryState:__new(decision, level, inventory)
    self.decision = decision
    self.level = level
    self.items = inventory.inventory:getAllActors()
    self.letters = {}
    for i = 1, #self.items do
        self.letters[i] = string.char(96 + i)
    end
end

function InventoryState:draw()
    love.graphics.print("Inventory:", 20, 20)
    for i, item in ipairs(self.items) do
        local letter = self.letters[i]
        love.graphics.print(("[%s] %s"):format(letter, item.name), 40, 20 + i * 20)
    end
end

function InventoryState:keypressed(key)
    for i, letter in ipairs(self.letters) do
        if key == letter then
            local pressedItem = self.items[i]
            local drop = prism.actions.Drop(self.decision.actor, { pressedItem })
            if drop:canPerform(self.level) then
                self.decision:setAction(drop)
            end
            self.manager:pop()
            return
        end
    end

    if keybindings:keypressed(key) == "inventory" then
        self.manager:pop()
    end
end

return InventoryState