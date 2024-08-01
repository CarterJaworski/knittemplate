local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local Knit = require(ReplicatedStorage.Packages.Knit)
local Services = ServerScriptService:FindFirstChild("Services")

local function init_services() 
    local function child_added(service: Script) 
        require(service)
    end 
    
    Services.ChildAdded:connect(child_added)
    for _,service in pairs(Services:GetChildren()) do 
        child_added(service)
    end 
end 

local function init() 
    init_services()
    Knit:Start() 
end 

init()