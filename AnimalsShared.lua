-- Decompiled with Medal in Seliware

local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v2 = v_u_1:WaitForChild("Packages")
require(v2.Trove)
local v_u_3 = require(v2.Observers)
local v_u_4 = require(v2.Trove)
local v5 = v_u_1:WaitForChild("Datas")
local v_u_6 = require(v5.Animals)
local v_u_7 = require(v5.Game)
require(v5.Rebirth)
local v_u_8 = require(v5.Rarities)
local v_u_9 = require(v5.Mutations)
require(v5.MutationsTextures)
local v_u_10 = require(v5.Traits)
local v_u_11 = v_u_1:WaitForChild("Animations").Animals
local v_u_12 = v_u_1:WaitForChild("MutationSurfaces")
local v_u_13 = v_u_1:WaitForChild("Models")
local v_u_14 = v_u_13.Animals
local v_u_15 = v_u_13.Traits
local v_u_16 = v_u_1:WaitForChild("Vfx").Traits
local v_u_17 = v_u_1:WaitForChild("Vfx")
local v_u_18 = {}
local v_u_19 = (Vector3.new(-1, 0.25, -1)).Unit
local function v_u_52(p20, p21)
    local v22 = (-1 / 0)
    local v23 = (-1 / 0)
    local v24 = (-1 / 0)
    local v25 = (1 / 0)
    local v26 = (1 / 0)
    local v27 = (1 / 0)
    for _, v28 in p20:GetDescendants() do
        if v28:IsA("BasePart") and (v28.Transparency < 1 and not p21[v28]) then
            local v29 = v28.CFrame
            local v30 = v28.Size * 0.5
            for v31 = -1, 1, 2 do
                for v32 = -1, 1, 2 do
                    for v33 = -1, 1, 2 do
                        local v34 = v30.X * v31
                        local v35 = v30.Y * v32
                        local v36 = v30.Z * v33
                        local v37 = v29:PointToWorldSpace((Vector3.new(v34, v35, v36)))
                        local v38 = v37.X
                        v26 = math.min(v26, v38)
                        local v39 = v37.Y
                        v27 = math.min(v27, v39)
                        local v40 = v37.Z
                        v25 = math.min(v25, v40)
                        local v41 = v37.X
                        v22 = math.max(v22, v41)
                        local v42 = v37.Y
                        v23 = math.max(v23, v42)
                        local v43 = v37.Z
                        v24 = math.max(v24, v43)
                    end
                end
            end
        end
    end
    local v44 = v22 - v26
    local v45 = v23 - v27
    local v46 = v24 - v25
    local v47 = Vector3.new(v44, v45, v46)
    local v48 = (v26 + v22) / 2
    local v49 = (v27 + v23) / 2
    local v50 = (v25 + v24) / 2
    local v51 = Vector3.new(v48, v49, v50)
    return CFrame.new(v51), v47
end
local function v_u_76(p53, p54, p55, p56, p57, p58)
    -- upvalues: (copy) v_u_52, (copy) v_u_19
    local v59 = p57 or 0.8
    local v60 = p58 or 0.5
    local v61 = {}
    if p54 == "Los Noobinis" then
        v61[p55["Cube.003"]] = true
    end
    local v62 = p55:FindFirstChild("FakeRootPart")
    if v62 then
        v61[v62] = true
    end
    local v63 = p54 == "Tacorita Bicicleta" and p55:FindFirstChild("RootPart")
    if v63 then
        v61[v63] = true
    end
    local _, v64 = v_u_52(p55, v61)
    if p54 == "Tacorita Bicicleta" then
        v59 = v59 + 0.2
    elseif p54 == "25" then
        v59 = v59 - 0.6
    elseif p54 == "Los Jolly Combinasionas" then
        v59 = v59 - 0.4
    elseif p54 == "Money Money Reindeer" then
        v59 = v59 + 0.2
    end
    local v65
    if p54 == "Tacorita Bicicleta" or (p54 == "W or L" or (p54 == "25" or (p54 == "Cocoa Assassino" or p54 == "Los Jolly Combinasionas"))) then
        local v66 = p55:GetPivot()
        local v67 = v64.Y * 0.5
        v65 = v66 + Vector3.new(0, v67, 0)
    else
        v65 = p55.PrimaryPart and p55.PrimaryPart.CFrame or p55:GetPivot()
    end
    local v68 = v64.X
    local v69 = v64.Y
    local v70 = v64.Z
    local v71 = math.max(v68, v69, v70)
    local v72 = v71 * 0.5
    local v73 = p56 * 0.5
    local v74 = math.rad(v73)
    local v75 = v72 / math.tan(v74) * v59
    p53.CFrame = CFrame.new((v65 * CFrame.new(v_u_19 * (v75 + v71 * v60))).Position, v65.Position)
