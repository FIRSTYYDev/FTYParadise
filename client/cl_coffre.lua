function Coffreparadise()
    local ftyparadise = RageUI.CreateMenu("Coffre", "Paradise")
        RageUI.Visible(ftyparadise, not RageUI.Visible(ftyparadise))
            while ftyparadise do
            Citizen.Wait(0)
            RageUI.IsVisible(ftyparadise, true, true, true, function()

                RageUI.Separator("↓ Objet / Arme ↓")

                    RageUI.ButtonWithStyle("Déposer",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            TDeposerobjet()
                            RageUI.CloseAll()
                        end
                    end)
                    
                    RageUI.ButtonWithStyle("Retirer",nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
                        if Selected then
                            TRetirerobjet()
                            RageUI.CloseAll()
                        end
                    end)

                end, function()
                end)
            if not RageUI.Visible(ftyparadise) then
            ftyparadise = RMenu:DeleteType("ftyparadise", true)
        end
    end
end

Citizen.CreateThread(function()
        while true do
            local Timer = 500
            if ESX.PlayerData.job and ESX.PlayerData.job.name == 'paradise' then
            local plycrdjob = GetEntityCoords(GetPlayerPed(-1), false)
            local jobdist = Vdist(plycrdjob.x, plycrdjob.y, plycrdjob.z, paradise.position.coffre.position.x, paradise.position.coffre.position.y, paradise.position.coffre.position.z)
            if jobdist <= 10.0 and paradise.marker then
                Timer = 0
                DrawMarker(20, paradise.position.coffre.position.x, paradise.position.coffre.position.y, paradise.position.coffre.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 183, 0, 113, 255, 0, 1, 2, 0, nil, nil, 0)
                end
                if jobdist <= 1.0 then
                    Timer = 0
                        RageUI.Text({ message = "Appuyez sur ~y~[E]~s~ pour accéder au coffre", time_display = 1 })
                        if IsControlJustPressed(1,51) then
                        Coffreparadise()
                    end   
                end
            end 
        Citizen.Wait(Timer)   
    end
end)




local function KeyboardInput(string_args, iel, max)
    local string = nil
    AddTextEntry("CUSTOM_AMOUNT", "~s~"..string_args)
    DisplayOnscreenKeyboard(1, "CUSTOM_AMOUNT", "", "", "", "", "", max or 20)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        string = GetOnscreenKeyboardResult()
        Citizen.Wait(0)
    else
        Citizen.Wait(0)
    end
    return string
end    


local PlayersItem = {}
function TDeposerobjet()
    local StockPlayer = RageUI.CreateMenu("Coffre", "paradise")
    ESX.TriggerServerCallback('ftyparadise:getPlayerInventory', function(inventory)
        RageUI.Visible(StockPlayer, not RageUI.Visible(StockPlayer))
    while StockPlayer do
        Citizen.Wait(0)
            RageUI.IsVisible(StockPlayer, true, true, true, function()
                for i=1, #inventory.items, 1 do
                    if inventory ~= nil then
                         local item = inventory.items[i]
                            if item.count > 0 then
                                        RageUI.ButtonWithStyle(item.label, nil, {RightLabel = item.count}, true, function(Hovered, Active, Selected)
                                            if Selected then
                                            local count = KeyboardInput("Combien ?", '' , 8)
                                            TriggerServerEvent('ftyparadise:putStockItems', item.name, tonumber(count))
                                            TDeposerobjet()
                                        end
                                    end)
                                end
                            else
                                RageUI.Separator('Chargement en cours')
                            end
                        end
                    end, function()
                    end)
                if not RageUI.Visible(StockPlayer) then
                StockPlayer = RMenu:DeleteType("Coffre", true)
            end
        end
    end)
end















itemstock = {}
function TRetirerobjet()
    local Stockparadise = RageUI.CreateMenu("Coffre", "paradise")
    ESX.TriggerServerCallback('ftyparadise:getStockItems', function(items) 
    itemstock = items
   
    RageUI.Visible(Stockparadise, not RageUI.Visible(Stockparadise))
        while Stockparadise do
            Citizen.Wait(0)
                RageUI.IsVisible(Stockparadise, true, true, true, function()
                        for k,v in pairs(itemstock) do 
                            if v.count > 0 then
                            RageUI.ButtonWithStyle(v.label, nil, {RightLabel = v.count}, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local count = KeyboardInput("Combien ?", "", 2)
                                    TriggerServerEvent('ftyparadise:getStockItem', v.name, tonumber(count))
                                    TRetirerobjet()
                                end
                            end)
                        end
                    end
                end, function()
                end)
            if not RageUI.Visible(Stockparadise) then
            Stockparadise = RMenu:DeleteType("Coffre", true)
        end
    end
     end)
end














