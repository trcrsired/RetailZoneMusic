local LibStub = LibStub
local AceAddon = LibStub("AceAddon-3.0")

local RetailZoneMusic = AceAddon:NewAddon("RetailZoneMusic","AceEvent-3.0","AceTimer-3.0","AceConsole-3.0")
local GetZoneText = GetZoneText
local GetSubZoneText = GetSubZoneText

local zoneid_music_map =
{
[1519] =
{
{"sound\\music\\citymusic\\stormwind\\stormwind_intro-moment.mp3",66.855}, -- "sound\\music\\citymusic\\stormwind\\stormwind_intro-moment.mp3"
{"sound\\music\\citymusic\\stormwind\\stormwind_highseas-moment.mp3",133.174},
{"sound\\music\\citymusic\\stormwind\\stormwind01-moment.mp3",54.911},
{"sound\\music\\citymusic\\stormwind\\stormwind02-moment.mp3",35.658},
{"sound\\music\\citymusic\\stormwind\\stormwind03-moment.mp3",70.016},
{"sound\\music\\citymusic\\stormwind\\stormwind04-zone.mp3",62.408},
{"sound\\music\\citymusic\\stormwind\\stormwind05-zone.mp3",61.108},
{"sound\\music\\citymusic\\stormwind\\stormwind06-zone.mp3",53.761},
{"sound\\music\\citymusic\\stormwind\\stormwind07-zone.mp3",87.094},
{"sound\\music\\citymusic\\stormwind\\stormwind08-zone.mp3",77.369},
{"sound\\music\\musical moments\\sacred\\sacred01.mp3",16.358}, -- Cathedral of Light
{"sound\\music\\musical moments\\sacred\\sacred02.mp3",19.154}, -- Cathedral Square
{"sound\\music\\citymusic\\darnassus\\darnassus walking 1.mp3",85.075}, -- The Park
{"sound\\music\\citymusic\\darnassus\\darnassus walking 2.mp3",69.558},
{"sound\\music\\citymusic\\darnassus\\darnassus walking 3.mp3",67.703},
{"sound\\music\\cataclysm\\mus_stormwind_gu01.mp3",73.262},
{"sound\\music\\cataclysm\\mus_stormwind_gu02.mp3",38.342},
{"sound\\music\\cataclysm\\mus_stormwind_gu03.mp3",116.342},
{"sound\\music\\cataclysm\\mus_stormwind_gu04.mp3",66.158},
{"sound\\music\\cataclysm\\mus_cataclysm_ud07.mp3",111.668},
{"sound\\music\\cataclysm\\mus_cataclysm_un08.mp3",111.668},
{"sound\\music\\cataclysm\\mus_cataclysm_un09.mp3",111.668},
{"sound\\music\\pandaria\\mus_51_alliancebattlemarch_01.mp3",119.441},
{"sound\\music\\pandaria\\mus_51_alliancebattlemarch_02.mp3",119.057},
{"sound\\music\\pandaria\\mus_51_alliancebattlemarch_hero_01.mp3",119.681},
{"sound\\music\\pandaria\\mus_51_forthealliance_01.mp3",128.419},
{"sound\\music\\pandaria\\mus_51_forthealliance_02.mp3",100.507},
{"sound\\music\\pandaria\\mus_51_forthealliance_03.mp3",66.883},
{"sound\\music\\pandaria\\mus_51_forthealliance_04.mp3",67.363},
{"sound\\music\\pandaria\\mus_51_forthealliance_05.mp3",67.675},
{"sound\\music\\pandaria\\mus_51_forthealliance_hero_01.mp3",128.035},
{"sound\\music\\pandaria\\mus_51_jainahomeland_lyrical_01.mp3",107.369},
{"sound\\music\\pandaria\\mus_51_jainahomeland_lyrical_02.mp3",107.009},
{"sound\\music\\pandaria\\mus_51_jainahomeland_lyrical_hero_01.mp3",107.657},
{"sound\\music\\pandaria\\mus_51_jainahomeland_military_01.mp3",102.881},
{"sound\\music\\pandaria\\mus_51_jainahomeland_military_02.mp3",103.745},
{"sound\\music\\pandaria\\mus_51_jainahomeland_military_03.mp3",41.993},
{"sound\\music\\pandaria\\mus_51_jainahomeland_military_hero_01.mp3",104.033},
{"sound\\music\\legion\\mus_70_anduinpt1_a1.mp3",75.194},
{"sound\\music\\legion\\mus_70_anduinpt1_a2.mp3",113.247},
{"sound\\music\\legion\\mus_70_anduinpt1_b.mp3",140.992},
{"sound\\music\\legion\\mus_70_anduinpt1_c.mp3",137.964},
{"sound\\music\\legion\\mus_70_anduinpt1_d.mp3",90.436},
{"sound\\music\\legion\\mus_70_anduinpt1_e.mp3",71.096},
{"sound\\music\\legion\\mus_70_anduinpt1_h1.mp3",88.061},
{"sound\\music\\legion\\mus_70_anduinpt1_h2.mp3",115.962}
},
[1637] =
{
{"sound\\music\\citymusic\\orgrimmar\\orgrimmar_intro-moment.mp3",40.288}, --sound\\music\\citymusic\\orgrimmar\\orgrimmar_intro-moment.mp3
{"sound\\music\\citymusic\\orgrimmar\\orgrimmar01-moment.mp3",68.991},
{"sound\\music\\citymusic\\orgrimmar\\orgrimmar01-zone.mp3",68.943},
{"sound\\music\\citymusic\\orgrimmar\\orgrimmar02-moment.mp3",62.386},
{"sound\\music\\citymusic\\orgrimmar\\orgrimmar02-zone.mp3",62.386},
{"sound\\music\\cataclysm\\mus_durotara_gu01.mp3",124.765},
{"sound\\music\\cataclysm\\mus_durotara_gu02.mp3",101.701},
{"sound\\music\\cataclysm\\mus_durotara_gu03.mp3",101.701},
{"sound\\music\\cataclysm\\mus_durotarb_gu01.mp3",72.877},
{"sound\\music\\cataclysm\\mus_durotarb_gu02.mp3",72.181},
{"sound\\music\\cataclysm\\mus_durotarb_gu03.mp3",95.269},
{"sound\\music\\cataclysm\\mus_durotarb_gu04.mp3",95.269},
{"sound\\music\\cataclysm\\mus_durotarc_gu01.mp3",85.501},
{"sound\\music\\cataclysm\\mus_durotarc_gu02.mp3",85.501},
{"sound\\music\\cataclysm\\mus_durotarc_gu03.mp3",61.429},
{"sound\\music\\cataclysm\\mus_durotarc_gu04.mp3",61.357},
{"sound\\music\\cataclysm\\mus_durotard_gu01.mp3",84.877},
{"sound\\music\\cataclysm\\mus_durotard_gu02.mp3",84.973},
{"sound\\music\\pandaria\\mus_51_garroshtheme_a_01.mp3",163.913},
{"sound\\music\\pandaria\\mus_51_garroshtheme_a_02.mp3",166.193},
{"sound\\music\\pandaria\\mus_51_garroshtheme_a_hero_01.mp3",166.889},
{"sound\\music\\pandaria\\mus_51_garroshtheme_b_01.mp3",175.409},
{"sound\\music\\pandaria\\mus_51_garroshtheme_b_02.mp3",174.305},
{"sound\\music\\pandaria\\mus_51_garroshtheme_b_hero_01.mp3",175.121},
{"sound\\music\\pandaria\\mus_51_garroshtheme_big_divinebellfinale.mp3",123.420},
{"sound\\music\\battleforazeroth\\mus_80_vulpera_1_b.mp3",121.972},
{"sound\\music\\battleforazeroth\\mus_80_vulpera_1_c.mp3",95.794},
{"sound\\music\\battleforazeroth\\mus_80_vulpera_1_h.mp3",123.956},
{"sound\\music\\battleforazeroth\\mus_80_vulpera_2_d.mp3",39.026},
{"sound\\music\\battleforazeroth\\mus_80_vulpera_2_h.mp3",75.801}
}
}