end
function v_u_18.GetSellValue(_, p77)
    -- upvalues: (copy) v_u_18, (copy) v_u_7
    local v78 = v_u_18:GetPrice(p77) * v_u_7.Animal.SellModifier
    return math.ceil(v78)
end
function v_u_18.ApplyMutation(_, p_u_79, p80, p81, p82)
    -- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_12, (copy) v_u_17
    local v_u_83 = v_u_4.new()
    if p82 then
        v_u_83:Add(p_u_79.Destroying:Connect(function()
            -- upvalues: (copy) v_u_83
            v_u_83:Destroy()
        end))
    else
        v_u_83:Add(p_u_79.AncestryChanged:Connect(function(_, p84)
            -- upvalues: (copy) v_u_83
            if not p84 then
                v_u_83:Destroy()
            end
        end))
    end
    local v85 = v_u_9[p81]
    local v86 = v_u_12:FindFirstChild(p80)
    local v87 = p_u_79:GetAttribute((("%*Palette"):format(p81))) or (p_u_79:GetAttribute("Palette") or 1)
    local v88 = tonumber(v87) or 1
    local v89 = not (v85 and v85.Palettes[v88]) and 1 or v88
    local v90 = {}
    if p81 == "Rainbow" then
        v_u_83:Add(function()
            -- upvalues: (copy) p_u_79
            p_u_79:RemoveTag("RainbowModel")
        end)
        for _, v_u_91 in p_u_79:GetDescendants() do
            if v_u_91:IsA("BasePart") and not v_u_91:GetAttribute("IgnoreRainbowColor") then
                local v_u_92 = v_u_91:FindFirstChildOfClass("SurfaceAppearance")
                if v_u_92 then
                    v_u_83:Add(function()
                        -- upvalues: (copy) v_u_91, (copy) v_u_92
                        local v93 = v_u_91:FindFirstChildOfClass("SurfaceAppearance")
                        if v93 then
                            v93:Destroy()
                        end
                        v_u_92:Clone().Parent = v_u_91
                    end)
                else
                    local v_u_94 = v_u_91.Color
                    v_u_83:Add(function()
                        -- upvalues: (copy) v_u_91, (copy) v_u_94
                        v_u_91.Color = v_u_94
                    end)
                    local v_u_95 = v_u_91.MaterialVariant
                    if v_u_95 == "Strawberry Stud Light" or v_u_95 == "Strawberry Stud Dark" then
                        v_u_91.MaterialVariant = ""
                        v_u_83:Add(function()
                            -- upvalues: (copy) v_u_91, (copy) v_u_95
                            v_u_91.MaterialVariant = v_u_95
                        end)
                    end
                end
            end
        end
        p_u_79:AddTag("RainbowModel")
        ::l21::
        if p81 == "Lava" then
            for _, v_u_96 in p_u_79:GetDescendants() do
                if v_u_96:IsA("BasePart") and not v90[v_u_96] then
                    local v97 = v_u_96:GetAttribute((("%*IgnoreColor"):format(p81)))
                    local v98
                    if v97 == false then
                        v98 = false
                    else
                        v98 = v_u_96:GetAttribute("IgnoreColor") or v97
                    end
                    if not v98 and (v_u_96:GetAttribute((("%*Color"):format(p81))) or v_u_96:GetAttribute("Color")) == 1 then
                        local v_u_99 = v_u_96.Material
                        v_u_96.Material = Enum.Material.Neon
                        v_u_83:Add(function()
                            -- upvalues: (copy) v_u_96, (copy) v_u_99
                            v_u_96.Material = v_u_99
                        end)
                    end
                end
            end
        elseif p81 == "Galaxy" then
            for _, v_u_100 in p_u_79:GetDescendants() do
                if v_u_100:IsA("BasePart") and not v90[v_u_100] then
                    local v101 = v_u_100:GetAttribute((("%*IgnoreColor"):format(p81)))
                    local v102
                    if v101 == false then
                        v102 = false
                    else
                        v102 = v_u_100:GetAttribute("IgnoreColor") or v101
                    end
                    if not v102 then
                        if (v_u_100:GetAttribute((("%*Color"):format(p81))) or v_u_100:GetAttribute("Color")) == 1 then
                            local v_u_103 = v_u_100.Material
                            v_u_100.Material = Enum.Material.Neon
                            v_u_83:Add(function()
                                -- upvalues: (copy) v_u_100, (copy) v_u_103
                                v_u_100.Material = v_u_103
                            end)
                        end
                        local v_u_104 = v_u_100.MaterialVariant
                        v_u_100.MaterialVariant = "Galaxy Stud"
                        v_u_83:Add(function()
                            -- upvalues: (copy) v_u_100, (copy) v_u_104
                            v_u_100.MaterialVariant = v_u_104
                        end)
                    end
                end
            end
        elseif p81 == "YinYang" then
            for _, v_u_105 in p_u_79:GetDescendants() do
                if v_u_105:IsA("BasePart") and not v90[v_u_105] then
                    local v106 = v_u_105:GetAttribute((("%*IgnoreColor"):format(p81)))
                    local v107
                    if v106 == false then
                        v107 = false
                    else
                        v107 = v_u_105:GetAttribute("IgnoreColor") or v106
                    end
                    if not v107 then
                        local v108 = v_u_105:GetAttribute((("%*Color"):format(p81))) or (v_u_105:GetAttribute("Color") or 1)
                        if v108 == 3 and true or v108 == 4 then
                            local v_u_109 = v_u_105.Material
                            v_u_105.Material = Enum.Material.Neon
                            v_u_83:Add(function()
                                -- upvalues: (copy) v_u_105, (copy) v_u_109
                                v_u_105.Material = v_u_109
                            end)
                        end
                    end
                end
            end
        elseif p81 == "Radioactive" then
            for _, v_u_110 in p_u_79:GetDescendants() do
                if v_u_110:IsA("BasePart") and not v90[v_u_110] then
                    local v111 = v_u_110:GetAttribute((("%*IgnoreColor"):format(p81)))
                    local v112
                    if v111 == false then
                        v112 = false
                    else
                        v112 = v_u_110:GetAttribute("IgnoreColor") or v111
                    end
                    if not v112 then
                        local v_u_113 = v_u_110.MaterialVariant
                        local v_u_114 = v_u_110.Material
                        local v115 = v_u_110:GetAttribute((("%*Color"):format(p81))) or (v_u_110:GetAttribute("Color") or 1)
                        local v116
                        if v115 == 2 and v89 == 1 or v115 == 2 and v89 == 4 then
                            v116 = true
                        elseif v115 == 2 or v115 == 6 then
                            v116 = v89 == 5
                        else
                            v116 = false
                        end
                        if v116 then
                            v_u_110.Material = Enum.Material.Neon
                            v_u_83:Add(function()
                                -- upvalues: (copy) v_u_110, (copy) v_u_114
                                v_u_110.Material = v_u_114
                            end)
                        end
                        local v117 = v_u_110:GetAttribute((("%*Stud"):format(p81)))
                        if v117 == false or v_u_110.MaterialVariant ~= "Custom Stud" and v117 ~= true or v_u_110:GetAttribute((("%*Ignore"):format(p81))) then
                            if v117 == false then
                                v_u_110.MaterialVariant = ""
                                v_u_83:Add(function()
                                    -- upvalues: (copy) v_u_110, (copy) v_u_113
                                    v_u_110.MaterialVariant = v_u_113
                                end)
                            end
                        elseif v_u_110:GetAttribute((("%*MaterialMode"):format(p81))) == 2 or p_u_79:GetAttribute((("%*MaterialMode"):format(p81))) == 2 then
                            if v_u_110:GetAttribute((("%*Material"):format(p81))) == 2 or p_u_79:GetAttribute((("%*Material"):format(p81))) == 2 then
                                v_u_110.Material = Enum.Material.SmoothPlastic
                                v_u_110.MaterialVariant = "Radioactive Stud"
                                v_u_83:Add(function()
                                    -- upvalues: (copy) v_u_110, (copy) v_u_113, (copy) v_u_114
                                    v_u_110.MaterialVariant = v_u_113
                                    v_u_110.Material = v_u_114
                                end)
                            else
                                v_u_110.Material = Enum.Material.SmoothPlastic
                                v_u_110.MaterialVariant = "Radioactive Stud2"
                                v_u_83:Add(function()
                                    -- upvalues: (copy) v_u_110, (copy) v_u_113, (copy) v_u_114
                                    v_u_110.MaterialVariant = v_u_113
                                    v_u_110.Material = v_u_114
                                end)
                            end
                        elseif v115 ~= 2 and v115 ~= 6 then
                            if v_u_110:GetAttribute((("%*Material"):format(p81))) == 2 or p_u_79:GetAttribute((("%*Material"):format(p81))) == 2 then
                                v_u_110.Material = Enum.Material.SmoothPlastic
                                v_u_110.MaterialVariant = "Radioactive Stud"
                                v_u_83:Add(function()
                                    -- upvalues: (copy) v_u_110, (copy) v_u_113, (copy) v_u_114
                                    v_u_110.MaterialVariant = v_u_113
                                    v_u_110.Material = v_u_114
                                end)
                            else
                                v_u_110.Material = Enum.Material.SmoothPlastic
                                v_u_110.MaterialVariant = "Radioactive Stud2"
                                v_u_83:Add(function()
                                    -- upvalues: (copy) v_u_110, (copy) v_u_113, (copy) v_u_114
                                    v_u_110.MaterialVariant = v_u_113
                                    v_u_110.Material = v_u_114
                                end)
                            end
                        end
                    end
                end
            end
        end
        local v118 = v_u_17:FindFirstChild(p81)
        local v119 = p_u_79:FindFirstChild("VfxInstance")
        if v118 and v119 then
            for _, v120 in v118:GetChildren() do
                v_u_83:Clone(v120).Parent = v119
            end
        end
        return v_u_83:WrapClean()
    end
    for _, v_u_121 in p_u_79:GetDescendants() do
        if v_u_121:IsA("BasePart") then
            local v122 = v_u_121:GetAttribute((("%*IgnoreColor"):format(p81)))
            local v123
            if v122 == false then
                v123 = false
            else
                v123 = v_u_121:GetAttribute("IgnoreColor") or v122
            end
            if not v123 then
                local v124 = v85.Palettes[v89]
                local v125 = v85.Palettes[v89]
                local v126 = v_u_121:GetAttribute((("%*Color"):format(p81))) or (v_u_121:GetAttribute("Color") or 1)
                local v127 = tonumber(v126) or 1
                local v128 = v125[v127] or v124[v127]
                if not v128 then
                    local v129 = #v125
                    v128 = v125[math.clamp(v127, 1, v129)]
                end
                if v_u_121:GetAttribute("Neon") then
                    local v_u_130 = v_u_121.Color
                    v_u_121.Material = Enum.Material.Neon
                    v_u_83:Add(function()
                        -- upvalues: (copy) v_u_121, (copy) v_u_130
                        v_u_121.Material = v_u_130
                    end)
                end
                local v_u_131 = v_u_121:FindFirstChildOfClass("SurfaceAppearance")
                if v_u_131 then
                    v_u_131:Destroy()
                    if v86 then
                        local v132 = v_u_83:Clone(v86)
                        v132.Color = v128
                        v132.Parent = v_u_121
                    end
                    v_u_83:Add(function()
                        -- upvalues: (copy) v_u_121, (copy) v_u_131
                        local v133 = v_u_121:FindFirstChildOfClass("SurfaceAppearance")
                        if v133 then
                            v133:Destroy()
                        end
                        v_u_131:Clone().Parent = v_u_121
                    end)
                else
                    local v_u_134 = v_u_121.MaterialVariant
                    if v_u_134 == "Strawberry Stud Light" or v_u_134 == "Strawberry Stud Dark" then
                        v90[v_u_121] = true
                        v_u_121.MaterialVariant = ("%* Strawberry Stud Light"):format(p81)
                        v_u_83:Add(function()
                            -- upvalues: (copy) v_u_121, (copy) v_u_134
                            v_u_121.MaterialVariant = v_u_134
                        end)
                        if v_u_134 ~= "Strawberry Stud Light" then
                            goto l43
                        end
                    else
                        ::l43::
                        local v_u_135 = v_u_121.Color
                        v_u_121.Color = v128
                        v_u_83:Add(function()
                            -- upvalues: (copy) v_u_121, (copy) v_u_135
                            v_u_121.Color = v_u_135
                        end)
                    end
                end
            end
        end
    end
    goto l21
