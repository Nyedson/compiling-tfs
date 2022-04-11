local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end


local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	local guild = player:getGuild()
	local city = {}
			
	if msgcontains(msg, 'fight') then
		if Game.getStorageValue(PrivateWar.ActiveWar) < 1 then
		if guild then
			local guildId = guild:getId()
			for i = 1, #e_battlefields do
				table.insert(city, e_battlefields[i].name)
			end
			
			cities = ""
			for i = 1, #city do
				if i == #city then
					cities = cities.."{"..city[i].."}"
				elseif cities == "" then
					cities = "{"..city[i].."}, "
				elseif i+1 == #city then
					cities = cities.."{"..city[i].."} and "
				else
					cities = cities.."{"..city[i].."}, "
				end
			end
			
			if (player:getGuildLevel() >= 2) then
				entrosa_guild_id = guildId
				npcHandler:say('Perfect, do you got the following options to setup a fight: '..cities..', which one do you would like to choose?', cid)
				npcHandler.topic[cid] = 2
			else
				npcHandler:say('Sorry, do you need to be a guild leader to setup a fight.', cid)
				npcHandler.topic[cid] = 0
			end
		else
			npcHandler:say('You need to belong to a guild to setup a fight.', cid)
			npcHandler.topic[cid] = 0
		end
	else
		npcHandler:say('There is currently a war in progress. Wait for it to finish and come back with me.', cid)
		npcHandler.topic[cid] = 0
	end
	elseif npcHandler.topic[cid] == 2 then
		if entrosaNameToNumber(msg) ~= 0 then
			entrosa_city_id = entrosaNameToNumber(msg)
			
			npcHandler:say("All right, you've selected {"..msg.."} as your desired city to fight, do you would like to have the {area spells} (including diamond arrow) enabled on your fight? {yes} or {no}", cid)
			npcHandler.topic[cid] = 3
		else
			npcHandler:say('That city name is invalid, try again between the available cities: '..cities..'.', cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, 'yes') then
		if npcHandler.topic[cid] == 3 then
			entrosa_area_spells = true
			
			npcHandler:say("You have chosen {yes}, you would like to have runes on your fight? {yes} or {no}", cid)
			npcHandler.topic[cid] = 4
		elseif npcHandler.topic[cid] == 4 then
			entrosa_runes = true
			
			npcHandler:say("You have chosen {yes}, you would like to have the new potions on your fight? {yes} or {no}", cid)
			npcHandler.topic[cid] = 5
		elseif npcHandler.topic[cid] == 5 then
			entrosa_new_potions = true
			
			npcHandler:say("You've chosen {yes}, what limit of frags you would like to set? {50}, {100} or {150}", cid)
			npcHandler.topic[cid] = 8
		elseif npcHandler.topic[cid] == 11 then			
			npcHandler:say("Ok, and the enemy guild name is?", cid)
			npcHandler.topic[cid] = 12
		end
	elseif msgcontains(msg, 'no') then
		if npcHandler.topic[cid] == 3 then
			entrosa_area_spells = false
			
			npcHandler:say("You've chosen {no}, you would like to have runes on your fight? {yes} or {no}", cid)
			npcHandler.topic[cid] = 4
		elseif npcHandler.topic[cid] == 4 then
			entrosa_runes = false
			
			npcHandler:say("You've chosen {no}, you would like to have the new potions on your fight? {yes} or {no}", cid)
			npcHandler.topic[cid] = 5
		elseif npcHandler.topic[cid] == 5 then
			entrosa_new_potions = false
			
			npcHandler:say("You've chosen {no}, what limit of frags you would like to set? {50}, {100} or {150}", cid)
			npcHandler.topic[cid] = 8
		-- End conversation
		elseif npcHandler.topic[cid] == 11 then
			npcHandler:say("Then let's start again to setup your {fight}.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif npcHandler.topic[cid] == 8 then	
		if isInArray({"50", "100", "150"}, msg) then
			entrosa_frag_limit = msg
			npcHandler:say("Ok, and the exhausted for rings and amulets? {3}, {4}, {5}, {100} seconds or {no-limit}", cid)
			npcHandler.topic[cid] = 9
		
		else
			npcHandler:say("Sorry, your answer wasn't clear, what maximum frags you would like to set? {50}, {100}, or {150}", cid)
			npcHandler.topic[cid] = 8
		end
	elseif npcHandler.topic[cid] == 9 then	
		if isInArray({"3", "4", "5", "10", "100", "limitless"}, msg) then
			if msg == "limitless" then
				entrosa_exhausted = 0
				Game.setStorageValue(34378, 1)
			else
				entrosa_exhausted = tonumber(msg)
			end
			
			npcHandler:say("Ok, and the maximum players allowed at entrosa? {3}, {10}, {15}, {20}, {30}, {40}, {50} or {unlimited} players", cid)
			npcHandler.topic[cid] = 10
		else
			npcHandler:say("Sorry, your answer wasn't clear, what exhausted do you want for rings and amulets? {1}, {2}, {3}, {4}, {5}, {10} seconds or {limitless}", cid)
			npcHandler.topic[cid] = 8
		end
	elseif npcHandler.topic[cid] == 10 then
		if isInArray({"3", "10", "15", "20", "30", "40", "50", "unlimited"}, msg) then
			if msg == "unlimited" then
				entrosa_player_limit = 0
			else
				entrosa_player_limit = tonumber(msg)
			end
			
			if entrosa_area_spells == false then
				areaSpells = "Area Spells Disabled"
			else
				areaSpells = "Area Spells Enabled"
			end
			
			if entrosa_runes == false then
				e_runes = "Runes Disabled"
			else
				e_runes = "Runes Enabled"
			end
			
			if entrosa_new_potions == false then
				newPotions = "New Potions Disabled"
			else
				newPotions = "New Potions Enabled"
			end
			
			if entrosa_imbuements == false then
				imbuements = "Imbuements Disabled"
			else
				imbuements = "Imbuements Enabled"
			end
			
			if e_isString(entrosa_maximum_level) then
				entranceLevel = "limitless level"
			else
				entranceLevel = "maximum level of ["..entrosa_maximum_level.."]"
			end
			
			if (entrosa_exhausted == 0) then
				amuletsAndRings = "no-limit to equip items"
			else
				amuletsAndRings = "and a limit of "..entrosa_exhausted.." seconds to equip items"
			end

			if (entrosa_player_limit == 0) then
				maxPlayers = "unlimited players"
			else
				maxPlayers = "maximum "..entrosa_player_limit.." players inside per team"
			end
			
			npcHandler:say("Ok, then, you've selected "..entrosaCityName(entrosa_city_id).." as the city to fight with the following options: "..areaSpells..", "..e_runes..", "..imbuements..", "..amuletsAndRings.." and "..newPotions.."... With "..maxPlayers.." and "..entrosa_frag_limit.." as maximum frags, everything is correct to start?", cid)

			npcHandler.topic[cid] = 11
		else
			npcHandler:say("Sorry, your answer wasn't clear, what maximum players should allowed at entrosa? {3}, {20}, {30}, {40}, {50}, {100}, or {unlimited} players", cid)
			npcHandler.topic[cid] = 10
		end
	elseif npcHandler.topic[cid] == 12 then
		if (entrosa_maximum_level == "limitless") then
			e_level = 1
		else
			e_level = entrosa_maximum_level
		end
		
		if (entrosa_exhausted == "limitless") then
			e_exhausted = 1
		else
			e_exhausted = entrosa_exhausted
		end
		
		if (entrosa_player_limit == "unlimited") then
			e_max_players = 1
		else
			e_max_players = entrosa_player_limit
		end
		
		if guildExist(msg) and player:getGuild():getName() ~= msg then
			if player:isOnWarSystem(msg) then
				local entrosa_war_guild = e_getGuildId(msg)
				npcHandler:say("All right, the battle is set and the invitation has been sent, keep on mind that the enemy leader must {accept} the invitation between the following {5 minutes}, after that you will need to create another setup for another fight.", cid)
				setEntrosaOptions(entrosa_city_id, entrosa_guild_id, entrosa_war_guild, 1, 0, entrosa_area_spells, entrosa_runes, entrosa_new_potions, e_level, entrosa_frag_limit, e_exhausted * 1000, e_max_players, entrosa_imbuements)
				sendEntrosaInvitation(msg, entrosa_guild_id, entrosa_city_id, entrosa_frag_limit, e_max_players, entrosa_imbuements, e_exhausted)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("Sorry, you can't invite a guild that isn't at a war with you.", cid)
				npcHandler.topic[cid] = 12
			end
		else
			npcHandler:say("Sorry, that guild doesn't exist or is the name of your guild, please be clear with the name.", cid)
			npcHandler.topic[cid] = 12
		end
	end
end

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|, I'm the NPC that's a charge of the War AntiEntrosa, do you want to setup a {fight}?")
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye, |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'How rude!')

local function onReleaseFocus(cid)
	npcHandler.topic[cid] = nil
end

local focusModule = FocusModule:new()
focusModule:addGreetMessage('hello')
focusModule:addGreetMessage('hi')
npcHandler:addModule(focusModule)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_ONRELEASEFOCUS, onReleaseFocus)