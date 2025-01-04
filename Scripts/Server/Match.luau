local Match = {
    Teams = {
        ["Team1"] = {};
        ["Team2"] = {};
    };
    State = "Idling";
    Rule = nil;

}
Match.__index = Match

function Match.new(Players:{})
    local self = setmetatable({},Match)
    return self
end

function Match:Start()
    --Send cutscene instructions to client
    --Prompt rule select
    --Wait until all players selected (With timer)
    self.State = "Starting"
    --Loop start
    --Prompt decisions with timer
    --If timer runs out, the player will automatically make a move
    --Checks for player wins and status effects
    --Carries out actions and sends client replication requests
    --Checks again
    --If win condition then, set State to End and all custom player object's state is set to Idle
    --Loop end
end

function Match:PromptChecks()
    
end

function Match:CarryOutActions()
    
end

function Match:Checks()
    
end

function Match:AddPlayer()
--Accepts custom player objects
end

function Match:RemovePlayer()
--Accepts custom player objects
end

function Match:CleanUp(Delete:boolean)
    table.clear(self.Teams.Team1)
    table.clear(self.Teams.Team2)
    self.State = "End"
    self.Rule = nil;
    
    if Delete then
        setmetatable(self,nil)
        table.clear(self)
    end
    --After end cutscene plays
    self.State = "Idling"
end