end
function v_u_18.ApplyTraits(_, p_u_136, p_u_137, p138)
    -- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_10, (copy) v_u_1, (copy) v_u_3, (copy) v_u_15, (copy) v_u_16
    local v_u_139 = v_u_4.new()
    local v_u_140 = {}
    for _, v141 in p138 do
        v_u_140[v141] = true
    end
    local v_u_142 = v_u_140.Skibidi
    if v_u_142 then
        v_u_142 = v_u_13.TraitsPerAnimal.Skibidi:FindFirstChild(p_u_137)
    end
    for _, v_u_143 in p138 do
        local function v154()
            -- upvalues: (ref) v_u_10, (copy) v_u_143, (ref) v_u_13, (copy) p_u_137, (copy) v_u_139, (copy) p_u_136, (ref) v_u_1, (ref) v_u_3
            if v_u_10[v_u_143] then
                local v144 = v_u_13.TraitsPerAnimal:FindFirstChild(v_u_143)
                if v144 then
                    local v145 = v144:FindFirstChild(p_u_137)
                    if v145 then
                        local v146 = v_u_139:Clone(v145)
                        v146.Name = ("_Trait.%*"):format(v_u_143)
                        for _, v147 in v146:GetChildren() do
                            local v148 = v147:FindFirstChildOfClass("Attachment")
                            if v148 then
                                local v149 = p_u_136:FindFirstChild(v148.Name, true)
                                if v149 then
                                    local v150 = Instance.new("RigidConstraint")
                                    v150.Attachment0 = v148
                                    v150.Attachment1 = v149
                                    v150.Parent = v147
                                end
                            end
                        end
                        v146.Parent = p_u_136
                        local v151 = (v_u_143 == "Jackolantern Pet" or v_u_143 == "Reindeer Pet") and v146:FindFirstChildWhichIsA("Animator", true)
                        if v151 then
                            v151:SetAttribute("Animation", (("Animations.Traits.%*"):format(v_u_143)))
                            v151:AddTag("ClientLoadAnimation")
                            local v_u_152 = v151:LoadAnimation(v_u_1.Animations.Traits[v_u_143].Walk)
                            v_u_139:Add(function()
                                -- upvalues: (copy) v_u_152
                                v_u_152:Stop(0)
                                v_u_152:Destroy()
                            end)
                            v_u_139:Add(v_u_3.observeAttribute(p_u_136, "Walking", function(p153)
                                -- upvalues: (copy) v_u_152
                                if p153 then
                                    if not v_u_152.IsPlaying then
                                        v_u_152:Play()
                                    end
                                elseif v_u_152.IsPlaying then
                                    v_u_152:Stop()
                                end
                                return nil
                            end))
                        end
                    end
                else
                    return
                end
            else
                return
            end
        end
        local function v169()
            -- upvalues: (ref) v_u_10, (copy) v_u_143, (ref) v_u_15, (copy) v_u_139, (copy) p_u_136, (copy) v_u_140, (copy) v_u_142
            local v155 = v_u_10[v_u_143]
            if v155 then
                local v156 = v_u_15:FindFirstChild(v_u_143)
                if v156 then
                    local v157 = v_u_139:Clone(v156)
                    v157.Name = ("_Trait.%*"):format(v_u_143)
                    for _, v158 in v157:GetChildren() do
                        local v159 = false
                        for _, v160 in v158:GetChildren() do
                            if v160:IsA("Attachment") then
                                local v161 = p_u_136:FindFirstChild(v160.Name, true)
                                if v161 then
                                    v159 = true
                                    local v162 = Vector3.new(0, 0, 0)
                                    if v_u_143 == "10B" and v_u_140["10B"] then
                                        v162 = v162 + Vector3.new(0, -1.459, 0)
                                    end
                                    if (v_u_143 == "Taco" or v_u_143 == "10B") and v_u_140["RIP Gravestone"] then
                                        v162 = v162 + Vector3.new(0, -3.582, 0)
                                    end
                                    if (v_u_143 == "Taco" or (v_u_143 == "10B" or v_u_143 == "RIP Gravestone")) and v_u_140["Matteo Hat"] then
                                        v162 = v162 + Vector3.new(0, -1.33, 0)
                                    end
                                    if (v_u_143 == "Taco" or (v_u_143 == "10B" or (v_u_143 == "Matteo Hat" or v_u_143 == "RIP Gravestone"))) and v_u_140["Santa Hat"] then
                                        v162 = v162 + Vector3.new(0, -1.534, 0)
                                    end
                                    if (v_u_143 == "Taco" or (v_u_143 == "10B" or (v_u_143 == "Matteo Hat" or (v_u_143 == "RIP Gravestone" or v_u_143 == "Santa Hat")))) and v_u_140["Witch Hat"] then
                                        v162 = v162 + Vector3.new(0, -2.45, 0)
                                    end
                                    if (v_u_143 == "Taco" or (v_u_143 == "10B" or (v_u_143 == "Matteo Hat" or (v_u_143 == "RIP Gravestone" or (v_u_143 == "Santa Hat" or v_u_143 == "Witch Hat"))))) and v_u_140.Sombrero then
                                        v162 = v162 + Vector3.new(0, -2.728, 0)
                                    end
                                    if (v_u_143 == "Taco" or (v_u_143 == "10B" or (v_u_143 == "Matteo Hat" or (v_u_143 == "RIP Gravestone" or (v_u_143 == "Santa Hat" or (v_u_143 == "Witch Hat" or v_u_143 == "Sombrero")))))) and v_u_140.Skibidi then
                                        local v163 = v160.Name
                                        if not string.find(v163, "Forward") then
                                            local v164 = string.find(v163, "Second")
                                            v163 = string.find(v163, "Third") and "ThirdForwardHatAttachment" or (v164 and "SecondForwardHatAttachment" or "ForwardHatAttachment")
                                        end
                                        local v165 = v_u_142:FindFirstChild(v163, true)
                                        if v165 then
                                            local v166 = -(v165.Parent.Size.Y * 0.5) + v165.Position.Y
                                            v162 = v162 + Vector3.new(0, v166, 0)
                                        end
                                    end
                                    if v162 ~= Vector3.new(0, 0, 0) then
                                        v160.Position = v160.Position + v162
                                    end
                                    local v167 = Instance.new("RigidConstraint")
                                    v167.Attachment0 = v160
                                    v167.Attachment1 = v161
                                    v167.Parent = v158
                                    if v155.Modify then
                                        v155.Modify(v158, v160, v161)
                                    end
                                end
                            end
                        end
                        if not v159 then
                            v158:Destroy()
                        end
                    end
                    v157.Parent = p_u_136
                    local v168 = v_u_140.Lightning and v157:FindFirstChildWhichIsA("Animator", true)
                    if v168 then
                        v168:SetAttribute("Animation", "Animations.Traits.Lightning")
                        v168:AddTag("ClientLoadAnimation")
                    end
                end
            else
                return
            end
        end
        local function v176()
            -- upvalues: (ref) v_u_10, (copy) v_u_143, (ref) v_u_16, (copy) p_u_136, (copy) v_u_139
            local v170 = v_u_10[v_u_143]
            if v170 then
                local v171 = v_u_16:FindFirstChild(v_u_143)
                if v171 then
                    for _, v172 in v171:GetChildren() do
                        local v173 = p_u_136:FindFirstChild(v172.Name)
                        if v173 then
                            local v174 = v_u_139:Clone(v172)
                            v174.Massless = true
                            v174.CanCollide = false
                            v174.CanQuery = false
                            v174.CanTouch = false
                            v174.Transparency = 1
                            v174.CFrame = v173.CFrame
                            local v175 = Instance.new("WeldConstraint", v174)
                            v175.Part0 = v173
                            v175.Part1 = v174
                            v174.Parent = p_u_136
                            v174.Name = ("_%*"):format(v172.Name)
                            if v170.ModifyVFX then
                                v170.ModifyVFX(v174, v173)
                            end
                        end
                    end
                end
            end
        end
        if v_u_143 ~= "Strawberry" or p_u_137 ~= "Strawberry Elephant" then
            v154()
            v169()
            v176()
            if v_u_143 == "Strawberry" then
                for _, v_u_177 in p_u_136:GetDescendants() do
                    if v_u_177:IsA("BasePart") then
                        local v_u_178 = v_u_177.MaterialVariant
                        local v_u_179 = v_u_177.Color
                        if v_u_177:HasTag("Strawberry") then
                            v_u_177.Color = Color3.fromRGB(255, 255, 255)
                            v_u_177.Material = Enum.Material.SmoothPlastic
                            v_u_177.MaterialVariant = "Strawberry Stud Light"
                            v_u_139:Add(function()
                                -- upvalues: (copy) v_u_177, (copy) v_u_178, (copy) v_u_179
                                v_u_177.MaterialVariant = v_u_178
                                v_u_177.Color = v_u_179
                            end)
                        end
                        if v_u_177:HasTag("Strawberry2") then
                            v_u_177.Color = Color3.fromRGB(193, 193, 193)
                            v_u_177.Material = Enum.Material.SmoothPlastic
                            v_u_177.MaterialVariant = "Strawberry Stud Light"
                            v_u_139:Add(function()
                                -- upvalues: (copy) v_u_177, (copy) v_u_178, (copy) v_u_179
                                v_u_177.MaterialVariant = v_u_178
                                v_u_177.Color = v_u_179
                            end)
                        end
                        if v_u_177:HasTag("Strawberry3") then
                            v_u_177.Color = Color3.fromRGB(147, 147, 147)
                            v_u_177.Material = Enum.Material.SmoothPlastic
                            v_u_177.MaterialVariant = "Strawberry Stud Light"
                            v_u_139:Add(function()
                                -- upvalues: (copy) v_u_177, (copy) v_u_178, (copy) v_u_179
                                v_u_177.MaterialVariant = v_u_178
                                v_u_177.Color = v_u_179
                            end)
                        end
                    end
                end
            end
        end
    end
    return v_u_139:WrapClean()
