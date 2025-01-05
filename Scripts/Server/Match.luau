local Match = {
    Teams = {
        ["Team1"] = nil;
        ["Team2"] = nil;
    };
    State = "Idling";
    LoopStart = false;
    LoopCoroutine = nil;
    --Rule = nil;

}
Match.__index = Match

function Match.new(Players:{})
    local self = setmetatable({},Match)
    return self
end

function Match:Start()
    --Send cutscene instructions to client
    self.State = "Starting"
    self.CanLoop = true
    self:StartLoop()
    --Loop start
    --Prompt decisions with timer
    --If timer runs out, the player will automatically make a move
    --Checks for player wins and status effects
    --Carries out actions and sends client replication requests
    --Checks again
    --If win condition then, set State to End and all custom player object's state is set to Idle
    --Loop end
end

function Match:StartLoop()
    if not self.LoopStart then
        return
    end

    self.LoopStart = false

    self.LoopCoroutine = coroutine.create(function()
        self:PromptDecisions()
        coroutine.yield()
        self:Checks()
        coroutine.yield()
        self:CarryOutActions()
        coroutine.yield()
        self:Checks(true)
    end)
end

function Match:PromptDecisions()
    

    task.wait(15)
    coroutine.resume(self.LoopCoroutine)
end

function Match:CarryOutActions()
    
end

function Match:CarryOutStatusEffectsAndEliminations(SecondCheck:boolean)
    if SecondCheck then
        --Do status effects
    end
    --Do eliminations
end

function Match:Checks(SecondCheck:boolean)
    self:CarryOutStatusEffectsAndEliminations(SecondCheck)
    --If win condition then (Checks for whole team dead state and player(s) leaving)
    --Prompt win text
    self:CleanUp()
    self.LoopCoroutine = nil
    --return
    --else
    self.LoopCoroutine = nil
    self.CanLoop = true
    self:StartLoop()
end

function Match:AddPlayer()
--Accepts custom player objects
end

function Match:RemovePlayer()
--Accepts custom player objects
end

function Match:CleanUp(Delete:boolean)
    self.Teams.Team1 = nil
    self.Teams.Team2 = nil
    --table.clear(self.Teams.Team1)
   -- table.clear(self.Teams.Team2)
    self.State = "End"
    --self.Rule = nil;
    
    if Delete then
        setmetatable(self,nil)
        table.clear(self)
    end
    --After end cutscene plays
    self.State = "Idling"
end