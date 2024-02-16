local mod = RegisterMod("Eucharist Ladder", 1)
local game = Game() 

function mod:KeepLadder() 
    local level = game:GetLevel()
    if level:GetCurrentRoomIndex() == level:GetStartingRoomIndex() and level:GetAbsoluteStage() ~= LevelStage.STAGE8 then
        -- The stairway should always be present, so no need to check if it already exists
        Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.TALL_LADDER, 1, Vector(440, 160), Vector.Zero, nil)
    end 
end 

function mod:GrantStairway() -- grant the Stairway item
    local player = Isaac.GetPlayer(0)
    player:AddCollectible(CollectibleType.COLLECTIBLE_STAIRWAY, 0, false)
end

mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.KeepLadder) 
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, mod.GrantStairway)