end
function v_u_18.GetAnimatedModel(_, p180, p181)
    -- upvalues: (copy) v_u_14, (copy) v_u_11
    local v182 = v_u_14:FindFirstChild(p180)
    if not v182 then
        warn((("Animal not found %* in model folder"):format(p180)))
        return nil
    end
    local v183 = v182:Clone()
    if v183.PrimaryPart then
        v183.PrimaryPart.Anchored = true
    end
    v183.Parent = workspace
    local v184 = v_u_11:FindFirstChild(p180)
    if v184 then
        v184 = v184:FindFirstChild(p181)
    end
    local v185 = v183:FindFirstChild("AnimationController") or Instance.new("AnimationController", v183)
    local v186 = v185:FindFirstChild("Animator") or Instance.new("Animator", v185)
    if v184 and v186 then
        local v187 = v186:LoadAnimation(v184)
        v187.Looped = true
        v187:Play()
    end
    for _, v188 in v183:GetDescendants() do
        if v188:IsA("BasePart") then
            v188.Massless = true
            v188.CanCollide = false
            v188.CanQuery = false
            v188.CanTouch = false
            v188.Anchored = false
        end
    end
    return v183
end
function v_u_18.AttachOnViewportWithOptimizations(_, p_u_189, p_u_190, _, p191, _)
    -- upvalues: (copy) v_u_4, (copy) v_u_14, (copy) v_u_18, (copy) v_u_3, (copy) v_u_11, (copy) v_u_76
    local v_u_192 = v_u_4.new()
    local v193 = v_u_14:FindFirstChild(p_u_189)
    if not v193 then
        warn((("Animal not found %* in model folder"):format(p_u_189)))
        return v_u_192
    end
    local v_u_194 = v_u_192:Clone(v193)
    local v_u_195 = v_u_192:Add(Instance.new("WorldModel"))
    v_u_194.Parent = v_u_195
    local v_u_196 = true
    v_u_192:Add(function()
        -- upvalues: (ref) v_u_196
        v_u_196 = false
    end)
    v_u_192:Add(p_u_190.Destroying:Connect(function()
        -- upvalues: (copy) v_u_192
        v_u_192:Destroy()
    end))
    if p191 and p191 ~= "Default" then
        v_u_192:Add(v_u_18:ApplyMutation(v_u_194, p_u_189, p191))
    end
    local function v_u_197()
        -- upvalues: (ref) v_u_196, (copy) v_u_195
        if v_u_196 then
            v_u_195.Parent = nil
        end
    end
    local function v_u_207(p198)
        -- upvalues: (copy) v_u_197, (ref) v_u_3, (ref) v_u_196, (copy) v_u_195, (copy) p_u_190, (ref) v_u_11, (copy) p_u_189, (copy) v_u_194
        if p198 then
            local v199 = p198:FindFirstAncestorWhichIsA("LayerCollector")
            if v199 then
                local v_u_200 = v199:FindFirstChildWhichIsA("GuiObject")
                if v_u_200 then
                    return v_u_3.observeProperty(v199, "Enabled", function(p201)
                        -- upvalues: (ref) v_u_197, (ref) v_u_3, (copy) v_u_200, (ref) v_u_196, (ref) v_u_195, (ref) p_u_190, (ref) v_u_11, (ref) p_u_189, (ref) v_u_194
                        if p201 then
                            return v_u_3.observeProperty(v_u_200, "Visible", function(p202)
                                -- upvalues: (ref) v_u_197, (ref) v_u_196, (ref) v_u_195, (ref) p_u_190, (ref) v_u_11, (ref) p_u_189, (ref) v_u_194
                                if not p202 then
                                    return v_u_197
                                end
                                if v_u_196 then
                                    v_u_195.Parent = p_u_190
                                end
                                task.spawn(function()
                                    -- upvalues: (ref) v_u_196, (ref) v_u_11, (ref) p_u_189, (ref) v_u_194
                                    if v_u_196 then
                                        local v203 = v_u_11:FindFirstChild(p_u_189)
                                        if v203 then
                                            v203 = v203:FindFirstChild("Idle")
                                        end
                                        local v204 = v_u_194:FindFirstChild("AnimationController") or Instance.new("AnimationController", v_u_194)
                                        local v205 = v204:FindFirstChild("Animator") or Instance.new("Animator", v204)
                                        if v203 and v205 then
                                            local v206 = v205:LoadAnimation(v203)
                                            v206.Looped = true
                                            v206:Play(0)
                                        end
                                    end
                                end)
                                return v_u_197
                            end)
                        else
                            return v_u_197
                        end
                    end)
                else
                    return v_u_197
                end
            else
                return v_u_197
            end
        else
            return v_u_197
        end
    end
    local v_u_208 = nil
    v_u_192:Add(p_u_190.AncestryChanged:Connect(function(_, p209)
        -- upvalues: (ref) v_u_208, (copy) v_u_207
        local v210 = v_u_208
        if type(v210) == "function" then
            v_u_208()
        end
        v_u_208 = v_u_207(p209)
    end))
    if p_u_190.Parent then
        local v211 = p_u_190.Parent
        local v212 = v_u_208
        if type(v212) == "function" then
            v_u_208()
        end
        v_u_208 = v_u_207(v211)
    end
    local v213 = v_u_192:Add(Instance.new("Camera"))
    v213.FieldOfView = 50
    v213.Parent = p_u_190
    p_u_190.CurrentCamera = v213
    v_u_76(v213, p_u_189, v_u_194, v213.FieldOfView, 0.75, 0.7)
    return v_u_192, v_u_194