local zone_tb_map_enus =
{
["Stormwind City"] = {1519,{["The Valley of Heroes"]=66.855,["Cathedral Square"]=19.154,["Stormwind Keep"]=45,["Cathedral of Light"]=16.358,["The Slaughtered Lamb"]=true}},
["Orgrimmar"] = {1637},
}

local zone_tb_map_zhcn =
{
["暴风城"] = {1519},
["奥格瑞玛"] = {1637},
}



local shuffle_order = {}
local order_pos = 0
local shuffle_order_n = 0
local random = random
local wipe = wipe

local function wipe(tb)
	for k,v in pairs(tb) do
		tb[k] = nil
	end
end

function RetailZoneMusic:OnInitialize()
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA","ZONE_CHANGED")
	self:RegisterEvent("ZONE_CHANGED")
	self:RegisterEvent("ZONE_CHANGED_INDOORS","ZONE_CHANGED")
	self:RegisterEvent("PLAYER_ENTERING_WORLD","ZONE_CHANGED")
	local locl = GetLocale()
	if locl == "zhCN" then
		self.zone_tb_map = zone_tb_map_zhcn
	else
		self.zone_tb_map = zone_tb_map_enus
	end
--	self:Print(shuffle_order,order_pos,random,random(1,100),wipe)
end

