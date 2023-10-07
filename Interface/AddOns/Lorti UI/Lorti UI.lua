  --get the addon namespace
  local addon, ns = ...
  
  --generate a holder for the config data
  local cfg = CreateFrame("Frame")

  -----------------------------
  -- LORTI UI Sirus
  -----------------------------
  
  -- MINIMAP
for i, v in pairs({
	
	MinimapBorder,
	MiniMapMailBorder,
	MinimapBorderTop,
	MiniMapTrackingButtonBorder,
	QueueStatusMinimapButtonBorder,
	MiniMapBattlefieldBorder,
	MiniMapLFGFrameBorder,
	select(1, TimeManagerClockButton:GetRegions()),
	
	}) do
	
	v:SetVertexColor(.05, .05, .05)
	select(2, TimeManagerClockButton:GetRegions()):SetVertexColor(1,1,1)
end

  -- INTERACTIVE MINIMAP
	MinimapZoomIn:Hide()
	MinimapZoomOut:Hide()
	MiniMapWorldMapButton:Hide()
	MinimapZoneText:SetPoint("CENTER", Minimap, 0, 80)
	GameTimeFrame:Hide()
	GameTimeFrame:UnregisterAllEvents()
	GameTimeFrame.Show = kill
	Minimap:EnableMouseWheel(true)
	Minimap:SetScript("OnMouseWheel", function(self, z)
		local c = Minimap:GetZoom()
			if(z > 0 and c < 5) then
				Minimap:SetZoom(c + 1)
			elseif(z < 0 and c > 0) then
				Minimap:SetZoom(c - 1)
		end
	end)
	Minimap:SetScript("OnMouseUp", function(self, btn)
		if btn == "RightButton" then
			_G.GameTimeFrame:Click()
		elseif btn == "MiddleButton" then
			_G.ToggleDropDownMenu(1, nil, _G.MiniMapTrackingDropDown, self)
		else
			_G.Minimap_OnClick(self)
		end
	end)

  --[[ FRAMES
 local ef=CreateFrame("Frame")
   
      ef:RegisterEvent("ADDON_LOADED")
         ef:SetScript("OnEvent", function(self, event, addon)
             if(addon=="Blizzard_TimeManager") then
                 for i,v in pairs({

		PlayerFrameTexture,
   		TargetFrameTextureFrameTexture,
  		PetFrameTexture,
		PartyMemberFrame1Texture,
		PartyMemberFrame2Texture,
		PartyMemberFrame3Texture,
		PartyMemberFrame4Texture,
		PartyMemberFrame1PetFrameTexture,
		PartyMemberFrame2PetFrameTexture,
		PartyMemberFrame3PetFrameTexture,
		PartyMemberFrame4PetFrameTexture,
   		FocusFrameTextureFrameTexture,
   		TargetFrameToTTextureFrameTexture,
   		FocusFrameToTTextureFrameTexture,
		CastingBarFrameBorder,
		FocusFrameSpellBarBorder,
		TargetFrameSpellBarBorder,
		select(1, TimeManagerClockButton:GetRegions()), 
		select(1, GameTimeFrame:GetRegions()),

              }) do
  
                v:SetVertexColor(.05, .05, .05)
	end    
        self:UnregisterEvent("ADDON_LOADED")
        ef:SetScript("OnEvent", nil)
    end
end)

  ]]-- MAIN MENU BAR
for i,v in pairs({
   	
	BonusActionBarTexture0,
	BonusActionBarTexture1,
	MainMenuBarTexture0,
	MainMenuBarTexture1,
	MainMenuBarTexture2,
	MainMenuBarTexture3,
    MainMenuMaxLevelBar0,
	MainMenuMaxLevelBar1,
	MainMenuMaxLevelBar2,
	MainMenuMaxLevelBar3,
	MainMenuXPBarTextureLeftCap,
	MainMenuXPBarTextureRightCap,
	MainMenuXPBarTextureMid,
	MainMenuXPBarTexture0,
	MainMenuXPBarTexture1,
	MainMenuXPBarTexture2,
	MainMenuXPBarTexture3,
	ReputationWatchBarTexture0,
	ReputationWatchBarTexture1,
	ReputationWatchBarTexture2,
	ReputationWatchBarTexture3,
	ReputationXPBarTexture0,
	ReputationXPBarTexture1,
	ReputationXPBarTexture2,
	ReputationXPBarTexture3,
			
    }) do
  
    v:SetVertexColor(.2, .2, .2)
  
end 

  -- GRYPHONS LEFT/RIGHT
for i,v in pairs({
 
	MainMenuBarLeftEndCap,
	MainMenuBarRightEndCap, 

	}) do

	v:SetVertexColor(.35, .35, .35)
  	      
end 

  -----------------------------
  -- CONFIG
  -----------------------------

    cfg.textures = {
    normal            = "Interface\\AddOns\\Lorti UI\\media\\gloss",
    flash             = "Interface\\AddOns\\Lorti UI\\media\\flash",
    hover             = "Interface\\AddOns\\Lorti UI\\media\\hover",
    pushed            = "Interface\\AddOns\\Lorti UI\\media\\pushed",
    checked           = "Interface\\AddOns\\Lorti UI\\media\\checked",
    equipped          = "Interface\\AddOns\\Lorti UI\\media\\gloss_grey",
    buttonback        = "Interface\\AddOns\\Lorti UI\\media\\button_background",
    buttonbackflat    = "Interface\\AddOns\\Lorti UI\\media\\button_background_flat",
    outer_shadow      = "Interface\\AddOns\\Lorti UI\\media\\outer_shadow",
  }

    cfg.background = {
    showbg            = true,  --show an background image?
    showshadow        = true,   --show an outer shadow?
    useflatbackground = false,  --true uses plain flat color instead
    backgroundcolor   = { r = 0.3, g = 0.3, b = 0.3, a = 0.7},
    shadowcolor       = { r = 0, g = 0, b = 0, a = 0.9},
    classcolored      = false,
    inset             = 5, 
  }

  cfg.color = {
    normal            = { r = 0, g = 0, b = 0, a = 0.9},
    equipped          = { r = 0.3, g = 0.55, b = 0.1},
    classcolored      = false,
  }

  cfg.hotkeys = {
    show            = true,
    fontsize        = 12,
    pos1             = { a1 = "TOPRIGHT", x = 0, y = 0 }, 
    pos2             = { a1 = "TOPLEFT", x = 0, y = 0 }, 
  }

  cfg.macroname = {
    show            = true,
    fontsize        = 10, --12 default
    pos1             = { a1 = "BOTTOMLEFT", x = 0, y = 0 }, 
    pos2             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, 
  }

  cfg.itemcount = {
    show            = true,
    fontsize        = 12,
    pos1             = { a1 = "BOTTOMRIGHT", x = 0, y = 0 }, 
  }

  cfg.cooldown = {
    spacing         = 0,
  }

  cfg.font = "Fonts\\FRIZQT__.TTF"
  
  ns.cfg = cfg