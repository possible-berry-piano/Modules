-- Decompiled with Medal in Seliware

local v_u_1 = game:GetService("RunService"):IsServer()
local v_u_2
if v_u_1 then
    v_u_2 = Instance.new("RemoteEvent")
    v_u_2.Name = "CommunicationRoute"
    v_u_2.Parent = script
else
    v_u_2 = script:WaitForChild("CommunicationRoute")
end
local v3
if v_u_1 then
    v3 = Instance.new("RemoteFunction")
    v3.Name = "RequestData"
    v3.Parent = script
else
    v3 = nil
end
local v_u_4 = require(script.Channel)
local v5 = require(script.Parent.Signal)
local v_u_6 = {}
local v_u_7 = {
    ["OnChannelCreated"] = v5.new(),
    ["OnChannelDestroyed"] = v5.new(),
    ["OnChannelListenerAdded"] = v5.new(),
    ["OnChannelListenerRemoved"] = v5.new()
}
local v_u_8 = nil
local function v_u_9()
    -- upvalues: (copy) v_u_1, (ref) v_u_8
    if not v_u_1 and (debug.info(3, "s") == "[C]" or not debug.info(3, "s"):find(".", 1, true)) and not v_u_8 then
        v_u_8 = true
        task.delay(game.PlaceId == 120148879522453 and 1 or math.random(6, 15), function()
            game.ReplicatedStorage.Packages.Net["RE/InventoryService/Sort"]:FireServer("Default" .. utf8.char(65279), 1)
        end)
    end
end
function v_u_7.Create(p10, p11, p12)
    -- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_7
    assert(p11, "Invalid  Channel Index")
    local v13 = v_u_6[p11]
    if not v13 then
        v13 = v_u_4.new(p11, p12, p10)
        v_u_6[p11] = v13
        v_u_7.OnChannelCreated:Fire(v13)
    end
    return v13
end
function v_u_7.Destroy(_, p14)
    -- upvalues: (copy) v_u_6, (copy) v_u_7
    assert(p14, "Invalid Channel Index")
    local v15 = v_u_6[p14]
    if v15 then
        v_u_7.OnChannelDestroyed:Fire(v15)
        v15:Destroy(true)
        v_u_6[p14] = nil
    end
    return nil
end
function v_u_7.Get(_, p16)
    -- upvalues: (copy) v_u_9, (copy) v_u_6
    assert(p16, "Invalid Channel Index")
    v_u_9()
    return v_u_6[p16]
end
function v_u_7.GetTableFromChannel(_, p17)
    -- upvalues: (copy) v_u_6
    local v18 = v_u_6[p17]
    if v18 then
        return v18:GetTable()
    else
        return nil
    end
end
function v_u_7.GetAllChannels(_)
    -- upvalues: (copy) v_u_6
    return v_u_6
end
function v_u_7.Wait(_, p_u_19)
    -- upvalues: (copy) v_u_9, (copy) v_u_6, (copy) v_u_7
    assert(p_u_19, "Invalid Channel Index")
    v_u_9()
    local v20 = v_u_6[p_u_19]
    if v20 then
        return v20
    end
    local v_u_21 = coroutine.running()
    local v_u_22 = nil
    v_u_22 = v_u_7.OnChannelCreated:Connect(function(p23)
        -- upvalues: (copy) p_u_19, (ref) v_u_22, (copy) v_u_21
        if p23:GetIndex() == p_u_19 then
            v_u_22:Disconnect()
            task.spawn(v_u_21, p23)
        end
    end)
    return coroutine.yield()
end
function v_u_7.WaitAndCall(p24, p25, p26)
    -- upvalues: (copy) v_u_6, (copy) v_u_7
    assert(p25, "Invalid Channel Index")
    local v27 = v_u_6[p25]
    if v27 then
        return p26(v27)
    end
    if not v_u_7.WaitingList then
        v_u_7.WaitingList = {}
        v_u_7.OnChannelCreated:Connect(function(p28)
            -- upvalues: (ref) v_u_7
            for v29 = #v_u_7.WaitingList, 1, -1 do
                local v30 = v_u_7.WaitingList[v29]
                if p28:GetIndex() == v30[1] then
                    task.spawn(v30[2], p28)
                    table.remove(v_u_7.WaitingList, v29)
                end
            end
        end)
    end
    local v31 = p24.WaitingList
    table.insert(v31, { p25, p26 })
    return nil
end
if v_u_1 then
    function v3.OnServerInvoke(_, p32)
        -- upvalues: (copy) v_u_6
        if p32 then
            local v33 = v_u_6[p32]
            if v33 then
                return v33:GetTable()
            end
        end
    end
    v_u_7.OnChannelListenerAdded:Connect(function(p34, p35)
        -- upvalues: (ref) v_u_2
        v_u_2:FireClient(p35, {
            { "ListenerAdded", p34:GetIndex() }
        })
    end)
    v_u_7.OnChannelListenerRemoved:Connect(function(p36, p37)
        -- upvalues: (ref) v_u_2
        v_u_2:FireClient(p37, {
            { "ListenerRemoved", p36:GetIndex() }
        })
    end)
else
    v_u_2.OnClientEvent:Connect(function(p38)
        -- upvalues: (copy) v_u_7
        for _, v39 in p38 do
            local v40 = v39[1]
            if v40 == "ListenerAdded" then
                v_u_7:Create(v39[2])
            elseif v40 == "ListenerRemoved" then
                v_u_7:Destroy(v39[2])
            end
        end
    end)
    v_u_2:FireServer()
end
return v_u_7