local function shuffle_order_playlist_n(tb)
	wipe(shuffle_order)
	order_pos = 0
	local n = 0
	for k,v in ipairs(tb) do
		n = n + 1
		shuffle_order[n] = n
	end
	for i = n,2,-1 do
		local r = random(1,i)
		local t = shuffle_order[r]
		shuffle_order[r] = shuffle_order[i]
		shuffle_order[i] = t
	end
	shuffle_order_n = n
end

function RetailZoneMusic:ScheduleASong(zi)
	if self.timer then
		self:CancelTimer(self.timer)
		self.timer = nil
	end
	local duration = zi[2]
	if duration > 2 then
		duration = duration - 2
	else
		duration = 0
	end
	self.timer = self:ScheduleTimer("PlayZoneMainRecursive",duration)
	if zi[0] == nil then
		PlayMusic(zi[1])
	end
end

function RetailZoneMusic:PlayZoneMainRecursive()
	local zonetb = self.currentzonetb
	if order_pos == 0 then
		shuffle_order_playlist_n(zonetb)
	end
	order_pos = order_pos + 1
	local current_item = shuffle_order[order_pos]
	self:ScheduleASong(zonetb[current_item])
	if order_pos == shuffle_order_n then
		order_pos = 0
	end
	if self.idlingzonetimer then
		self:CancelTimer(self.idlingzonetimer)
		self.idlingzonetimer = nil
	end
end


function RetailZoneMusic:StopRetailZoneMusic()
	self:CancelAllTimers()
	self.currentzonetb = nil
	wipe(shuffle_order)
	order_pos = 0
	shuffle_order_n = 0
	self.lastsubzonename = nil
	self.subzonetimer = nil
	self.timer = nil
	self.currentsubzonetb = nil
	StopMusic()
end

function RetailZoneMusic:PlayForANewZone(zonetb,subzones)
	if zonetb == self.currentzonetb then
		return
	end
	self:StopRetailZoneMusic()
	self.currentzonetb = zonetb
	self.currentsubzonetb = subzones
	if subzones then
		if self.subzonetimer == nil then
			self.subzonetimer = self:ScheduleRepeatingTimer("SubZoneTimer",0.01)
		end
		self:SUBZONE_CHANGED()
		return
	end
	self:PlayZoneMainRecursive()
end

function RetailZoneMusic:SUBZONE_CHANGED()
	local zonetext = GetZoneText()
	local currentsubzonetext = GetSubZoneText()
	if zonetext == nil or currentsubzonetext == nil then
		return
	end
	local subzones = self.currentsubzonetb
	self.lastsubzonename = currentsubzonetext
	if currentsubzonetext then
		local val = subzones[currentsubzonetext]
		if val then
			if val == true then -- Deal with The Slautered Lamb
				if self.idlingzonetimer then
					self:CancelTimer(self.idlingzonetimer)
					self.idlingzonetimer =nil
				end		
			else
				
				self.idlingzonetimer = self:ScheduleTimer("PlayZoneMainRecursive",val)
			end
			if self.timer then
				self:CancelTimer(self.timer)
				self.timer = nil
			end
			StopMusic()
			order_pos = 0
			return
		end
	end
	if self.timer == nil then
		self:PlayZoneMainRecursive()
	end
end

function RetailZoneMusic:ZONE_CHANGED()
	local zonetext = GetZoneText()
	if zonetext then
		local zone_tb_map = self.zone_tb_map
		local zoneidtb = zone_tb_map[zonetext]
		if zoneidtb then
			local ztb = zoneid_music_map[zoneidtb[1]]
			if ztb then
				self:PlayForANewZone(ztb,zoneidtb[2])
				return
			end
		end
	end
	self:StopRetailZoneMusic()
end

function RetailZoneMusic:SubZoneTimer()
	local subzonetext = GetSubZoneText()
	if subzonetext ~= self.lastsubzonename then
		self.lastsubzonename = subzonetext
		self:SUBZONE_CHANGED()
	end
end