end
function v_u_18.AttachOnViewport(_, p214, p215, _, p216, _)
    -- upvalues: (copy) v_u_18, (copy) v_u_4, (copy) v_u_14, (copy) v_u_11, (copy) v_u_76
    return v_u_18:AttachOnViewportWithOptimizations(p214, p215, nil, p216)
end
function v_u_18.GetListOfRarity(_, p217)
    -- upvalues: (copy) v_u_6
    local v218 = {}
    for v219, v220 in v_u_6 do
        if v220.Rarity == p217 then
            table.insert(v218, v219)
        end
    end
    return v218
end
function v_u_18.GetList(_, p221, p_u_222)
    -- upvalues: (copy) v_u_6, (copy) v_u_8
    local v223 = {}
    for v224, v225 in v_u_6 do
        if not v225.IsEnabled or v225.IsEnabled() then
            table.insert(v223, v224)
        end
    end
    if p221 == "Rarity" then
        table.sort(v223, function(p226, p227)
            -- upvalues: (ref) v_u_6, (ref) v_u_8, (copy) p_u_222
            local v228 = v_u_6[p226]
            local v229 = v_u_6[p227]
            if v228 then
                v228 = v228.Rarity
            end
            if v229 then
                v229 = v229.Rarity
            end
            local v230 = v228 and (v_u_8[v228] and v_u_8[v228].Weight) or 0
            local v231 = v229 and (v_u_8[v229] and v_u_8[v229].Weight) or 0
            if p_u_222 then
                return v230 < v231
            else
                return v231 < v230
            end
        end)
        return v223
    elseif p221 == "Price" then
        table.sort(v223, function(p232, p233)
            -- upvalues: (ref) v_u_6, (copy) p_u_222
            local v234 = v_u_6[p232]
            local v235 = v_u_6[p233]
            local v236 = v234 and v234.Price or 0
            local v237 = v235 and v235.Price or 0
            if p_u_222 then
                return v236 < v237
            else
                return v237 < v236
            end
        end)
        return v223
    else
        if p221 == "Generation" then
            table.sort(v223, function(p238, p239)
                -- upvalues: (ref) v_u_6, (copy) p_u_222
                local v240 = v_u_6[p238]
                local v241 = v_u_6[p239]
                local v242 = v240 and v240.Generation or 0
                local v243 = v241 and v241.Generation or 0
                if p_u_222 then
                    return v242 < v243
                else
                    return v243 < v242
                end
            end)
        end
        return v223
    end
