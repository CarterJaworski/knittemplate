local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

local function init_controllers()
    local function child_added(child)
        require(child)
    end 
    for _,child in pairs(ReplicatedStorage.Controllers:GetChildren()) do 
        child_added(child)
    end 
    ReplicatedStorage.Controllers.ChildAdded:connect(child_added)
end 

local function init()
    init_controllers()
    Knit.AddControllers(ReplicatedStorage.Controllers)
    Knit.Start({ServicePromises = false})
end 

init() 