end
function v_u_18.GetGeneration(_, p244, p245, p246, p247)
    -- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_9, (copy) v_u_10, (copy) v_u_1
    local v248 = 0
    local v249 = v_u_6[p244]
    if not v249 then
        return v248
    end
    local v250
    if v249.Generation then
        v250 = v248 + v249.Generation
    else
        v250 = v248 + v249.Price * v_u_7.Game.AnimalGanerationModifier
    end
    local v251 = 1
    if p245 then
        v251 = v251 + v_u_9[p245].Modifier
    end
    local v252 = false
    if p246 then
        for _, v253 in p246 do
            local v254 = v_u_10[v253]
            if v254 then
                if v253 == "Sleepy" then
                    v252 = true
                else
                    v251 = v251 + v254.MultiplierModifier
                end
            end
        end
    end
    local v255 = v250 * v251
    if v252 then
        v255 = v255 * 0.5
    end
    if p247 then
        v255 = v255 * require(v_u_1.Shared.Game):GetPlayerCashMultiplayer(p247)
    end
    return math.round(v255)
end
function v_u_18.GetPrice(_, p256, _)
    -- upvalues: (copy) v_u_6
    return v_u_6[p256].Price
end
function v_u_18.GetRarityStringFormat(_, p257)
    -- upvalues: (copy) v_u_8
    local v258 = v_u_8[p257]
    return p257 == "OG" and "<og>%s</og>" or (p257 == "Festive" and "<greenred>%s</greenred>" or ((p257 == "Admin" or (p257 == "Taco" or p257 == "Spooky")) and "<yellowred>%s</yellowred>" or (p257 == "Secret" and "<zebra>%s</zebra>" or (p257 == "Brainrot God" and "<rainbow>%s</rainbow>" or (not v258 and "%s" or ("<font color=\"#%*\">%%s</font>"):format((v258.Color:ToHex())))))))
end
return v_u_18
